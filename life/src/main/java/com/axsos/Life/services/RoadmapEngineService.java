package com.axsos.Life.services;

import org.springframework.stereotype.Service;

import com.axsos.Life.models.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.*;

// ============================================================
// AI CALL SITE #1
// Triggered right after the Health Onboarding Wizard finishes
// (and again on Dashboard login/Regenerate). This is the SEND ->
// RECEIVE -> SAVE -> DISPLAY pipeline for the daily roadmap.
// ============================================================
@Service
public class RoadmapEngineService {

    private final HealthProfileService healthProfileService;
    private final InBodyReportService inBodyReportService;
    private final HealthProfileService healthTagService;
    private final RoadmapService roadmapService;
    private final RoadmapItemService roadmapItemService;
    private final GeminiClient geminiClient;

    public RoadmapEngineService(HealthProfileService healthProfileService,
                                 InBodyReportService inBodyReportService,
                                 HealthProfileService healthTagService,
                                 RoadmapService roadmapService,
                                 RoadmapItemService roadmapItemService,
                                 GeminiClient geminiClient) {
        this.healthProfileService = healthProfileService;
        this.inBodyReportService = inBodyReportService;
        this.healthTagService = healthTagService;
        this.roadmapService = roadmapService;
        this.roadmapItemService = roadmapItemService;
        this.geminiClient = geminiClient;
    }

    public Roadmap generate(User user, String triggerSource) {
        HealthProfile profile = healthProfileService.findByUserId(user.getId())
                .orElseThrow(() -> new IllegalStateException("Onboarding not complete for user " + user.getId()));

        Optional<InBodyReport> latestInBody = inBodyReportService.getLatestForUser(user.getId());
        List<HealthTag> tags = healthTagService.getAllForUser(user.getId());
        List<Roadmap> recentHistory = roadmapService.getRecentHistory(user.getId());

        // ---------- 1. SEND: build the prompt ----------
        String prompt = buildPrompt(user, profile, tags, latestInBody, recentHistory);

        // ---------- 2. RECEIVE ----------
        Map<String, Object> aiResult;
        try {
            aiResult = geminiClient.promptForJson(prompt);
        } catch (Exception e) {
            // AI provider unavailable - serve a safe fixed fallback
            // instead of leaving the user with no roadmap at all.
            aiResult = safeFallbackRoadmap();
        }

        // ---------- 3. Deterministic safety layer (never skip this) ----------
        applySafetyRules(aiResult, tags);

        // ---------- 4. SAVE ----------
        return saveRoadmap(user, triggerSource, aiResult);
    }

    private String buildPrompt(User user, HealthProfile profile, List<HealthTag> tags,
                                Optional<InBodyReport> latestInBody, List<Roadmap> recentHistory) {

        List<String> conditions = tags.stream().filter(t -> t.getType().equals("CONDITION")).map(HealthTag::getName).toList();
        List<String> medications = tags.stream().filter(t -> t.getType().equals("MEDICATION")).map(HealthTag::getName).toList();

        int bmr;
        String dataSource;
        if (latestInBody.isPresent() && latestInBody.get().getBmr() != null) {
            bmr = latestInBody.get().getBmr();
            dataSource = "measured by InBody scan";
        } else {
            bmr = TdeeCalculator.estimateBmr(profile.getWeight(), profile.getHeight(), profile.getAge(), profile.getGender());
            dataSource = "estimated (Mifflin-St Jeor formula, no InBody report yet)";
        }

        StringBuilder yesterday = new StringBuilder("No previous roadmap yet - this is the first one.");
        if (!recentHistory.isEmpty()) {
            Roadmap last = recentHistory.get(0);
            List<RoadmapItem> items = roadmapItemService.getForRoadmap(last.getId());
            yesterday = new StringBuilder();
            for (RoadmapItem item : items) {
                yesterday.append("- ").append(item.getCategory()).append(" at ").append(item.getScheduledTime())
                        .append(": ").append(item.getStatus()).append("\n");
            }
        }

        return """
            You are VitaPath's AI Daily Planning Engine. Generate ONE day's
            personalized nutrition and wellness roadmap. Return ONLY a JSON
            object, no other text, no markdown formatting, in exactly this shape:

            {
              "targetKcal": <integer>,
              "targetWaterMl": <integer>,
              "targetProtein": <number>,
              "targetCarb": <number>,
              "targetFat": <number>,
              "meals": [
                {"slot":"BREAKFAST","time":"HH:MM","items":"description","kcal":<int>,"protein":<num>,"carb":<num>,"fat":<num>}
              ],
              "waterSchedule": [ {"time":"HH:MM","amountMl":<int>} ],
              "workoutSchedule": [ {"time":"HH:MM","activityType":"Walk","durationOrReps":"20 min"} ]
            }

            USER CONTEXT:
            - City: %s
            - Height: %s cm, Weight: %s kg, Age: %s, Gender: %s
            - Activity level: %s
            - BMR: %d kcal (%s)
            - Pregnant: %s
            - Eating disorder history flagged: %s
            - Chronic conditions: %s
            - Current medications: %s
            - Work hours: %s to %s, Sleep: %s, Wake: %s

            YESTERDAY'S RESULTS:
            %s

            Do not include any allergen information in your reasoning - allergy
            filtering happens separately, after your response, in application code.
            Never set targetKcal below 1200.
            """.formatted(
                user.getCity(), profile.getHeight(), profile.getWeight(), profile.getAge(), profile.getGender(),
                profile.getActivityLevel(), bmr, dataSource,
                profile.isPregnant(), profile.isEatingDisorderFlag(),
                conditions.isEmpty() ? "none" : String.join(", ", conditions),
                medications.isEmpty() ? "none" : String.join(", ", medications),
                profile.getWorkStartTime(), profile.getWorkEndTime(), profile.getSleepTime(), profile.getWakeTime(),
                yesterday.toString()
        );
    }

    // The deterministic safety layer - runs on EVERY response,
    // regardless of what the prompt asked for. This is what makes
    // the calorie floor and allergy filter guarantees actually true.
    @SuppressWarnings("unchecked")
    private void applySafetyRules(Map<String, Object> aiResult, List<HealthTag> tags) {
        Object kcalObj = aiResult.get("targetKcal");
        if (kcalObj != null && ((Number) kcalObj).intValue() < 1200) {
            aiResult.put("targetKcal", 1200);
        }

        List<String> allergens = tags.stream()
                .filter(t -> t.getType().equals("ALLERGY"))
                .map(t -> t.getName().toLowerCase())
                .toList();

        if (allergens.isEmpty()) return;

        List<Map<String, Object>> meals = (List<Map<String, Object>>) aiResult.get("meals");
        if (meals == null) return;

        for (Map<String, Object> meal : meals) {
            String items = String.valueOf(meal.get("items")).toLowerCase();
            for (String allergen : allergens) {
                if (items.contains(allergen)) {
                    meal.put("items", "Flagged for manual review - suggested meal contained a declared allergen (" + allergen + ")");
                    meal.put("kcal", 0);
                }
            }
        }
    }

    @SuppressWarnings("unchecked")
    private Roadmap saveRoadmap(User user, String triggerSource, Map<String, Object> aiResult) {
        Roadmap roadmap = new Roadmap();
        roadmap.setUser(user);
        roadmap.setRoadmapDate(LocalDate.now());
        roadmap.setTargetKcal(((Number) aiResult.get("targetKcal")).intValue());
        roadmap.setTargetWaterMl(((Number) aiResult.get("targetWaterMl")).intValue());
        roadmap.setTargetProtein(((Number) aiResult.get("targetProtein")).doubleValue());
        roadmap.setTargetCarb(((Number) aiResult.get("targetCarb")).doubleValue());
        roadmap.setTargetFat(((Number) aiResult.get("targetFat")).doubleValue());
        roadmap.setTriggerSource(triggerSource);
        roadmap = roadmapService.add(roadmap);

        for (Map<String, Object> meal : (List<Map<String, Object>>) aiResult.get("meals")) {
            RoadmapItem item = new RoadmapItem();
            item.setRoadmap(roadmap);
            item.setCategory("MEAL");
            item.setSlot((String) meal.get("slot"));
            item.setScheduledTime(LocalTime.parse((String) meal.get("time")));
            item.setItemsText((String) meal.get("items"));
            item.setKcal(((Number) meal.get("kcal")).intValue());
            item.setProtein(((Number) meal.get("protein")).doubleValue());
            item.setCarb(((Number) meal.get("carb")).doubleValue());
            item.setFat(((Number) meal.get("fat")).doubleValue());
            roadmapItemService.add(item);
        }

        for (Map<String, Object> slot : (List<Map<String, Object>>) aiResult.get("waterSchedule")) {
            RoadmapItem item = new RoadmapItem();
            item.setRoadmap(roadmap);
            item.setCategory("WATER");
            item.setScheduledTime(LocalTime.parse((String) slot.get("time")));
            item.setAmountMl(((Number) slot.get("amountMl")).intValue());
            roadmapItemService.add(item);
        }

        for (Map<String, Object> workout : (List<Map<String, Object>>) aiResult.get("workoutSchedule")) {
            RoadmapItem item = new RoadmapItem();
            item.setRoadmap(roadmap);
            item.setCategory("WORKOUT");
            item.setScheduledTime(LocalTime.parse((String) workout.get("time")));
            item.setActivityType((String) workout.get("activityType"));
            item.setDurationOrReps((String) workout.get("durationOrReps"));
            roadmapItemService.add(item);
        }

        return roadmap;
    }

    // Used only if Gemini is unreachable - a bare-minimum safe plan
    // so the Dashboard never shows a hard error.
    private Map<String, Object> safeFallbackRoadmap() {
        Map<String, Object> fallback = new HashMap<>();
        fallback.put("targetKcal", 1800);
        fallback.put("targetWaterMl", 2500);
        fallback.put("targetProtein", 100.0);
        fallback.put("targetCarb", 200.0);
        fallback.put("targetFat", 60.0);
        fallback.put("meals", List.of(
                Map.of("slot", "BREAKFAST", "time", "08:00", "items", "Balanced breakfast of your choice", "kcal", 400, "protein", 20.0, "carb", 45.0, "fat", 12.0),
                Map.of("slot", "LUNCH", "time", "13:00", "items", "Balanced lunch of your choice", "kcal", 600, "protein", 35.0, "carb", 60.0, "fat", 18.0),
                Map.of("slot", "DINNER", "time", "19:00", "items", "Balanced dinner of your choice", "kcal", 500, "protein", 30.0, "carb", 50.0, "fat", 15.0)
        ));
        fallback.put("waterSchedule", List.of(Map.of("time", "09:00", "amountMl", 500), Map.of("time", "14:00", "amountMl", 500)));
        fallback.put("workoutSchedule", List.of(Map.of("time", "18:00", "activityType", "Walk", "durationOrReps", "20 min")));
        return fallback;
    }
}