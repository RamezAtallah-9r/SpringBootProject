package com.axsos.Life.models;

import jakarta.validation.constraints.*;

public class RegistrationForm {
	@NotBlank(message = "Name is required")
	@Size(min = 2, max = 60, message = "Name must be between 2 and 60 characters")
	@Pattern(
	    regexp = "^[\\p{L} .'-]+$",
	    message = "Use letters, spaces, apostrophes, or hyphens only"
	)
	private String name;
	@NotBlank
	@Email
	private String email;
	@Pattern(regexp = "^$|^[+0-9 ()-]{7,20}$", message = "Invalid phone")
	private String phone;
	@NotBlank
	@Size(min = 2, max = 80)
	private String city;
	@NotBlank
	@Size(min = 8, max = 72)
	private String password;
	@NotBlank
	private String confirmPassword;

	public String getName() {
		return name;
	}

	public void setName(String v) {
		name = v;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String v) {
		email = v;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String v) {
		phone = v;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String v) {
		city = v;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String v) {
		password = v;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String v) {
		confirmPassword = v;
	}
}
