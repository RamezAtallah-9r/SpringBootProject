package com.axsos.Life.services;

import java.util.List;
import java.util.regex.Pattern;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;

import com.axsos.Life.models.LoginForm;
import com.axsos.Life.models.RegistrationForm;
import com.axsos.Life.models.User;
import com.axsos.Life.repositories.UserRepository;

@Service
public class UserService {

    private static final Pattern NAME_PATTERN = Pattern.compile("^[\\p{L} .'-]+$");
    private static final Pattern PHONE_PATTERN = Pattern.compile("^$|^[+0-9 ()-]{7,20}$");
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$");

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // Keep one city list for registration and profile editing
    public List<String> getPalestineCities() {
        return List.of(
                "Ramallah", "Al-Bireh", "Jerusalem", "Bethlehem", "Beit Jala",
                "Beit Sahour", "Hebron", "Nablus", "Jenin", "Tulkarm",
                "Qalqilya", "Jericho", "Salfit", "Tubas", "Gaza City",
                "Khan Yunis", "Rafah", "Deir al-Balah", "Jabalia", "Beit Lahia", "Other");
    }

    // Register a new user as one complete database action
    @Transactional
    public User register(RegistrationForm registrationForm) {
        String email = registrationForm.getEmail().trim().toLowerCase();

        if (userRepository.existsByEmailIgnoreCase(email)) {
            throw new IllegalArgumentException("Email is already registered.");
        }
        if (!registrationForm.getPassword().equals(registrationForm.getConfirmPassword())) {
            throw new IllegalArgumentException("Passwords do not match.");
        }
        if (!getPalestineCities().contains(registrationForm.getCity())) {
            throw new IllegalArgumentException("Please select a valid city.");
        }

        User user = new User();
        user.setName(registrationForm.getName().trim());
        user.setEmail(email);
        user.setPhone(cleanOptionalText(registrationForm.getPhone()));
        user.setCity(registrationForm.getCity());
        user.setPasswordHash(passwordEncoder.encode(registrationForm.getPassword()));
        return userRepository.save(user);
    }

    // Check login email and password
    public User login(LoginForm loginForm) {
        String email = loginForm.getEmail() == null ? "" : loginForm.getEmail().trim();
        return userRepository.findByEmailIgnoreCase(email)
                .filter(user -> passwordEncoder.matches(loginForm.getPassword(), user.getPasswordHash()))
                .orElseThrow(() -> new IllegalArgumentException("Email or password is incorrect."));
    }

    // Find a user by id
    public User findUserById(Long userId) {
        return userRepository.findById(userId).orElse(null);
    }

    // Validate account fields before updating the current user
    public void validateAccountUpdate(User currentUser, String name, String email,
            String phone, String city, BindingResult bindingResult) {

        String cleanName = name == null ? "" : name.trim();
        String cleanEmail = email == null ? "" : email.trim().toLowerCase();
        String cleanPhone = phone == null ? "" : phone.trim();

        if (cleanName.length() < 2 || cleanName.length() > 60) {
            bindingResult.reject("account.name", "Name must be between 2 and 60 characters.");
        } else if (!NAME_PATTERN.matcher(cleanName).matches()) {
            bindingResult.reject("account.name", "Use letters, spaces, apostrophes, or hyphens only.");
        }

        if (!EMAIL_PATTERN.matcher(cleanEmail).matches()) {
            bindingResult.reject("account.email", "Enter a valid email address.");
        } else {
            userRepository.findByEmailIgnoreCase(cleanEmail)
                    .filter(otherUser -> !otherUser.getId().equals(currentUser.getId()))
                    .ifPresent(otherUser -> bindingResult.reject("account.email", "Email is already registered."));
        }

        if (!PHONE_PATTERN.matcher(cleanPhone).matches()) {
            bindingResult.reject("account.phone", "Enter a valid phone number.");
        }

        if (!getPalestineCities().contains(city)) {
            bindingResult.reject("account.city", "Please select a valid city.");
        }
    }

    // Update account information without changing the password hash
    @Transactional
    public User updateUserAccount(User currentUser, String name, String email, String phone, String city) {
        currentUser.setName(name.trim());
        currentUser.setEmail(email.trim().toLowerCase());
        currentUser.setPhone(cleanOptionalText(phone));
        currentUser.setCity(city);
        return userRepository.save(currentUser);
    }

    private String cleanOptionalText(String value) {
        return value == null || value.trim().isEmpty() ? null : value.trim();
    }
}
