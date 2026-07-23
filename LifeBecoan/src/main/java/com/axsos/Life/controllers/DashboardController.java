package com.axsos.Life.controllers;

import java.util.List;
import java.util.Optional;

import com.axsos.Life.models.Enums.AiStatus;
import com.axsos.Life.models.Enums.RoadmapCategory;
import com.axsos.Life.models.Enums.RoadmapItemStatus;
import com.axsos.Life.models.InBodyReport;
import com.axsos.Life.models.Roadmap;
import com.axsos.Life.models.RoadmapItem;
import com.axsos.Life.models.User;
import com.axsos.Life.models.WeightLog;
import com.axsos.Life.repositories.InBodyReportRepository;
import com.axsos.Life.repositories.RoadmapItemRepository;
import com.axsos.Life.repositories.WeightLogRepository;
import com.axsos.Life.services.RoadmapService;
import com.axsos.Life.services.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class DashboardController {

    private final UserService userService;
    private final RoadmapService roadmapService;
    private final RoadmapItemRepository roadmapItemRepository;
    private final InBodyReportRepository inBodyReportRepository;
    private final WeightLogRepository weightLogRepository;
    private final ObjectMapper objectMapper;

    public DashboardController(UserService userService, RoadmapService roadmapService,
            RoadmapItemRepository roadmapItemRepository,
            InBodyReportRepository inBodyReportRepository,
            WeightLogRepository weightLogRepository, ObjectMapper objectMapper) {
        this.userService = userService;
        this.roadmapService = roadmapService;
        this.roadmapItemRepository = roadmapItemRepository;
        this.inBodyReportRepository = inBodyReportRepository;
        this.weightLogRepository = weightLogRepository;
        this.objectMapper = objectMapper;
    }

    // Show today's roadmap and dashboard charts
    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) throws Exception {
        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) return "redirect:/auth";
        if (!loggedInUser.isOnboardingComplete()) return "redirect:/onboarding";

        Roadmap roadmap = roadmapService.today(loggedInUser.getId())
                .orElseGet(() -> roadmapService.generate(loggedInUser, "FIRST_LOGIN"));
        List<RoadmapItem> roadmapItems = roadmapItemRepository
                .findAllByRoadmapIdOrderByDisplayOrderAsc(roadmap.getId());

        int waterDone = roadmapItems.stream()
                .filter(item -> item.getCategory() == RoadmapCategory.WATER
                        && item.getStatus() == RoadmapItemStatus.DONE)
                .mapToInt(item -> Optional.ofNullable(item.getWaterAmountMl()).orElse(0))
                .sum();

        List<WeightLog> weightLogs = weightLogRepository
                .findAllByUserIdOrderByDateAsc(loggedInUser.getId());
        List<InBodyReport> reports = inBodyReportRepository
                .findAllByUserIdOrderByReportDateAsc(loggedInUser.getId());

        model.addAttribute("user", loggedInUser);
        model.addAttribute("roadmap", roadmap);
        model.addAttribute("items", roadmapItems);
        model.addAttribute("waterDone", waterDone);
        model.addAttribute("weightDates", objectMapper.writeValueAsString(
                weightLogs.stream().map(log -> log.getDate().toString()).toList()));
        model.addAttribute("weightValues", objectMapper.writeValueAsString(
                weightLogs.stream().map(WeightLog::getWeight).toList()));
        model.addAttribute("inbodyDates", objectMapper.writeValueAsString(
                reports.stream().map(report -> report.getReportDate().toString()).toList()));
        model.addAttribute("muscleValues", objectMapper.writeValueAsString(
                reports.stream().map(InBodyReport::getMuscleMass).toList()));
        model.addAttribute("fatValues", objectMapper.writeValueAsString(
                reports.stream().map(InBodyReport::getBodyFatPercentage).toList()));
        return "dashboard";
    }

    // Regenerate today's plan
    @PostMapping("/dashboard/regenerate")
    public String regenerateRoadmap(HttpSession session, RedirectAttributes redirectAttributes) {
        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) return "redirect:/auth";

        Roadmap roadmap = roadmapService.generate(loggedInUser, "MANUAL");
        String message = roadmap.getAiStatus() == AiStatus.GENERATED
                ? "Today's roadmap was regenerated."
                : "AI is temporarily unavailable. A safe plan is displayed.";
        redirectAttributes.addFlashAttribute("success", message);
        return "redirect:/dashboard";
    }

    // Update one roadmap item owned by the current user
    @PostMapping("/roadmap/items/{itemId}/status")
    public String updateItemStatus(@PathVariable Long itemId,
            @RequestParam RoadmapItemStatus status, HttpSession session, Model model) {
        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) return "redirect:/auth";

        RoadmapItem roadmapItem = roadmapItemRepository.findById(itemId).orElse(null);
        if (roadmapItem == null
                || !roadmapItem.getRoadmap().getUser().getId().equals(loggedInUser.getId())) {
            model.addAttribute("message", "You cannot access this information.");
            return "error";
        }
        roadmapItem.setStatus(status);
        roadmapItemRepository.save(roadmapItem);
        return "redirect:/dashboard";
    }

    private User getLoggedInUser(HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        return userId == null ? null : userService.findUserById(userId);
    }
}
