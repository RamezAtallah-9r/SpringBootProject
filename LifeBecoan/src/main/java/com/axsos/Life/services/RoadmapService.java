package com.axsos.Life.services;

import com.axsos.Life.models.*;
import com.axsos.Life.models.*;
import com.axsos.Life.repositories.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.*;
import java.util.*;
import static com.axsos.Life.models.Enums.*;

@Service
public class RoadmapService {
	private final RoadmapRepository roadmaps;
	private final HealthProfileRepository profiles;
	private final HealthTagRepository tags;
	private final InBodyReportRepository reports;
	private final WeightLogRepository weights;
	private final GeminiService ai;
	private final ObjectMapper mapper;

	public RoadmapService(RoadmapRepository roadMap, HealthProfileRepository healthProfile, HealthTagRepository healthTag,
			InBodyReportRepository inBodyReport, WeightLogRepository WeightLog, GeminiService a, ObjectMapper m) {
		roadmaps = roadMap;
		profiles = healthProfile;
		tags = healthTag;
		reports = inBodyReport;
		weights = WeightLog;
		ai = a;
		mapper = m;
	}

	public Optional<Roadmap> today(Long uid) {
		return roadmaps.findByUserIdAndRoadmapDate(uid, LocalDate.now());
	}

	@Transactional
	public Roadmap generate(User user, String trigger) {
		HealthProfile healthProfile = profiles.findByUserId(user.getId()).orElseThrow();
		List<HealthTag> healthTag = tags.findAllByUserId(user.getId());
		RoadmapAiResponse out;
		AiStatus status;
		try {
			out = ai.json(prompt(user, healthProfile, healthTag), RoadmapAiResponse.class);
			validate(out, healthProfile, healthTag);
			status = AiStatus.GENERATED;
		} catch (Exception e) {
			out = fallback(healthProfile, healthTag);
			status = ai.isAvailable() ? AiStatus.FALLBACK : AiStatus.FAILED;
		}
		Roadmap r = roadmaps.findByUserIdAndRoadmapDate(user.getId(), LocalDate.now()).orElseGet(Roadmap::new);
		r.setUser(user);
		r.setRoadmapDate(LocalDate.now());
		r.getItems().clear();
		r.setTargetKcal(out.targetCalories);
		r.setTargetWaterMl(out.targetWaterMl);
		r.setTargetProtein(out.targetProtein);
		r.setTargetCarbs(out.targetCarbs);
		r.setTargetFat(out.targetFat);
		r.setPrimaryGoalText(shortGoal(out.primaryGoalSummary, healthProfile));
		r.setAiSummary(out.coachingSummary);
		r.setTriggerSource(trigger);
		r.setAiStatus(status);
		int order = 0;
		for (RoadmapAiResponse.Item x : out.items) {
			RoadmapItem it = new RoadmapItem();
			it.setRoadmap(r);
			it.setCategory(RoadmapCategory.valueOf(x.category));
			it.setScheduledTime(LocalTime.parse(x.time));
			it.setTitle(x.title);
			it.setDescription(x.description);
			it.setSlot(x.slot);
			it.setKcal(x.calories);
			it.setProtein(x.protein);
			it.setCarbs(x.carbs);
			it.setFat(x.fat);
			it.setWaterAmountMl(x.waterAmountMl);
			it.setActivityType(x.activityType);
			it.setDuration(x.duration);
			it.setDisplayOrder(x.displayOrder == null ? ++order : x.displayOrder);
			r.getItems().add(it);
		}
		return roadmaps.save(r);
	}

	private String prompt(User u, HealthProfile p, List<HealthTag> ts) {
		return "You are VitaPath, a non-medical wellness coach. Return JSON only matching: {targetCalories:int,targetWaterMl:int,targetProtein:number,targetCarbs:number,targetFat:number,primaryGoalSummary:string(maximum 60 characters),coachingSummary:string,items:[{category:MEAL|WATER|WORKOUT|SLEEP|OTHER,time:HH:mm,title:string,description:string,slot:string,calories:int,protein:number,carbs:number,fat:number,waterAmountMl:int,activityType:string,duration:int,displayOrder:int}]}. Create a culturally relevant Palestinian daily plan. Context: city="
				+ u.getCity() + ", age=" + p.getAge() + ", gender=" + p.getGender() + ", height=" + p.getHeight()
				+ ", weight=" + p.getWeight() + ", targetWeight=" + p.getTargetWeight() + ", goal=" + p.getPrimaryGoal()
				+ ", activity=" + p.getActivityLevel() + ", work=" + p.getWorkStartTime() + "-" + p.getWorkEndTime()
				+ ", sleep=" + p.getSleepTime() + "-" + p.getWakeTime() + ", pregnant=" + p.isPregnant()
				+ ", eatingDisorderHistory=" + p.isEatingDisorderHistory() + ", tags="
				+ ts.stream().map(t -> t.getType() + ":" + t.getName()).toList()
				+ ". Use conservative targets; no medical advice.";
	}

	private void validate(RoadmapAiResponse o, HealthProfile p, List<HealthTag> ts) {
		if (o == null || o.targetCalories == null || o.items == null || o.items.isEmpty())
			throw new IllegalArgumentException();
		int min = (p.isPregnant() || p.isEatingDisorderHistory()) ? 1600 : 1200;
		if (o.targetCalories < min || o.targetCalories > 4500)
			throw new IllegalArgumentException();
		if (o.targetWaterMl == null || o.targetWaterMl < 1000 || o.targetWaterMl > 6000)
			throw new IllegalArgumentException();
		List<String> a = ts.stream().filter(t -> t.getType() == HealthTagType.ALLERGY)
				.map(t -> t.getName().toLowerCase()).toList();
		for (var x : o.items) {
			RoadmapCategory.valueOf(x.category);
			LocalTime.parse(x.time);
			if (x.title == null || x.description == null)
				throw new IllegalArgumentException();
			String text = (x.title + " " + x.description).toLowerCase();
			if (a.stream().anyMatch(text::contains))
				throw new IllegalArgumentException("allergen");
		}
	}

	private String shortGoal(String value, HealthProfile profile) {
		if (value == null || value.isBlank())
			return profile.getPrimaryGoal().name().replace('_', ' ').toLowerCase();
		String clean = value.replaceAll("[\r\n]+", " ").trim();
		return clean.length() <= 60 ? clean : clean.substring(0, 57).trim() + "...";
	}

	private RoadmapAiResponse fallback(HealthProfile p, List<HealthTag> ts) {
		RoadmapAiResponse o = new RoadmapAiResponse();
		o.targetCalories = p.isPregnant() || p.isEatingDisorderHistory() ? 2000
				: Math.max(1500, Math.min(2800, (int) (p.getWeight() * 22)));
		o.targetWaterMl = 2500;
		o.targetProtein = 100d;
		o.targetCarbs = 210d;
		o.targetFat = 65d;
		o.primaryGoalSummary = p.getPrimaryGoal().name().replace('_', ' ').toLowerCase();
		o.coachingSummary = "A balanced fallback plan is shown while VitaPath AI is unavailable.";
		String safe = ts.stream().filter(t -> t.getType() == HealthTagType.ALLERGY).findAny().isPresent()
				? "Oatmeal with fruit selected to avoid your declared allergens"
				: "Eggs, whole-grain bread and cucumber";
		o.items.add(item("MEAL", "08:00", "Balanced breakfast", safe, 450, 1));
		o.items.add(item("WATER", "10:30", "Hydration break", "Drink 500 ml water", 0, 2));
		o.items.get(1).waterAmountMl = 500;
		o.items.add(
				item("MEAL", "13:30", "Palestinian-style lunch", "Grilled chicken, rice and seasonal salad", 650, 3));
		o.items.add(item("WORKOUT", "17:30", "Brisk walk", "Moderate pace", 0, 4));
		o.items.get(3).duration = 30;
		o.items.get(3).activityType = "Walk";
		o.items.add(item("MEAL", "20:00", "Light dinner", "Lentil soup and side salad", 420, 5));
		return o;
	}

	private RoadmapAiResponse.Item item(String c, String t, String title, String d, int kcal, int order) {
		var x = new RoadmapAiResponse.Item();
		x.category = c;
		x.time = t;
		x.title = title;
		x.description = d;
		x.calories = kcal;
		x.displayOrder = order;
		return x;
	}
}
