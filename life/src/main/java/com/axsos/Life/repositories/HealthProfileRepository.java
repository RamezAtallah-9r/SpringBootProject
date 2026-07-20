package com.axsos.Life.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.axsos.Life.models.HealthProfile;

public interface HealthProfileRepository extends CrudRepository<HealthProfile, Long> {
	//find user by ID
	Optional<HealthProfile> findByUserId(Long userId);

}
