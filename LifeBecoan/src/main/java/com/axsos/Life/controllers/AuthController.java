package com.axsos.Life.controllers;

import com.axsos.Life.models.LoginForm;
import com.axsos.Life.models.RegistrationForm;
import com.axsos.Life.models.User;
import com.axsos.Life.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {

    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    // Show login and registration
    @GetMapping("/auth")
    public String showAuthPage(Model model) {
        addAuthPageData(model);
        return "auth";
    }

    // Register a new user
    @PostMapping("/register")
    public String registerUser(
            @Valid @ModelAttribute("registrationForm") RegistrationForm registrationForm,
            BindingResult bindingResult,
            Model model,
            HttpSession session) {

        if (bindingResult.hasErrors()) {
            addAuthPageData(model);
            return "auth";
        }

        try {
            User registeredUser = userService.register(registrationForm);
            session.setAttribute("userId", registeredUser.getId());
            return "redirect:/onboarding";
        } catch (IllegalArgumentException exception) {
            bindingResult.reject("registration", exception.getMessage());
            addAuthPageData(model);
            return "auth";
        }
    }

    // Log in without revealing which credential was incorrect
    @PostMapping("/login")
    public String loginUser(
            @Valid @ModelAttribute("loginForm") LoginForm loginForm,
            BindingResult bindingResult,
            Model model,
            HttpSession session) {

        if (bindingResult.hasErrors()) {
            loginForm.setPassword(null);
            addAuthPageData(model);
            return "auth";
        }

        try {
            User loggedInUser = userService.login(loginForm);
            session.setAttribute("userId", loggedInUser.getId());
            return loggedInUser.isOnboardingComplete()
                    ? "redirect:/dashboard"
                    : "redirect:/onboarding";
        } catch (IllegalArgumentException exception) {
            loginForm.setPassword(null);
            bindingResult.reject("login", "Email or password is incorrect.");
            model.addAttribute("errorMessage", "Email or password is incorrect.");
            addAuthPageData(model);
            return "auth";
        }
    }

    // Log out the current user
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    private void addAuthPageData(Model model) {
        if (!model.containsAttribute("registrationForm")) {
            model.addAttribute("registrationForm", new RegistrationForm());
        }
        if (!model.containsAttribute("loginForm")) {
            model.addAttribute("loginForm", new LoginForm());
        }
        model.addAttribute("palestineCities", userService.getPalestineCities());
    }
}
