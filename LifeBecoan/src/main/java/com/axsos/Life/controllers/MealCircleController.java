package com.axsos.Life.controllers;

import com.axsos.Life.models.MealCircleForm;
import com.axsos.Life.models.MealCircleSession;
import com.axsos.Life.models.User;
import com.axsos.Life.services.MealCircleService;
import com.axsos.Life.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/mealcircle")
public class MealCircleController {

    private final UserService userService;
    private final MealCircleService mealCircleService;

    public MealCircleController(UserService userService, MealCircleService mealCircleService) {
        this.userService = userService;
        this.mealCircleService = mealCircleService;
    }

    // Show Food Mates and the group meal form
    @GetMapping
    public String showMealCircle(@RequestParam(required = false) String q,
            HttpSession session, Model model) {
        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) return "redirect:/auth";

        model.addAttribute("searchResults", mealCircleService.search(loggedInUser, q));
        model.addAttribute("incoming", mealCircleService.incoming(loggedInUser.getId()));
        model.addAttribute("mates", mealCircleService.accepted(loggedInUser));
        if (!model.containsAttribute("mealCircleForm")) {
            model.addAttribute("mealCircleForm", new MealCircleForm());
        }
        return "mealcircle";
    }

    // Send a Food Mate request
    @PostMapping("/requests")
    public String sendRequest(@RequestParam Long userId, HttpSession session,
            RedirectAttributes redirectAttributes) {
        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) return "redirect:/auth";
        try {
            mealCircleService.request(loggedInUser, userId);
            redirectAttributes.addFlashAttribute("success", "Food Mate request sent.");
        } catch (IllegalArgumentException exception) {
            redirectAttributes.addFlashAttribute("error", exception.getMessage());
        }
        return "redirect:/mealcircle";
    }

    // Accept or decline an incoming request
    @PostMapping("/requests/{requestId}/respond")
    public String respondToRequest(@PathVariable Long requestId,
            @RequestParam boolean accept, HttpSession session, Model model) {
        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) return "redirect:/auth";
        try {
            mealCircleService.respond(loggedInUser, requestId, accept);
            return "redirect:/mealcircle";
        } catch (IllegalArgumentException exception) {
            model.addAttribute("message", exception.getMessage());
            return "error";
        }
    }

    // Generate one shared meal and one meal for each selected person
    @PostMapping("/sessions")
    public String createSession(
            @Valid @ModelAttribute("mealCircleForm") MealCircleForm mealCircleForm,
            BindingResult bindingResult,
            HttpSession session,
            Model model) {

        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) return "redirect:/auth";
        if (bindingResult.hasErrors()) {
            return showMealCircle(null, session, model);
        }

        try {
            MealCircleSession mealCircleSession = mealCircleService.create(loggedInUser, mealCircleForm);
            return "redirect:/mealcircle/sessions/" + mealCircleSession.getId();
        } catch (IllegalArgumentException exception) {
            bindingResult.reject("session", exception.getMessage());
            return showMealCircle(null, session, model);
        }
    }

    // Show a MealCircle result only to its members
    @GetMapping("/sessions/{sessionId}")
    public String showSession(@PathVariable Long sessionId, HttpSession session, Model model) {
        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) return "redirect:/auth";
        try {
            model.addAttribute("session", mealCircleService.view(loggedInUser, sessionId));
            return "mealcircleResult";
        } catch (IllegalArgumentException exception) {
            model.addAttribute("message", exception.getMessage());
            return "error";
        }
    }

    private User getLoggedInUser(HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        return userId == null ? null : userService.findUserById(userId);
    }
}
