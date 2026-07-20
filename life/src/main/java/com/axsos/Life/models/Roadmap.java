package com.axsos.Life.models;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "roadmaps")
public class Roadmap {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "roadmap_date", nullable = false)
    private LocalDate roadmapDate;

    @Column(name = "target_kcal")
    private Integer targetKcal;

    @Column(name = "target_water_ml")
    private Integer targetWaterMl;

    @Column(name = "target_protein")
    private Double targetProtein;

    @Column(name = "target_carb")
    private Double targetCarb;

    @Column(name = "target_fat")
    private Double targetFat;

    @Column(name = "generated_at")
    private LocalDateTime generatedAt = LocalDateTime.now();

    // "LOGIN" (auto-generated on first login of the day) or "MANUAL"
    // (user clicked the Regenerate button).
    @Column(name = "trigger_source", nullable = false, length = 20)
    private String triggerSource;

    // One Roadmap has many RoadmapItems (meals, water, workouts).
    // mappedBy = "roadmap" means the FOREIGN KEY lives on the
    // RoadmapItem side (roadmap_id column) - Roadmap itself has no
    // extra column for this, it's just a convenient Java-side list.
    @OneToMany(mappedBy = "roadmap", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<RoadmapItem> items = new ArrayList<>();

    public Roadmap() {
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public LocalDate getRoadmapDate() { return roadmapDate; }
    public void setRoadmapDate(LocalDate roadmapDate) { this.roadmapDate = roadmapDate; }

    public Integer getTargetKcal() { return targetKcal; }
    public void setTargetKcal(Integer targetKcal) { this.targetKcal = targetKcal; }

    public Integer getTargetWaterMl() { return targetWaterMl; }
    public void setTargetWaterMl(Integer targetWaterMl) { this.targetWaterMl = targetWaterMl; }

    public Double getTargetProtein() { return targetProtein; }
    public void setTargetProtein(Double targetProtein) { this.targetProtein = targetProtein; }

    public Double getTargetCarb() { return targetCarb; }
    public void setTargetCarb(Double targetCarb) { this.targetCarb = targetCarb; }

    public Double getTargetFat() { return targetFat; }
    public void setTargetFat(Double targetFat) { this.targetFat = targetFat; }

    public LocalDateTime getGeneratedAt() { return generatedAt; }
    public void setGeneratedAt(LocalDateTime generatedAt) { this.generatedAt = generatedAt; }

    public String getTriggerSource() { return triggerSource; }
    public void setTriggerSource(String triggerSource) { this.triggerSource = triggerSource; }

    public List<RoadmapItem> getItems() { return items; }
    public void setItems(List<RoadmapItem> items) { this.items = items; }
}