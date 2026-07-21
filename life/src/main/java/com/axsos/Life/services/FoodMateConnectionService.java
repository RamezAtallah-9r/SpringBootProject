package com.axsos.Life.services;

import org.springframework.stereotype.Service;

import com.axsos.Life.models.FoodMateConnection;
import com.axsos.Life.models.User;
import com.axsos.Life.repositories.FoodMateConnectionRepository;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class FoodMateConnectionService {

    private final FoodMateConnectionRepository connectionRepository;

    public FoodMateConnectionService(FoodMateConnectionRepository connectionRepository) {
        this.connectionRepository = connectionRepository;
    }

    public FoodMateConnection sendRequest(User requester, User recipient) {
        if (connectionRepository.findByRequesterIdAndRecipientId(requester.getId(), recipient.getId()).isPresent()) {
            throw new IllegalArgumentException("A request already exists between these two users.");
        }
        FoodMateConnection connection = new FoodMateConnection();
        connection.setRequester(requester);
        connection.setRecipient(recipient);
        connection.setStatus("PENDING");
        return connectionRepository.save(connection);
    }

    public FoodMateConnection respond(Long connectionId, boolean accept) {
        FoodMateConnection connection = get(connectionId);
        connection.setStatus(accept ? "ACCEPTED" : "DECLINED");
        return connectionRepository.save(connection);
    }

    public List<FoodMateConnection> getPendingRequestsForUser(Long userId) {
        return connectionRepository.findByRecipientIdAndStatus(userId, "PENDING");
    }

    // Every accepted Food Mate, whichever side sent the original request
    public List<FoodMateConnection> getFoodMatesForUser(Long userId) {
        List<FoodMateConnection> asRequester = connectionRepository.findByRequesterIdAndStatus(userId, "ACCEPTED");
        List<FoodMateConnection> asRecipient = connectionRepository.findByRecipientIdAndStatus(userId, "ACCEPTED");
        return Stream.concat(asRequester.stream(), asRecipient.stream()).collect(Collectors.toList());
    }

    // ===== basic CRUD =====

    public FoodMateConnection get(Long id) {
        return connectionRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("No connection found with id " + id));
    }

    public List<FoodMateConnection> getAll() {
        return connectionRepository.findAll();
    }

    public FoodMateConnection update(FoodMateConnection connection) {
        return connectionRepository.save(connection);
    }

    public void delete(Long id) {
        connectionRepository.deleteById(id);
    }
}
