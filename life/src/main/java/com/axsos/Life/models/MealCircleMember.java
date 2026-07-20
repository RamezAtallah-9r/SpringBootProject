package com.axsos.Life.models;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "meal_circle_members")
public class MealCircleMember {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "session_id", nullable = false)
    private MealCircleSession session;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "individual_meal_text")
    private String individualMealText;

    @Column(name = "joined_at")
    private LocalDateTime joinedAt = LocalDateTime.now();

    public MealCircleMember() {
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public MealCircleSession getSession() { return session; }
    public void setSession(MealCircleSession session) { this.session = session; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public String getIndividualMealText() { return individualMealText; }
    public void setIndividualMealText(String individualMealText) { this.individualMealText = individualMealText; }

    public LocalDateTime getJoinedAt() { return joinedAt; }
    public void setJoinedAt(LocalDateTime joinedAt) { this.joinedAt = joinedAt; }
}