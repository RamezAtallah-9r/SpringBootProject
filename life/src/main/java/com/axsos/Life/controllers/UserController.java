package com.axsos.Life.controllers;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.axsos.Life.models.LoginUser;
import com.axsos.Life.models.Roadmap;
import com.axsos.Life.models.RoadmapItem;
import com.axsos.Life.models.User;
import com.axsos.Life.services.RoadmapEngineService;
import com.axsos.Life.services.RoadmapService;
import com.axsos.Life.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoadmapService roadmapService;

    @Autowired
    private RoadmapEngineService roadmapEngineService;

    // ==========================================
    // Authentication Page (Login & Register)
    // ==========================================
    @GetMapping("/auth")
    public String authPage(
            @ModelAttribute("newUser") User newUser,
            @ModelAttribute("newLogin") LoginUser newLogin) {

        return "auth";
    }

    // ==========================================
    // Register User
    // ==========================================
    @PostMapping("/register")
    public String register(
            @Valid @ModelAttribute("newUser") User newUser,
            BindingResult result,
            @ModelAttribute("newLogin") LoginUser newLogin,
            Model model,
            HttpSession session) {

        User registeredUser = userService.register(newUser, result);

        if (result.hasErrors()) {
            model.addAttribute("registrationError", true);
            return "auth";
        }

        session.setAttribute("userId", registeredUser.getId());
        return "redirect:/health-info";
    }

    // ==========================================
    // Login User
    // ==========================================
    @PostMapping("/login")
    public String login(
            @Valid @ModelAttribute("newLogin") LoginUser newLogin,
            BindingResult result,
            @ModelAttribute("newUser") User newUser,
            Model model,
            HttpSession session) {

        User loggedInUser = userService.login(newLogin, result);

        if (result.hasErrors()) {
            model.addAttribute("loginError", true);
            return "auth";
        }

        session.setAttribute("userId", loggedInUser.getId());
        return "redirect:/dashboard";
    }

    // ==========================================
    // Dashboard
    // ==========================================
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {

        if (session.getAttribute("userId") == null) {
            return "redirect:/auth";
        }

        Long userId = (Long) session.getAttribute("userId");
        User currentUser = userService.findById(userId);

        if (currentUser == null) {
            // Session points to a user that no longer exists - force
            // a clean re-login instead of showing broken data.
            session.invalidate();
            return "redirect:/auth";
        }

        model.addAttribute("user", currentUser);

        LocalDate today = LocalDate.now();
        Roadmap roadmap;
        try {
            roadmap = roadmapService.getForUserAndDate(userId, today)
                    .orElseGet(() -> roadmapEngineService.generate(currentUser, "LOGIN"));
        } catch (IllegalStateException e) {
            // No HealthProfile yet - this user hasn't finished the
            // Health Onboarding Wizard. Send them there instead of
            // crashing with a generic error page.
            return "redirect:/onboarding";
        }

        model.addAttribute("roadmap", roadmap);
        model.addAttribute("today", today);

        // Calculate water actually consumed so far today by summing
        // completed WATER items - RoadmapItem doesn't store a running
        // total, only per-reminder status, so we add it up here.
        List<RoadmapItem> items = roadmap.getItems();
        int waterConsumedMl = items.stream()
                .filter(item -> "WATER".equals(item.getCategory()))
                .filter(item -> "DONE".equals(item.getStatus()))
                .mapToInt(item -> item.getAmountMl() != null ? item.getAmountMl() : 0)
                .sum();
        model.addAttribute("waterConsumedMl", waterConsumedMl);

        // Progress: how many of today's items are marked DONE
        long doneCount = items.stream()
                .filter(item -> "DONE".equals(item.getStatus()))
                .count();
        model.addAttribute("doneCount", doneCount);
        model.addAttribute("totalCount", items.size());

        return "dashboard";
    }

    // ==========================================
    // Health Information (Onboarding)
    // ==========================================
    @GetMapping("/health-info")
    public String healthInfo(HttpSession session) {

        if (session.getAttribute("userId") == null) {
            return "redirect:/auth";
        }

        return "redirect:/onboarding";
    }

    // ==========================================
    // Logout
    // ==========================================
    @GetMapping("/logout")
    public String logout(HttpSession session) {

        session.invalidate();
        return "redirect:/auth";
    }

}