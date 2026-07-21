package com.axsos.Life.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.axsos.Life.models.FoodMateConnection;

public interface FoodMateConnectionRepository extends JpaRepository<FoodMateConnection, Long> {

    // Incoming pending requests for a user's "requests" inbox
    List<FoodMateConnection> findByRecipientIdAndStatus(Long recipientId, String status);

    // Every ACCEPTED connection this user is part of, either side -
    // used to build the "pick your Food Mates" list when creating a
    // MealCircle session. We need both because a connection could
    // have been requested BY this user or received BY this user.
    List<FoodMateConnection> findByRequesterIdAndStatus(Long requesterId, String status);

    // Stops the same two people from having two pending requests
    // at once (this backs up the SQL UNIQUE constraint on the Java side).
    Optional<FoodMateConnection> findByRequesterIdAndRecipientId(Long requesterId, Long recipientId);
}
