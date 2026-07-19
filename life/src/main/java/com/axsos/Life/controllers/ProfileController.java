package com.axsos.Life.controllers;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.axsos.Life.models.HealthProfile;
import com.axsos.Life.services.HealthProfileService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ProfileController {
    private final HealthProfileService healthProfileService;

    public ProfileController(
            HealthProfileService healthProfileService) {
        this.healthProfileService = healthProfileService;
    }

    // Display profile
    @GetMapping
    public String showProfile(
            HttpSession session,
            Model model) {

        Long userId =
                (Long) session.getAttribute("userId");

        if (userId == null) {
            return "redirect:/";
        }

        HealthProfile profile =
                healthProfileService.findByUserId(userId);

        if (profile == null) {
            return "redirect:/onboarding";
        }

        model.addAttribute("profile", profile);

        return "profile";
    }

    // Display edit form
    @GetMapping("/edit")
    public String editProfile(
            HttpSession session,
            Model model) {

        Long userId =
                (Long) session.getAttribute("userId");

        if (userId == null) {
            return "redirect:/";
        }

        HealthProfile profile =
                healthProfileService.findByUserId(userId);

        if (profile == null) {
            return "redirect:/onboarding";
        }

        model.addAttribute("profile", profile);

        return "editProfile";
    }

    // Update profile
    @PutMapping("/edit")
    public String updateProfile(
            @Valid
            @ModelAttribute("profile")
            HealthProfile profile,
            BindingResult result,
            HttpSession session) throws IOException {

        Long userId =
                (Long) session.getAttribute("userId");

        if (userId == null) {
            return "redirect:/";
        }

        HealthProfile existingProfile =
                healthProfileService.findByUserId(userId);

        if (existingProfile == null) {
            return "redirect:/onboarding";
        }

        // Prevent changing another user's profile
        profile.setId(existingProfile.getId());

        if (result.hasErrors()) {
            return "editProfile";
        }

        if (profile.getInBodyFile() != null
                && !profile.getInBodyFile().isEmpty()) {

            String originalFileName =
                    profile.getInBodyFile()
                           .getOriginalFilename();

            String fileName =
                    System.currentTimeMillis()
                    + "_"
                    + originalFileName;

            Path uploadDirectory =
                    Paths.get("uploads");

            Files.createDirectories(uploadDirectory);

            Files.copy(
                profile.getInBodyFile().getInputStream(),
                uploadDirectory.resolve(fileName),
                StandardCopyOption.REPLACE_EXISTING
            );

            profile.setInBodyFileName(fileName);
        } else {
            profile.setInBodyFileName(
                    existingProfile.getInBodyFileName()
            );
        }

        healthProfileService.update(profile);

        return "redirect:/profile";
    }
}
