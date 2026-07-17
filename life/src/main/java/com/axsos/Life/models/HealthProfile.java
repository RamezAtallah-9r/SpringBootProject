package com.axsos.Life.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
//import jakarta.persistence.JoinColumn;
//import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "health_profiles")
public class HealthProfile {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
//    Each user can have only one HealthProfile.
	
//    optional = false means every HealthProfile
//    must belong to a User.
	
//	  nullable = false:
//	  The profile cannot exist without a user.
	
//	  unique = true:
//	  The same user cannot have multiple health profiles.

//    @OneToOne(optional = false)
//    @JoinColumn(name = "user_id", nullable = false, unique = true)
//    private User user;
	
	

	@NotNull(message = "Age is required.")
	@Min(value = 16, message = "Age must be at least 16.")
	@Max(value = 100, message = "Age cannot be greater than 100.")
	private Integer age;
	
//  The user must select a gender
	@NotBlank(message = "Please select your gender.")
	private String gender;

	// Height cannot be less than 100 cm
	// Height cannot be greater than 250 cm
	
	@NotNull(message = "Height is required.")
	@DecimalMin(value = "100.0", message = "Height must be at least 100 cm.")
	@DecimalMax(value = "250.0", message = "Height cannot exceed 250 cm.")
	private Double heightCm;
	
	// Maximum weight 300kg
	// Minimum weight 30kg

	@NotNull(message = "Weight is required.")
	@DecimalMin(value = "30.0", message = "Weight must be at least 30 kg.")
	@DecimalMax(value = "300.0", message = "Weight cannot exceed 300 kg.")
	private Double weightKg;

	@NotBlank(message = "Please select your goal.")
	private String goal;

	@NotBlank(message = "Please select your activity level.")
	private String activityLevel;

	@Column(length = 1000)
	private String diseases;

	@Column(length = 1000)
	private String allergies;

	@Column(length = 1000)
	private String medications;

	@Column(length = 1000)
	private String injuries;

	private String workStart;
	private String workEnd;
	private String sleepTime;
	private String wakeTime;

	@DecimalMin(value = "0.0", message = "Sleep hours cannot be negative.")
	@DecimalMax(value = "24.0", message = "Sleep hours cannot exceed 24.")
	private Double sleepHours;

	@Min(value = 1, message = "Water goal must be at least one glass.")
	@Max(value = 30, message = "Water goal cannot exceed 30 glasses.")
	private Integer waterGoalGlasses;

	@DecimalMin(value = "0.0", message = "Budget cannot be negative.")
	private Double dailyBudgetNis;

	@Column(length = 1000)
	private String favoriteFoods;

	@Column(length = 1000)
	private String dislikedFoods;

	@Column(nullable = false)
	private boolean smoker;

	@Column(nullable = false)
	private boolean medicalFlag;

	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	public HealthProfile() {
	}

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

//    public User getUser() {
//        return user;
//    }
//
//    public void setUser(User user) {
//        this.user = user;
//    }

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Double getHeightCm() {
		return heightCm;
	}

	public void setHeightCm(Double heightCm) {
		this.heightCm = heightCm;
	}

	public Double getWeightKg() {
		return weightKg;
	}

	public void setWeightKg(Double weightKg) {
		this.weightKg = weightKg;
	}

	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}

	public String getActivityLevel() {
		return activityLevel;
	}

	public void setActivityLevel(String activityLevel) {
		this.activityLevel = activityLevel;
	}

	public String getDiseases() {
		return diseases;
	}

	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}

	public String getAllergies() {
		return allergies;
	}

	public void setAllergies(String allergies) {
		this.allergies = allergies;
	}

	public String getMedications() {
		return medications;
	}

	public void setMedications(String medications) {
		this.medications = medications;
	}

	public String getInjuries() {
		return injuries;
	}

	public void setInjuries(String injuries) {
		this.injuries = injuries;
	}

	public String getWorkStart() {
		return workStart;
	}

	public void setWorkStart(String workStart) {
		this.workStart = workStart;
	}

	public String getWorkEnd() {
		return workEnd;
	}

	public void setWorkEnd(String workEnd) {
		this.workEnd = workEnd;
	}

	public String getSleepTime() {
		return sleepTime;
	}

	public void setSleepTime(String sleepTime) {
		this.sleepTime = sleepTime;
	}

	public String getWakeTime() {
		return wakeTime;
	}

	public void setWakeTime(String wakeTime) {
		this.wakeTime = wakeTime;
	}

	public Double getSleepHours() {
		return sleepHours;
	}

	public void setSleepHours(Double sleepHours) {
		this.sleepHours = sleepHours;
	}

	public Integer getWaterGoalGlasses() {
		return waterGoalGlasses;
	}

	public void setWaterGoalGlasses(Integer waterGoalGlasses) {
		this.waterGoalGlasses = waterGoalGlasses;
	}

	public Double getDailyBudgetNis() {
		return dailyBudgetNis;
	}

	public void setDailyBudgetNis(Double dailyBudgetNis) {
		this.dailyBudgetNis = dailyBudgetNis;
	}

	public String getFavoriteFoods() {
		return favoriteFoods;
	}

	public void setFavoriteFoods(String favoriteFoods) {
		this.favoriteFoods = favoriteFoods;
	}

	public String getDislikedFoods() {
		return dislikedFoods;
	}

	public void setDislikedFoods(String dislikedFoods) {
		this.dislikedFoods = dislikedFoods;
	}

	public boolean isSmoker() {
		return smoker;
	}

	public void setSmoker(boolean smoker) {
		this.smoker = smoker;
	}

	public boolean isMedicalFlag() {
		return medicalFlag;
	}

	public void setMedicalFlag(boolean medicalFlag) {
		this.medicalFlag = medicalFlag;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

}
