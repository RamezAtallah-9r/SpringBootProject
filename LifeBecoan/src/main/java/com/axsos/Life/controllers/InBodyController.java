package com.axsos.Life.controllers;

import java.time.LocalDate;

import com.axsos.Life.models.InBodyForm;
import com.axsos.Life.models.User;
import com.axsos.Life.services.InBodyService;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class InBodyController {

    private final UserService userService;
    private final InBodyService inBodyService;
    private final RoadmapService roadmapService;

    public InBodyController(UserService userService, InBodyService inBodyService,
            RoadmapService roadmapService) {
        this.userService = userService;
        this.inBodyService = inBodyService;
        this.roadmapService = roadmapService;
    }

    // Show manual entry, upload form, and report history
    @GetMapping("/inbody")
    public String showInBodyPage(HttpSession session, Model model) {
        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) return "redirect:/auth";

        if (!model.containsAttribute("inBodyForm")) {
            InBodyForm inBodyForm = new InBodyForm();
            inBodyForm.setReportDate(LocalDate.now());
            model.addAttribute("inBodyForm", inBodyForm);
        }
        addPageData(model, loggedInUser);
        return "inbody";
    }

    // Analyze an uploaded file and show editable values
    @PostMapping("/inbody/analyze-file")
    public String analyzeFile(@RequestParam("inbodyFile") MultipartFile file,
            HttpSession session, Model model) {
        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) return "redirect:/auth";

        try {
            model.addAttribute("inBodyForm", inBodyService.extract(file));
            model.addAttribute("info", "Review and correct the extracted values before saving.");
        } catch (IllegalArgumentException exception) {
            model.addAttribute("inBodyForm", new InBodyForm());
            model.addAttribute("error", exception.getMessage());
        }
        addPageData(model, loggedInUser);
        return "inbody";
    }

    // Save the confirmed values and refresh the roadmap
    @PostMapping("/inbody/save")
    public String saveInBodyReport(
            @Valid @ModelAttribute("inBodyForm") InBodyForm inBodyForm,
            BindingResult bindingResult,
            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes) {

        User loggedInUser = getLoggedInUser(session);
        if (loggedInUser == null) return "redirect:/auth";
        if (bindingResult.hasErrors()) {
            addPageData(model, loggedInUser);
            return "inbody";
        }

        inBodyService.save(loggedInUser, inBodyForm);
        roadmapService.generate(loggedInUser, "INBODY");
        redirectAttributes.addFlashAttribute("success",
                "InBody report saved and today's roadmap refreshed.");
        return "redirect:/inbody";
    }

    private void addPageData(Model model, User user) {
        model.addAttribute("history", inBodyService.history(user.getId()));
        model.addAttribute("latest", inBodyService.latest(user.getId()).orElse(null));
    }

    private User getLoggedInUser(HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        return userId == null ? null : userService.findUserById(userId);
    }
}
