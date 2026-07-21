package com.axsos.Life.models;

import jakarta.persistence.Column;
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

    @NotEmpty(message = "Name is required!")
    @Size(min = 2, max = 60, message = "Name must be between 2 and 60 characters")
    @Pattern(regexp = "^[A-Za-z ]+$",
            message = "Name must contain letters only (no numbers or symbols)")
    private String name;

    @NotEmpty(message = "Email is required!")
    @Email(message = "Please enter a valid email!")
    private String email;

    // NEW: unique = true adds a database-level constraint as a backup
    // to the Java-side check in UserService, in case two registration
    // requests happen at the exact same moment.
    @Column(unique = true)
    @NotEmpty(message = "Phone is required!")
    @Pattern(regexp = "^[0-9]{10,11}$",
            message = "Phone must be 10 or 11 digits (numbers only)")
    private String phone;

    @NotEmpty(message = "Password is required!")
    @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters")
    @Pattern(regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d).*$",
            message = "Password must contain an uppercase letter, a lowercase letter, and a number!")
    private String password;

    @Transient
    @NotEmpty(message = "Confirm Password is required!")
    @Size(min = 8, max = 128, message = "Confirm Password must be between 8 and 128 characters")
    private String confirm;

    @NotEmpty(message = "Please select your city!")
    @Pattern(regexp = "^[A-Za-z ]+$", message = "City must contain letters only")
    private String city;

    public User() {
    }

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