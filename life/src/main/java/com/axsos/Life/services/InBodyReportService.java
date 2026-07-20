package com.axsos.Life.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.axsos.Life.models.InBodyReport;
import com.axsos.Life.repositories.InBodyReportRepository;

@Service
public class InBodyReportService {

    private final InBodyReportRepository inBodyReportRepository;

    public InBodyReportService(InBodyReportRepository inBodyReportRepository) {
        this.inBodyReportRepository = inBodyReportRepository;
    }

    public InBodyReport add(InBodyReport report) {
        return inBodyReportRepository.save(report);
    }

    public InBodyReport get(Long id) {
        return inBodyReportRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("No InBody report found with id " + id));
    }

    public List<InBodyReport> getAll() {
        return inBodyReportRepository.findAll();
    }

    public List<InBodyReport> getHistoryForUser(Long userId) {
        return inBodyReportRepository.findByUserIdOrderByReportDateDesc(userId);
    }

    public Optional<InBodyReport> getLatestForUser(Long userId) {
        return inBodyReportRepository.findFirstByUserIdOrderByReportDateDesc(userId);
    }

    public InBodyReport update(InBodyReport report) {
        return inBodyReportRepository.save(report);
    }

    public void delete(Long id) {
        inBodyReportRepository.deleteById(id);
    }
}
