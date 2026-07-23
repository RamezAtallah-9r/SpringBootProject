package com.axsos.Life.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.axsos.Life.models.HealthTag;
import com.axsos.Life.repositories.HealthTagRepository;

@Service
public class HealthTagService {

    private final HealthTagRepository healthTagRepository;

    public HealthTagService(HealthTagRepository healthTagRepository) {
        this.healthTagRepository = healthTagRepository;
    }

    // Find all health tags belonging to one user
    public List<HealthTag> findTagsByUserId(Long userId) {
        return healthTagRepository.findAllByUserId(userId);
    }
}
