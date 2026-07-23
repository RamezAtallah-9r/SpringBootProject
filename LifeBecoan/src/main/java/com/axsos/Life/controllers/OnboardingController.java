package com.axsos.Life.controllers;

import com.axsos.Life.models.Enums.ActivityLevel;
import com.axsos.Life.models.Enums.Gender;
import com.axsos.Life.models.Enums.PrimaryGoal;
import com.axsos.Life.models.HealthProfileForm;
import com.axsos.Life.models.User;
import com.axsos.Life.services.HealthProfileService;
import com.axsos.Life.services.RoadmapService;
import com.axsos.Life.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class OnboardingController {

    private final UserService userService;
    private final HealthProfileService healthProfileService;
    private final RoadmapService roadmapService;

    public OnboardingController(UserService userService,
            HealthProfileService healthProfileService,
            RoadmapService roadmapService) {
        this.userService = userService;
        this.healthProfileService = healthProfileService;
        this.roadmapService = roadmapService;
    }

    // Show the onboarding form
    @GetMapping("/onboarding")
    public String showOnboarding(HttpSession session, Model model) {
        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) {
            return "redirect:/auth";
        }

        if (!model.containsAttribute("healthProfileForm")) {
            model.addAttribute("healthProfileForm", healthProfileService.toForm(loggedInUser));
        }
        addReferenceData(model);
        return "onboarding";
    }

    // Save the profile and create the first roadmap
    @PostMapping("/onboarding")
    public String saveOnboarding(
            @Valid @ModelAttribute("healthProfileForm") HealthProfileForm healthProfileForm,
            BindingResult bindingResult,
            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes) {

        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) {
            return "redirect:/auth";
        }

        healthProfileService.validateTimes(healthProfileForm, bindingResult);
        if (bindingResult.hasErrors()) {
            addReferenceData(model);
            return "onboarding";
        }

        healthProfileService.save(loggedInUser, healthProfileForm);
        try {
            roadmapService.generate(loggedInUser, "ONBOARDING");
        } catch (Exception exception) {
            redirectAttributes.addFlashAttribute("warning",
                    "Your profile was saved, but the AI plan is temporarily unavailable.");
        }
        return "redirect:/dashboard";
    }

    private User getLoggedInUser(HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        return userId == null ? null : userService.findUserById(userId);
    }

    private void addReferenceData(Model model) {
        model.addAttribute("genders", Gender.values());
        model.addAttribute("goals", PrimaryGoal.values());
        model.addAttribute("activities", ActivityLevel.values());
    }
}
