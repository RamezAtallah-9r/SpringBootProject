package com.axsos.Life.services;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.axsos.Life.models.Roadmap;
import com.axsos.Life.repositories.RoadmapRepository;

@Service
public class RoadmapService {

    private final RoadmapRepository roadmapRepository;

    public RoadmapService(RoadmapRepository roadmapRepository) {
        this.roadmapRepository = roadmapRepository;
    }

    // Plain save - the AI Daily Planning Engine section builds the
    // actual Roadmap object (with its items) and hands it to this
    // method to persist.
    public Roadmap add(Roadmap roadmap) {
        return roadmapRepository.save(roadmap);
    }

    public Roadmap get(Long id) {
        return roadmapRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("No roadmap found with id " + id));
    }

    public List<Roadmap> getAll() {
        return roadmapRepository.findAll();
    }

    // The single most-called method in the app - "is there already
    // a roadmap for this user today?"
    public Optional<Roadmap> getForUserAndDate(Long userId, LocalDate date) {
        return roadmapRepository.findByUserIdAndRoadmapDate(userId, date);
    }

    public List<Roadmap> getRecentHistory(Long userId) {
        return roadmapRepository.findTop7ByUserIdOrderByRoadmapDateDesc(userId);
    }

    public Roadmap update(Roadmap roadmap) {
        return roadmapRepository.save(roadmap);
    }

    public void delete(Long id) {
        roadmapRepository.deleteById(id);
    }
}
