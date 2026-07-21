package com.axsos.Life.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.axsos.Life.models.LoginUser;
import com.axsos.Life.models.User;
import com.axsos.Life.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

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
            HttpSession session) {

        User registeredUser = userService.register(newUser, result);

        if (result.hasErrors()) {
            return "auth";
        }

        // Store logged-in user id in session
        session.setAttribute("userId", registeredUser.getId());

        // Redirect to onboarding page
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
            HttpSession session) {

        User loggedInUser = userService.login(newLogin, result);

        if (result.hasErrors()) {
            return "auth";
        }

        // Save user id into session
        session.setAttribute("userId", loggedInUser.getId());

        // Redirect to dashboard
        return "redirect:/dashboard";
    }

    // ==========================================
    // Dashboard
    // ==========================================
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {

        if (session.getAttribute("userId") == null) {
            return "redirect:/auth";
        }

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