package com.axsos.Life.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.axsos.Life.models.HealthProfile;
import com.axsos.Life.services.ProfileService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ProfileController {
	// Service used to get the currently logged-in user
	private final UserService userService;
	// Service used to create, read, and update the health profile
	private final ProfileService profileService;

	// Constructor injection

	public ProfileController(UserService userService, ProfileService profileService) {

		this.userService = userService;
		this.profileService = profileService;
	}
	
	@GetMapping("/health-profile")
	public String showHealthProfileForm(
	        HttpSession session,
	        Model model) {

	    // Get the logged-in user's ID from the session
	    Long userId = (Long) session.getAttribute("userId");

	    // Redirect to login when no user is logged in
	    if (userId == null) {
	        return "redirect:/";
	    }

	    // Create an empty form object
	    model.addAttribute(
	            "profile",
	            new HealthProfile()
	    );

	    // Open healthProfile.jsp
	    return "healthProfile.jsp";
	}

//	This method displays the health profile form.

	@GetMapping("/profile")
	public String showProfileForm(HttpSession session, Model model) {

		// Get the currently logged-in user from the session

		User user = getCurrentUser(session);

		// If there is no logged-in user, redirect to the login page

		if (user == null) {
			return "redirect:/";
		}

		HealthProfile profile = profileService.findByUserId(user.getId()).orElse(new HealthProfile());

		model.addAttribute("currentUser", user);
		model.addAttribute("profile", profile);

		model.addAttribute("editMode", profile.getId() != null);

		return "profile.jsp";
	}
	
	/*
	 * Receive and save the submitted health profile.
	 */
	@PostMapping("/health-profile")
	public String saveHealthProfile(

	        // Connect submitted form data to HealthProfile
	        @Valid
	        @ModelAttribute("profile")
	        HealthProfile profile,

	        // Contains validation errors
	        BindingResult result,

	        HttpSession session,
	        Model model) {

	    // Get the logged-in user's ID
	    Long userId = (Long) session.getAttribute("userId");

	    // Prevent unauthorized users from saving data
	    if (userId == null) {
	        return "redirect:/";
	    }

	    // Return to the same page when validation fails
	    if (result.hasErrors()) {
	        return "healthProfile.jsp";
	    }

	    // Find the logged-in user
	    User user = userService
	            .find(userId)
	            .orElse(null);

	    // Redirect if the user no longer exists
	    if (user == null) {
	        session.invalidate();
	        return "redirect:/";
	    }

	    // Save the health profile for this user
	    profileService.saveForUser(user, profile);

	    // Redirect to dashboard after successful save
	    return "redirect:/dashboard";
	}

//	This method receives the submitted health profile form.

	@PostMapping("/profile")
	public String saveProfile(@Valid @ModelAttribute("profile") HealthProfile profile, BindingResult result,
			HttpSession session, Model model) {

		User user = getCurrentUser(session);

		if (user == null) {
			return "redirect:/";
		}

		if (result.hasErrors()) {
			model.addAttribute("currentUser", user);

			model.addAttribute("editMode", profileService.findByUserId(user.getId()).isPresent());

			return "profile.jsp";
		}

		profileService.saveForUser(user, profile);

		return "redirect:/dashboard";
	}

	private User getCurrentUser(HttpSession session) {

		Object sessionUserId = session.getAttribute("userId");

		if (!(sessionUserId instanceof Long userId)) {
			return null;
		}

		return userService.find(userId).orElse(null);
	}
}
