package com.axsos.Life.repositories;

import com.axsos.Life.models.HealthTag;
import com.axsos.Life.models.Enums.HealthTagType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HealthTagRepository extends JpaRepository<HealthTag, Long> {
    List<HealthTag> findAllByUserId(Long userId);
    List<HealthTag> findAllByUserIdAndType(Long userId, HealthTagType type);
}
