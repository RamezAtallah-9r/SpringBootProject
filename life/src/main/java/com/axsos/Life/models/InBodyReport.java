package com.axsos.Life.models;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "inbody_reports")
public class InBodyReport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "report_date", nullable = false)
    private LocalDate reportDate;

    @Column(name = "file_path")
    private String filePath;

    private Double weight;

    @Column(name = "muscle_mass")
    private Double muscleMass;

    @Column(name = "fat_percentage")
    private Double fatPercentage;

    @Column(name = "visceral_fat")
    private Integer visceralFat;

    private Double tbw;

    private Integer bmr;

    @Column(name = "created_at")
    private LocalDateTime createdAt = LocalDateTime.now();

    public InBodyReport() {
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public LocalDate getReportDate() { return reportDate; }
    public void setReportDate(LocalDate reportDate) { this.reportDate = reportDate; }

    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }

    public Double getWeight() { return weight; }
    public void setWeight(Double weight) { this.weight = weight; }

    public Double getMuscleMass() { return muscleMass; }
    public void setMuscleMass(Double muscleMass) { this.muscleMass = muscleMass; }

    public Double getFatPercentage() { return fatPercentage; }
    public void setFatPercentage(Double fatPercentage) { this.fatPercentage = fatPercentage; }

    public Integer getVisceralFat() { return visceralFat; }
    public void setVisceralFat(Integer visceralFat) { this.visceralFat = visceralFat; }

    public Double getTbw() { return tbw; }
    public void setTbw(Double tbw) { this.tbw = tbw; }

    public Integer getBmr() { return bmr; }
    public void setBmr(Integer bmr) { this.bmr = bmr; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}