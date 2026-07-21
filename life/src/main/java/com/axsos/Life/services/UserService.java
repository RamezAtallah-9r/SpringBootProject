package com.axsos.Life.services;

import java.util.Optional;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.axsos.Life.models.LoginUser;
import com.axsos.Life.models.User;
import com.axsos.Life.repositories.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepo;

    // ==========================
    // Register
    // ==========================
    public User register(User newUser, BindingResult result) {

        // Check email exists
        Optional<User> existingEmail = userRepo.findByEmail(newUser.getEmail());
        if (existingEmail.isPresent()) {
            result.rejectValue("email", "Exists", "Email already exists!");
        }

        // Check phone exists
        Optional<User> existingPhone = userRepo.findByPhone(newUser.getPhone());
        if (existingPhone.isPresent()) {
            result.rejectValue("phone", "Exists", "Phone number already registered!");
        }

        // Check password match
        if (!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Match", "Passwords don't match!");
        }

        if (result.hasErrors()) {
            return null;
        }

        // Hash password
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);

        return userRepo.save(newUser);
    }

    // ==========================
    // Login
    // ==========================
    public User login(LoginUser loginUser, BindingResult result) {

        Optional<User> existingUser = userRepo.findByEmail(loginUser.getEmail());

        if (existingUser.isEmpty()) {
            result.rejectValue("email", "NotFound", "Invalid Email or Password");
            return null;
        }

        User user = existingUser.get();

        if (!BCrypt.checkpw(loginUser.getPassword(), user.getPassword())) {
            result.rejectValue("password", "Invalid", "Invalid Email or Password");
        }

        if (result.hasErrors()) {
            return null;
        }

        return user;
    }

    // ==========================
    // Find User
    // ==========================
    public User findById(Long id) {
        return userRepo.findById(id).orElse(null);
    }
}