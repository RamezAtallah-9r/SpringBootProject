package com.axsos.Life.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	@GetMapping("/auth")
	public String auth() {
		
		return "auth";
	}
}
