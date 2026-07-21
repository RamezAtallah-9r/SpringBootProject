package com.axsos.Life.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.axsos.Life.models.HealthProfile;
import com.axsos.Life.models.User;
import com.axsos.Life.services.HealthProfileService;
import com.axsos.Life.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/onboarding")
public class HealthProfileController {

    private final HealthProfileService healthProfileService;
    private final UserService userService;

    public HealthProfileController(
            HealthProfileService healthProfileService,
            UserService userService) {

        this.healthProfileService = healthProfileService;
        this.userService = userService;
    }

    // Show onboarding page
    @GetMapping
    public String showOnboarding(
            Model model,
            HttpSession session) {

        Long userId = (Long) session.getAttribute("userId");

        if (userId == null) {
            return "redirect:/auth";
        }

        HealthProfile existingProfile =
                healthProfileService.findByUserId(userId);

        if (existingProfile != null) {
            return "redirect:/dashboard";
        }

        model.addAttribute(
                "healthProfile",
                new HealthProfile()
        );

        return "onboarding";
    }

    // Save health profile
    @PostMapping
    public String saveOnboarding(
            @Valid
            @ModelAttribute("healthProfile")
            HealthProfile healthProfile,
            BindingResult result,
            HttpSession session,
            Model model) throws IOException {

        Long userId = (Long) session.getAttribute("userId");

        // Check user session
        if (userId == null) {
            return "redirect:/auth";
        }

        // Print validation errors
        if (result.hasErrors()) {

            result.getFieldErrors().forEach(error -> {
                System.out.println(
                        "Field: " + error.getField()
                        + " | Error: "
                        + error.getDefaultMessage()
                );
            });

            model.addAttribute(
                    "errorMessage",
                    "Please complete all required fields."
            );

            return "onboarding";
        }

        // Find logged-in user
        User user = userService.findById(userId);

        if (user == null) {
            model.addAttribute(
                    "errorMessage",
                    "Logged-in user was not found."
            );

            return "onboarding";
        }

        // Important: assign the user before saving
        healthProfile.setUser(user);

        // Prevent null checkbox values
        if (healthProfile.getPregnant() == null) {
            healthProfile.setPregnant(false);
        }

        if (healthProfile.getEatingDisorderHistory() == null) {
            healthProfile.setEatingDisorderHistory(false);
        }

        // Save optional InBody file
        if (healthProfile.getInBodyFile() != null
                && !healthProfile.getInBodyFile().isEmpty()) {

            String originalName =
                    healthProfile.getInBodyFile()
                                 .getOriginalFilename();

            String fileName =
                    System.currentTimeMillis()
                    + "_"
                    + originalName;

            Path uploadDirectory =
                    Paths.get("uploads");

            Files.createDirectories(uploadDirectory);

            Path savedFile =
                    uploadDirectory.resolve(fileName);

            Files.copy(
                    healthProfile.getInBodyFile()
                                 .getInputStream(),
                    savedFile,
                    StandardCopyOption.REPLACE_EXISTING
            );

            healthProfile.setInBodyFileName(fileName);
            healthProfile.setInBodyFilePath(
                    savedFile.toString()
            );
        }

        // Save in MySQL
        HealthProfile savedProfile =
                healthProfileService.save(healthProfile);

        System.out.println(
                "Health profile saved with ID: "
                + savedProfile.getId()
        );

        return "redirect:/dashboard";
    }
}