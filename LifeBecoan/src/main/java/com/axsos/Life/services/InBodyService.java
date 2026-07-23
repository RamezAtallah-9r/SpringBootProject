package com.axsos.Life.services;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.axsos.Life.models.InBodyForm;
import com.axsos.Life.models.InBodyReport;
import com.axsos.Life.models.User;
import com.axsos.Life.models.WeightLog;
import com.axsos.Life.repositories.InBodyReportRepository;
import com.axsos.Life.repositories.WeightLogRepository;
import com.axsos.Life.services.GeminiService;

import static com.axsos.Life.models.Enums.InBodySource;
import static com.axsos.Life.models.Enums.WeightSource;

@Service
public class InBodyService {

    private static final Logger logger = LoggerFactory.getLogger(InBodyService.class);

    private final InBodyReportRepository inBodyReportRepository;
    private final WeightLogRepository weightLogRepository;
    private final GeminiService geminiService;

    public InBodyService(InBodyReportRepository inBodyReportRepository,
            WeightLogRepository weightLogRepository, GeminiService geminiService) {
        this.inBodyReportRepository = inBodyReportRepository;
        this.weightLogRepository = weightLogRepository;
        this.geminiService = geminiService;
    }

    public List<InBodyReport> history(Long userId) {
        return inBodyReportRepository.findAllByUserIdOrderByReportDateAsc(userId);
    }

    public Optional<InBodyReport> latest(Long userId) {
        return inBodyReportRepository.findFirstByUserIdOrderByReportDateDesc(userId);
    }

    // Validate the uploaded file before asking Gemini to read it
    public InBodyForm extract(MultipartFile file) {
        String contentType = file.getContentType();
        String filename = file.getOriginalFilename() == null ? "" : file.getOriginalFilename().toLowerCase();
        boolean validExtension = filename.endsWith(".pdf") || filename.endsWith(".png")
                || filename.endsWith(".jpg") || filename.endsWith(".jpeg");
        boolean validMime = contentType != null && Set.of("application/pdf", "image/png", "image/jpeg").contains(contentType);

        if (file.isEmpty()) {
            throw new IllegalArgumentException("Please choose an InBody report file.");
        }
        if (file.getSize() > 10_000_000) {
            throw new IllegalArgumentException("The report file must be 10 MB or smaller.");
        }
        if (!validExtension || !validMime) {
            throw new IllegalArgumentException("Please upload a clear InBody report as a PDF, JPG, or PNG file.");
        }

        try {
        	String prompt = """
        	        First decide whether this uploaded file is an InBody or body-composition test result.

        	        Return JSON only with these fields:
        	        isInBodyReport,
        	        validationMessage,
        	        reportDate,
        	        weight,
        	        muscleMass,
        	        bodyFatPercentage,
        	        visceralFatLevel,
        	        totalBodyWater,
        	        bmr.

        	        IMPORTANT:
        	        - reportDate must use ISO format yyyy-MM-dd.
        	        - Example: "reportDate": "2014-11-19"
        	        - Never use dots, slashes, or another date format.
        	        - Do not return markdown.
        	        - Do not return explanations outside the JSON.

        	        For an unrelated file:
        	        - set isInBodyReport to false
        	        - set validationMessage to "This file is not an InBody test result."
        	        - set all report values to null

        	        Do not guess unreadable values.
        	        """;

            InBodyAiResult result = geminiService.jsonWithFile(prompt, file.getBytes(), contentType, InBodyAiResult.class);
            if (result == null || !result.isInBodyReport) {
                throw new IllegalArgumentException("This file is not an InBody test result.");
            }
            if (result.reportDate == null || result.weight == null) {
                throw new IllegalArgumentException("The InBody report could not be read clearly. Please enter the values manually.");
            }

            InBodyForm form = new InBodyForm();
            form.setReportDate(result.reportDate);
            form.setWeight(result.weight);
            form.setMuscleMass(result.muscleMass);
            form.setBodyFatPercentage(result.bodyFatPercentage);
            form.setVisceralFatLevel(result.visceralFatLevel);
            form.setTotalBodyWater(result.totalBodyWater);
            form.setBmr(result.bmr);
            return form;
        } catch (IllegalArgumentException exception) {
            throw exception;
        } catch (Exception exception) {
            logger.error("Gemini could not analyze the uploaded InBody report: {}", exception.getMessage(), exception);
            throw new IllegalArgumentException("AI is temporarily unavailable. Please enter the report manually.");
        }
    }

    // Save the report and matching weight log together
    @Transactional
    public InBodyReport save(User user, InBodyForm form) {
        InBodyReport previousReport = latest(user.getId()).orElse(null);
        InBodyReport report = new InBodyReport();
        report.setUser(user);
        report.setReportDate(form.getReportDate());
        report.setWeight(form.getWeight());
        report.setMuscleMass(form.getMuscleMass());
        report.setBodyFatPercentage(form.getBodyFatPercentage());
        report.setVisceralFatLevel(form.getVisceralFatLevel());
        report.setTotalBodyWater(form.getTotalBodyWater());
        report.setBmr(form.getBmr());
        report.setSource(InBodySource.MANUAL);

        if (user.getHealthProfile() != null && user.getHealthProfile().getHeight() != null) {
            report.setBmi(form.getWeight() / Math.pow(user.getHealthProfile().getHeight() / 100, 2));
        }

        report.setComparisonSummary(previousReport == null
                ? "No previous confirmed report is available for comparison."
                : compare(previousReport, report));

        try {
            Map<?, ?> response = geminiService.json(
                    "Return JSON with one short non-medical analysisSummary for: weight=" + report.getWeight()
                    + ", muscle=" + report.getMuscleMass() + ", bodyFat=" + report.getBodyFatPercentage(), Map.class);
            report.setAnalysisSummary(String.valueOf(response.get("analysisSummary")));
        } catch (Exception exception) {
            report.setAnalysisSummary("AI analysis is temporarily unavailable.");
        }

        inBodyReportRepository.save(report);

        WeightLog weightLog = weightLogRepository
                .findByUserIdAndDateAndSource(user.getId(), form.getReportDate(), WeightSource.INBODY)
                .orElseGet(WeightLog::new);
        weightLog.setUser(user);
        weightLog.setDate(form.getReportDate());
        weightLog.setWeight(form.getWeight());
        weightLog.setSource(WeightSource.INBODY);
        weightLogRepository.save(weightLog);
        return report;
    }

    private String compare(InBodyReport previous, InBodyReport current) {
        return String.format("Weight change: %.1f kg; muscle change: %s; body-fat change: %s",
                current.getWeight() - previous.getWeight(),
                difference(previous.getMuscleMass(), current.getMuscleMass()),
                difference(previous.getBodyFatPercentage(), current.getBodyFatPercentage()));
    }

    private String difference(Double oldValue, Double newValue) {
        return oldValue == null || newValue == null ? "not available" : String.format("%.1f", newValue - oldValue);
    }

    public static class InBodyAiResult {
        public boolean isInBodyReport;
        public String validationMessage;
        public java.time.LocalDate reportDate;
        public Double weight;
        public Double muscleMass;
        public Double bodyFatPercentage;
        public Integer visceralFatLevel;
        public Double totalBodyWater;
        public Integer bmr;
    }
}
