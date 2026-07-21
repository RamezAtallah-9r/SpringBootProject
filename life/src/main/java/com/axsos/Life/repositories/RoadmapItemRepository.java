package com.axsos.Life.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.axsos.Life.models.RoadmapItem;

public interface RoadmapItemRepository extends JpaRepository<RoadmapItem, Long> {

    // All items for one roadmap, in time order - this is exactly
    // what the Dashboard timeline displays.
    List<RoadmapItem> findByRoadmapIdOrderByScheduledTimeAsc(Long roadmapId);
}