package com.axsos.Life.models;

import jakarta.persistence.*;
import java.time.LocalTime;

@Entity
@Table(name = "roadmap_items")
public class RoadmapItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "roadmap_id", nullable = false)
    private Roadmap roadmap;

    // "MEAL", "WATER", or "WORKOUT" - decides which of the fields
    // below actually get used. See the comments on each field.
    @Column(nullable = false, length = 20)
    private String category;

    // ----- MEAL only -----
    @Column(length = 20)
    private String slot; // BREAKFAST, SNACK, LUNCH, DINNER

    @Column(name = "items_text")
    private String itemsText;

    private Integer kcal;
    private Double protein;
    private Double carb;
    private Double fat;

    // ----- WATER only -----
    @Column(name = "amount_ml")
    private Integer amountMl;

    // ----- WORKOUT only -----
    @Column(name = "activity_type")
    private String activityType;

    @Column(name = "duration_or_reps")
    private String durationOrReps;

    // ----- shared by all categories -----
    @Column(name = "scheduled_time", nullable = false)
    private LocalTime scheduledTime;

    // PENDING, DONE, SKIPPED, or CHANGED - this is what the
    // Dashboard's quick-action buttons update.
    @Column(nullable = false, length = 20)
    private String status = "PENDING";

    // Only filled in when status = CHANGED, e.g. "had cereal instead"
    @Column(name = "actual_text")
    private String actualText;

    public RoadmapItem() {
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Roadmap getRoadmap() { return roadmap; }
    public void setRoadmap(Roadmap roadmap) { this.roadmap = roadmap; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getSlot() { return slot; }
    public void setSlot(String slot) { this.slot = slot; }

    public String getItemsText() { return itemsText; }
    public void setItemsText(String itemsText) { this.itemsText = itemsText; }

    public Integer getKcal() { return kcal; }
    public void setKcal(Integer kcal) { this.kcal = kcal; }

    public Double getProtein() { return protein; }
    public void setProtein(Double protein) { this.protein = protein; }

    public Double getCarb() { return carb; }
    public void setCarb(Double carb) { this.carb = carb; }

    public Double getFat() { return fat; }
    public void setFat(Double fat) { this.fat = fat; }

    public Integer getAmountMl() { return amountMl; }
    public void setAmountMl(Integer amountMl) { this.amountMl = amountMl; }

    public String getActivityType() { return activityType; }
    public void setActivityType(String activityType) { this.activityType = activityType; }

    public String getDurationOrReps() { return durationOrReps; }
    public void setDurationOrReps(String durationOrReps) { this.durationOrReps = durationOrReps; }

    public LocalTime getScheduledTime() { return scheduledTime; }
    public void setScheduledTime(LocalTime scheduledTime) { this.scheduledTime = scheduledTime; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getActualText() { return actualText; }
    public void setActualText(String actualText) { this.actualText = actualText; }
}