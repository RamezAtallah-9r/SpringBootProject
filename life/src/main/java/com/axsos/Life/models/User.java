package com.axsos.Life.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Name: required, 2-60 chars, LETTERS AND SPACES ONLY
    // (no numbers, no special characters)
    @NotEmpty(message = "Name is required!")
    @Size(min = 2, max = 60, message = "Name must be between 2 and 60 characters")
    @Pattern(regexp = "^[A-Za-z ]+$",
            message = "Name must contain letters only (no numbers or symbols)")
    private String name;

    // Email: required + must look like a real email (something@something.something)
    @NotEmpty(message = "Email is required!")
    @Email(message = "Please enter a valid email!")
    private String email;

    // Phone: EXACTLY 10 or 11 digits, numbers only
    @NotEmpty(message = "Phone is required!")
    @Pattern(regexp = "^[0-9]{10,11}$",
            message = "Phone must be 10 or 11 digits (numbers only)")
    private String phone;

    // Password: at least 8 chars, must contain at least one
    // UPPERCASE letter, one lowercase letter, and one number
    @NotEmpty(message = "Password is required!")
    @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters")
    @Pattern(regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d).*$",
            message = "Password must contain an uppercase letter, a lowercase letter, and a number!")
    private String password;

    // Confirm password: not saved to the database (@Transient),
    // only used to compare against password in the service
    @Transient
    @NotEmpty(message = "Confirm Password is required!")
    private String confirm;

    // City: required, letters only (rejects numbers even if someone
    // bypasses the dropdown and sends a custom value)
    @NotEmpty(message = "Please select your city!")
    @Pattern(regexp = "^[A-Za-z ]+$", message = "City must contain letters only")
    private String city;

    public User() {
    }

    // ----- getters and setters (unchanged) -----
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getConfirm() { return confirm; }
    public void setConfirm(String confirm) { this.confirm = confirm; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
}