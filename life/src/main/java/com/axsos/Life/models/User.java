package com.axsos.Life.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.*;

// @Entity: this class maps to a table in the database
@Entity
// The actual table name in the database is "users"
@Table(name = "users")
public class User {

    // Primary key, auto-incremented by the database
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Name - at least 2 characters, not blank
    @NotEmpty(message = "Name is required!")
    @Size(min = 2, max = 60, message = "Name must be between 2 and 60 characters")
    private String name;

    // Email - valid email format, not blank
    // (checking that it does not already exist in the database
    //  happens in the service, because it needs a database query)
    @NotEmpty(message = "Email is required!")
    @Email(message = "Please enter a valid email!")
    private String email;

    // Phone - used for the WhatsApp coaching in HealthSync.
    // The regex allows an optional + then 9 to 15 digits/spaces/dashes.
    @NotEmpty(message = "Phone is required!")
    @Pattern(regexp = "^\\+?[0-9\\s-]{9,15}$",
            message = "Please enter a valid phone, e.g. +970 59 000 0000")
    private String phone;

    // Password - at least 8 characters, with at least
    // one uppercase letter and one numeral
    @NotEmpty(message = "Password is required!")
    @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters")
    @Pattern(regexp = "^(?=.*[A-Z])(?=.*\\d).*$",
            message = "Password must contain at least one uppercase letter and one numeral!")
    private String password;

    // @Transient: this field is NOT stored in the database.
    // We only use it temporarily to compare it against the password.
    @Transient
    @NotEmpty(message = "Confirm Password is required!")
    @Size(min = 8, max = 128, message = "Confirm Password must be between 8 and 128 characters")
    private String confirm;

    // City - drop-down menu on the form (replaces "your goals")
    @NotEmpty(message = "Please select your city!")
    private String city;

    // Empty constructor required by JPA
    public User() {
    }

    // ----- getters and setters -----
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
