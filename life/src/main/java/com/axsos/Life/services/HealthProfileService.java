package com.axsos.Life.services;

import java.util.Optional;

import com.axsos.Life.models.HealthProfile;
import com.axsos.Life.repositories.HealthProfileRepository;

public class HealthProfileService {
	// Repository used to communicate with the health_profiles table
	private final HealthProfileRepository healthProfileRepo;

    //Constructor injection
	
	public HealthProfileService(HealthProfileRepository healthProfileRepo) {
		this.healthProfileRepo = healthProfileRepo;
	}
	
    //create profile
	
	public HealthProfile save(HealthProfile healthProfile) {
		return healthProfileRepo.save(healthProfile);
	}
	
    public HealthProfile findById(Long id) {

        Optional<HealthProfile> optionalProfile =
                healthProfileRepo.findById(id);

        return optionalProfile.orElse(null);
    }
    
    // Find the profile belonging to a user
    public HealthProfile findByUserId(Long userId) {

        Optional<HealthProfile> optionalProfile =
                healthProfileRepo.findByUserId(userId);

        return optionalProfile.orElse(null);
    }
    
    // Update profile
    public HealthProfile update(HealthProfile updatedProfile) {

        HealthProfile existingProfile =
                findById(updatedProfile.getId());

        if (existingProfile == null) {
            return null;
        }

        existingProfile.setAge(updatedProfile.getAge());
        existingProfile.setBloodType(updatedProfile.getBloodType());
        existingProfile.setGender(updatedProfile.getGender());
        existingProfile.setHeight(updatedProfile.getHeight());
        existingProfile.setCurrentWeight(
                updatedProfile.getCurrentWeight()
        );

        existingProfile.setActivityLevel(
                updatedProfile.getActivityLevel()
        );
        existingProfile.setOccupation(
                updatedProfile.getOccupation()
        );
        existingProfile.setCity(updatedProfile.getCity());
        existingProfile.setWorkStart(
                updatedProfile.getWorkStart()
        );
        existingProfile.setWorkEnd(
                updatedProfile.getWorkEnd()
        );
        existingProfile.setBedtime(
                updatedProfile.getBedtime()
        );
        existingProfile.setWakeUpTime(
                updatedProfile.getWakeUpTime()
        );

        existingProfile.setPregnancyStatus(
                updatedProfile.getPregnancyStatus()
        );
        existingProfile.setDietaryAllergies(
                updatedProfile.getDietaryAllergies()
        );
        existingProfile.setChronicDiseases(
                updatedProfile.getChronicDiseases()
        );
        existingProfile.setStrictHardBlock(
                updatedProfile.isStrictHardBlock()
        );

        existingProfile.setPrimaryGoal(
                updatedProfile.getPrimaryGoal()
        );
        existingProfile.setTargetWeight(
                updatedProfile.getTargetWeight()
        );

        return healthProfileRepository.save(existingProfile);
    }

}
