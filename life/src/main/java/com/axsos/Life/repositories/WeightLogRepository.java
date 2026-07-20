package com.axsos.Life.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.axsos.Life.models.WeightLog;

import java.util.List;

public interface WeightLogRepository extends JpaRepository<WeightLog, Long>, CrudRepository<WeightLog, Long> {

    // Powers the weight-history graph on the Dashboard
    List<WeightLog> findByUserIdOrderByLoggedAtAsc(Long userId);
}