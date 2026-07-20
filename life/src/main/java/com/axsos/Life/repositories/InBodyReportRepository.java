package com.axsos.Life.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.axsos.Life.models.InBodyReport;

import java.util.List;
import java.util.Optional;

public interface InBodyReportRepository extends JpaRepository<InBodyReport, Long> {

    // Newest report first - used both for "does an InBody report
    // exist at all" and for the comparison-to-previous-report chart.
    List<InBodyReport> findByUserIdOrderByReportDateDesc(Long userId);

    // Spring Data supports "First" to just grab the single newest row
    // instead of the whole list.
    Optional<InBodyReport> findFirstByUserIdOrderByReportDateDesc(Long userId);
}
