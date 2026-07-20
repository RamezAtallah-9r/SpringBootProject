package com.axsos.Life.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.axsos.Life.models.WeightLog;
import com.axsos.Life.repositories.WeightLogRepository;

@Service
public class WeightLogService {

    private final WeightLogRepository weightLogRepository;

    public WeightLogService(WeightLogRepository weightLogRepository) {
        this.weightLogRepository = weightLogRepository;
    }

    public WeightLog add(WeightLog log) {
        return weightLogRepository.save(log);
    }

    public WeightLog get(Long id) {
        return weightLogRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("No weight log found with id " + id));
    }

    public List<WeightLog> getAll() {
        return weightLogRepository.findAll();
    }

    public List<WeightLog> getHistoryForUser(Long userId) {
        return weightLogRepository.findByUserIdOrderByLoggedAtAsc(userId);
    }

    public WeightLog update(WeightLog log) {
        return weightLogRepository.save(log);
    }

    public void delete(Long id) {
        weightLogRepository.deleteById(id);
    }
}