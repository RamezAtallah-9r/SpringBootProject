package com.axsos.Life.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.Life.models.HealthProfile;

@Repository
public interface HealthProfileRepository
        extends CrudRepository<HealthProfile, Long> {

    Optional<HealthProfile> findByUserId(Long userId);

    boolean existsByUserId(Long userId);
}