package com.axsos.Life.controllers;


import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.SecureRandom;

public class MainController {
	
	
	
	
	 @GetMapping("/")
	    public String landing() {
	        return "landing";
	    }

	 @GetMapping("/dashboard")
	    public String dashboard() {
	        return "dashboard";
	    }


	
}

