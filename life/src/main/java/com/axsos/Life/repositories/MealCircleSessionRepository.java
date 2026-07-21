package com.axsos.Life.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.axsos.Life.models.MealCircleSession;

import java.time.LocalDateTime;
import java.util.List;

public interface MealCircleSessionRepository extends JpaRepository<MealCircleSession, Long> {

    // Sessions this user created and are still ACTIVE
    List<MealCircleSession> findByCreatorIdAndStatus(Long creatorId, String status);

    // Used by the scheduled cleanup job (Section 3) to find sessions
    // that are past their expiry and still marked ACTIVE.
    List<MealCircleSession> findByStatusAndExpiresAtBefore(String status, LocalDateTime now);
}