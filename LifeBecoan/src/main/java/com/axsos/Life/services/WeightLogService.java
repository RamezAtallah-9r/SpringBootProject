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

    // Find weight history in date order
    public List<WeightLog> findWeightHistory(Long userId) {
        return weightLogRepository.findAllByUserIdOrderByDateAsc(userId);
    }
}
