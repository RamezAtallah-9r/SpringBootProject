package com.axsos.Life.services;

import org.springframework.stereotype.Service;

import com.axsos.Life.models.HealthProfile;
import com.axsos.Life.repositories.HealthProfileRepository;

@Service
public class HealthProfileService {

    private final HealthProfileRepository healthProfileRepo;

    public HealthProfileService(
            HealthProfileRepository healthProfileRepo) {

        this.healthProfileRepo = healthProfileRepo;
    }

    // Create or save
    public HealthProfile save(HealthProfile healthProfile) {
        return healthProfileRepo.save(healthProfile);
    }

    // Find by profile ID
    public HealthProfile findById(Long id) {
        return healthProfileRepo.findById(id).orElse(null);
    }

    // Find profile belonging to a user
    public HealthProfile findByUserId(Long userId) {
        return healthProfileRepo.findByUserId(userId).orElse(null);
    }

    // Check whether user already has a profile
    public boolean userHasProfile(Long userId) {
        return healthProfileRepo.existsByUserId(userId);
    }

    // Update profile
    public HealthProfile update(HealthProfile updatedProfile) {

        if (updatedProfile.getId() == null) {
            return null;
        }

        HealthProfile existingProfile =
                findById(updatedProfile.getId());

        if (existingProfile == null) {
            return null;
        }

        existingProfile.setAge(updatedProfile.getAge());
        existingProfile.setGender(updatedProfile.getGender());
        existingProfile.setBloodType(updatedProfile.getBloodType());
        existingProfile.setHeight(updatedProfile.getHeight());
        existingProfile.setCurrentWeight(
                updatedProfile.getCurrentWeight()
        );
        existingProfile.setTargetWeight(
                updatedProfile.getTargetWeight()
        );

        existingProfile.setActivityLevel(
                updatedProfile.getActivityLevel()
        );
        existingProfile.setOccupation(
                updatedProfile.getOccupation()
        );
        existingProfile.setWorkStart(
                updatedProfile.getWorkStart()
        );
        existingProfile.setWorkEnd(
                updatedProfile.getWorkEnd()
        );
        existingProfile.setWakeUpTime(
                updatedProfile.getWakeUpTime()
        );
        existingProfile.setBedtime(
                updatedProfile.getBedtime()
        );

        existingProfile.setAllergies(
                updatedProfile.getAllergies()
        );
        existingProfile.setConditions(
                updatedProfile.getConditions()
        );
        existingProfile.setMedications(
                updatedProfile.getMedications()
        );
        existingProfile.setPregnant(
                updatedProfile.getPregnant()
        );
        existingProfile.setEatingDisorderHistory(
                updatedProfile.getEatingDisorderHistory()
        );

        return healthProfileRepo.save(existingProfile);
    }

    public void delete(Long id) {
        healthProfileRepo.deleteById(id);
    }
}