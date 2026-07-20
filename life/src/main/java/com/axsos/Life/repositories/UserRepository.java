package com.axsos.Life.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.Life.models.User;

// Repository for saving user data to the database.
@Repository
public interface UserRepository extends CrudRepository<User, Long> {

    // Finds a user by their email.
    // Returns an Optional: a container that may or may not hold a User,
    // which makes database queries safer when the object may not exist.
    Optional<User> findByEmail(String email);
}