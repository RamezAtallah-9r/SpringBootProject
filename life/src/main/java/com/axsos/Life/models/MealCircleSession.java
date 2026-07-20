package com.axsos.Life.models;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "meal_circle_sessions")
public class MealCircleSession {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "creator_id", nullable = false)
    private User creator;

    @Column(length = 100)
    private String city;

    // ACTIVE, RESOLVED, or EXPIRED
    @Column(nullable = false, length = 20)
    private String status = "ACTIVE";

    @Column(name = "common_restaurant")
    private String commonRestaurant;

    @Column(name = "common_meal")
    private String commonMeal;

    private boolean viewed = false;

    @Column(name = "created_at")
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(name = "expires_at", nullable = false)
    private LocalDateTime expiresAt;

    @OneToMany(mappedBy = "session", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<MealCircleMember> members = new ArrayList<>();

    public MealCircleSession() {
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public User getCreator() { return creator; }
    public void setCreator(User creator) { this.creator = creator; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getCommonRestaurant() { return commonRestaurant; }
    public void setCommonRestaurant(String commonRestaurant) { this.commonRestaurant = commonRestaurant; }

    public String getCommonMeal() { return commonMeal; }
    public void setCommonMeal(String commonMeal) { this.commonMeal = commonMeal; }

    public boolean isViewed() { return viewed; }
    public void setViewed(boolean viewed) { this.viewed = viewed; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public LocalDateTime getExpiresAt() { return expiresAt; }
    public void setExpiresAt(LocalDateTime expiresAt) { this.expiresAt = expiresAt; }

    public List<MealCircleMember> getMembers() { return members; }
    public void setMembers(List<MealCircleMember> members) { this.members = members; }
}