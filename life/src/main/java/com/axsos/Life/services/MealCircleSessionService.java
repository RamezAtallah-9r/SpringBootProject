package com.axsos.Life.services;

import org.springframework.stereotype.Service;

import com.axsos.Life.models.MealCircleSession;
import com.axsos.Life.repositories.MealCircleSessionRepository;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class MealCircleSessionService {

    private final MealCircleSessionRepository sessionRepository;

    public MealCircleSessionService(MealCircleSessionRepository sessionRepository) {
        this.sessionRepository = sessionRepository;
    }

    public MealCircleSession add(MealCircleSession session) {
        return sessionRepository.save(session);
    }

    public MealCircleSession get(Long id) {
        return sessionRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("No session found with id " + id));
    }

    public List<MealCircleSession> getAll() {
        return sessionRepository.findAll();
    }

    public List<MealCircleSession> getActiveSessionsForCreator(Long creatorId) {
        return sessionRepository.findByCreatorIdAndStatus(creatorId, "ACTIVE");
    }

    // Called by the scheduled cleanup job (Section 3) once a minute
    public List<MealCircleSession> getExpiredButStillActive() {
        return sessionRepository.findByStatusAndExpiresAtBefore("ACTIVE", LocalDateTime.now());
    }

    public MealCircleSession update(MealCircleSession session) {
        return sessionRepository.save(session);
    }

    public void delete(Long id) {
        sessionRepository.deleteById(id);
    }
}
