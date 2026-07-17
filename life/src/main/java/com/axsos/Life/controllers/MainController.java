package com.axsos.Life.controllers;

import org.springframework.web.bind.annotation.GetMapping;

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
