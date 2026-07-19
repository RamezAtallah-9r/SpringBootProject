package com.axsos.Life.controllers;


import jakarta.validation.Valid;
import java.io.IOException;
import java.nio.file.*;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.axsos.Life.models.HealthProfile;
import com.axsos.Life.services.HealthProfileService;

public class HealthProfileController {
	 private final HealthProfileService healthProfileService;

	    public HealthProfileController(
	            HealthProfileService healthProfileService) {
	        this.healthProfileService = healthProfileService;
	    }

	    @GetMapping
	    public String onboarding(Model model) {

	        model.addAttribute(
	            "healthProfile",
	            new HealthProfile()
	        );

	        return "onboarding";
	    }

	    @PostMapping
	    public String saveOnboarding(
	            @Valid @ModelAttribute("healthProfile")
	            HealthProfile healthProfile,
	            BindingResult result) throws IOException {

	        if (result.hasErrors()) {
	            return "onboarding";
	        }

	        if (healthProfile.getInBodyFile() != null
	                && !healthProfile.getInBodyFile().isEmpty()) {

	            String fileName = System.currentTimeMillis()
	                    + "_"
	                    + healthProfile.getInBodyFile()
	                                   .getOriginalFilename();

	            Path uploadFolder = Paths.get("uploads");

	            Files.createDirectories(uploadFolder);

	            Files.copy(
	                healthProfile.getInBodyFile().getInputStream(),
	                uploadFolder.resolve(fileName),
	                StandardCopyOption.REPLACE_EXISTING
	            );

	            healthProfile.setInBodyFileName(fileName);
	        }

	        healthProfileService.save(healthProfile);

	        return "redirect:/dashboard";
	    }

}
