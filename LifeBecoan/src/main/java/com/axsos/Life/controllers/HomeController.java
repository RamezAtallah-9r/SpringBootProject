package com.axsos.Life.controllers;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    // Show the landing page or continue to the dashboard
    @GetMapping("/")
    public String showHomePage(HttpSession session) {
        return session.getAttribute("userId") == null ? "index" : "redirect:/dashboard";
    }
}
