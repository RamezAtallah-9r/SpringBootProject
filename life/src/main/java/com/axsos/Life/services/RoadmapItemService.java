package com.axsos.Life.services;

import org.springframework.stereotype.Service;

import com.axsos.Life.models.RoadmapItem;
import com.axsos.Life.repositories.RoadmapItemRepository;

import java.util.List;

@Service
public class RoadmapItemService {

    private final RoadmapItemRepository roadmapItemRepository;

    public RoadmapItemService(RoadmapItemRepository roadmapItemRepository) {
        this.roadmapItemRepository = roadmapItemRepository;
    }

    public RoadmapItem add(RoadmapItem item) {
        return roadmapItemRepository.save(item);
    }

    public RoadmapItem get(Long id) {
        return roadmapItemRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("No roadmap item found with id " + id));
    }

    public List<RoadmapItem> getAll() {
        return roadmapItemRepository.findAll();
    }

    public List<RoadmapItem> getForRoadmap(Long roadmapId) {
        return roadmapItemRepository.findByRoadmapIdOrderByScheduledTimeAsc(roadmapId);
    }

    public RoadmapItem update(RoadmapItem item) {
        return roadmapItemRepository.save(item);
    }

    // This is what the Dashboard's Done / Skipped / Changed buttons
    // will call - it's just a focused version of update().
    public RoadmapItem markStatus(Long itemId, String status, String actualText) {
        RoadmapItem item = get(itemId);
        item.setStatus(status);
        item.setActualText(actualText);
        return roadmapItemRepository.save(item);
    }

    public void delete(Long id) {
        roadmapItemRepository.deleteById(id);
    }
}
