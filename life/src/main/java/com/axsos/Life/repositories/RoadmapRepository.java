package com.axsos.Life.repositories;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.axsos.Life.models.Roadmap;

public interface RoadmapRepository extends JpaRepository<Roadmap, Long> {

    // This is THE most important query in the whole app - the
    // Dashboard calls this first, every time, to check "does a
    // roadmap already exist for today, or do I need to generate one?"
    Optional<Roadmap> findByUserIdAndRoadmapDate(Long userId, LocalDate roadmapDate);

    // Used by the AI Daily Planning Engine to look at recent history
    // (Section 8.1 of the SRS - "Previous Roadmaps" input)
    List<Roadmap> findTop7ByUserIdOrderByRoadmapDateDesc(Long userId);
}
