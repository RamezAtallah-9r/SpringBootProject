package com.axsos.Life.controllers;

import com.axsos.Life.models.Enums.ActivityLevel;
import com.axsos.Life.models.Enums.Gender;
import com.axsos.Life.models.Enums.PrimaryGoal;
import com.axsos.Life.models.HealthProfileForm;
import com.axsos.Life.models.User;
import com.axsos.Life.services.HealthProfileService;
import com.axsos.Life.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ProfileController {

    private final UserService userService;
    private final HealthProfileService healthProfileService;

    public ProfileController(UserService userService, HealthProfileService healthProfileService) {
        this.userService = userService;
        this.healthProfileService = healthProfileService;
    }

    // Show account and health information
    @GetMapping("/profile")
    public String showProfile(HttpSession session, Model model) {
        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) {
            return "redirect:/auth";
        }
        model.addAttribute("user", loggedInUser);
        model.addAttribute("profile", healthProfileService.find(loggedInUser.getId()).orElse(null));
        model.addAttribute("tags", healthProfileService.tags(loggedInUser.getId()));
        return "profile";
    }

    // Show the prefilled edit form
    @GetMapping("/profile/edit")
    public String showEditProfile(HttpSession session, Model model) {
        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) {
            return "redirect:/auth";
        }
        model.addAttribute("user", loggedInUser);
        if (!model.containsAttribute("healthProfileForm")) {
            model.addAttribute("healthProfileForm", healthProfileService.toForm(loggedInUser));
        }
        addReferenceData(model);
        return "editProfile";
    }

    // Update account and health information without changing the password
    @PostMapping("/profile/edit")
    public String updateProfile(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam(required = false) String phone,
            @RequestParam String city,
            @Valid @ModelAttribute("healthProfileForm") HealthProfileForm healthProfileForm,
            BindingResult bindingResult,
            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes) {

        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) {
            return "redirect:/auth";
        }

        userService.validateAccountUpdate(loggedInUser, name, email, phone, city, bindingResult);
        healthProfileService.validateTimes(healthProfileForm, bindingResult);
        if (bindingResult.hasErrors()) {
            loggedInUser.setName(name);
            loggedInUser.setEmail(email);
            loggedInUser.setPhone(phone);
            loggedInUser.setCity(city);
            model.addAttribute("user", loggedInUser);
            addReferenceData(model);
            return "editProfile";
        }

        userService.updateUserAccount(loggedInUser, name, email, phone, city);
        healthProfileService.save(loggedInUser, healthProfileForm);
        redirectAttributes.addFlashAttribute("success", "Profile updated.");
        return "redirect:/profile";
    }

    private User getLoggedInUser(HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        return userId == null ? null : userService.findUserById(userId);
    }

    private void addReferenceData(Model model) {
        model.addAttribute("genders", Gender.values());
        model.addAttribute("goals", PrimaryGoal.values());
        model.addAttribute("activities", ActivityLevel.values());
        model.addAttribute("palestineCities", userService.getPalestineCities());
    }
}
