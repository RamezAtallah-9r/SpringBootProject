package com.axsos.Life.services;

import java.util.Optional;

import com.axsos.Life.models.HealthProfile;
import com.axsos.Life.repositories.HealthProfileRepository;

public class ProfileService {

	// Repository used to communicate with the health_profiles table & User object

	private final HealthProfileRepository healthProfileRepository;
	private final UserService userService;

	// Constructor injection

	public ProfileService(HealthProfileRepository healthProfileRepository, UserService userService) {

		this.healthProfileRepository = healthProfileRepository;
		this.userService = userService;
	}

//	Find the health profile belonging to a specific user.
//    Optional is used because the user may not have created
//    a health profile yet.

	public Optional<HealthProfile> findByUserId(Long userId) {
		return healthProfileRepository.findByUserId(userId);
	}

	// create & update profile
	
	public HealthProfile saveForUser(User user, HealthProfile formProfile) {

		HealthProfile profile = healthProfileRepository.findByUserId(user.getId()).orElse(new HealthProfile());

		profile.setUser(user);

		profile.setAge(formProfile.getAge());
		profile.setGender(formProfile.getGender());
		profile.setHeightCm(formProfile.getHeightCm());
		profile.setWeightKg(formProfile.getWeightKg());
		profile.setGoal(formProfile.getGoal());
		profile.setActivityLevel(formProfile.getActivityLevel());

		profile.setDiseases(formProfile.getDiseases());
		profile.setAllergies(formProfile.getAllergies());
		profile.setMedications(formProfile.getMedications());
		profile.setInjuries(formProfile.getInjuries());

		profile.setWorkStart(formProfile.getWorkStart());
		profile.setWorkEnd(formProfile.getWorkEnd());
		profile.setSleepTime(formProfile.getSleepTime());
		profile.setWakeTime(formProfile.getWakeTime());
		profile.setSleepHours(formProfile.getSleepHours());

		profile.setWaterGoalGlasses(formProfile.getWaterGoalGlasses());

		profile.setDailyBudgetNis(formProfile.getDailyBudgetNis());

		profile.setFavoriteFoods(formProfile.getFavoriteFoods());

		profile.setDislikedFoods(formProfile.getDislikedFoods());

		profile.setSmoker(formProfile.isSmoker());

		boolean medicalFlag = hasRealValue(formProfile.getDiseases()) || hasRealValue(formProfile.getMedications())
				|| hasRealValue(formProfile.getInjuries()) || hasRealValue(formProfile.getAllergies());

		profile.setMedicalFlag(medicalFlag);

		user.setOnboardingCompleted(true);
		userService.save(user);

		return healthProfileRepository.save(profile);
	}
	
//	Check whether a medical text field has a real value.
	
	private boolean hasRealValue(String value) {
		return value != null && !value.isBlank() && !value.trim().equalsIgnoreCase("none");
	}

}
