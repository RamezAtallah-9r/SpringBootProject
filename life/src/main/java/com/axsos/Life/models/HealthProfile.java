package com.axsos.Life.models;

import java.time.LocalTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
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

	@OneToOne(optional = false)
	@JoinColumn(name = "user_id", nullable = false, unique = true)
	private User user;

	@NotNull(message = "Age is required.")
	@Min(value = 16, message = "Age must be at least 16.")
	@Max(value = 100, message = "Age cannot be greater than 100.")
	private Integer age;

//  The user must select a gender
	@NotBlank(message = "Please select your gender.")
	private String gender;

	@NotBlank(message = "Blood type is required")
	private String bloodType;

	// Height cannot be less than 100 cm
	// Height cannot be greater than 250 cm

	@NotNull(message = "Height is required.")
	@DecimalMin(value = "100.0", message = "Height must be at least 100 cm.")
	@DecimalMax(value = "250.0", message = "Height cannot exceed 250 cm.")
	private Double height;

	// Maximum weight 300kg
	// Minimum weight 30kg

	@NotNull(message = "Weight is required.")
	@DecimalMin(value = "30.0", message = "Weight must be at least 30 kg.")
	@DecimalMax(value = "300.0", message = "Weight cannot exceed 300 kg.")
	private Double currentWeight;
	
	@NotNull(message = "Target weight is required")
	@DecimalMin(value = "25.0", message = "Minimum target weight is 25 kg")
	@DecimalMax(value = "400.0", message = "Maximum target weight is 400 kg")
	private Double targetWeight;	

	@NotBlank(message = "Activity level is required")
	private String activityLevel;

	@NotBlank(message = "Occupation is required")
	private String occupation;


	@NotNull(message = "Work start time is required")
	private LocalTime workStart = LocalTime.of(9, 0); // 09:00 AM

	@NotNull(message = "Work end time is required")
	private LocalTime workEnd = LocalTime.of(17, 0); // 05:00 PM

	@NotNull(message = "Bedtime is required")
	private LocalTime bedtime = LocalTime.of(23, 0); // 11:00 PM

	@NotNull(message = "Wake-up time is required")
	private LocalTime wakeUpTime = LocalTime.of(7, 0); // 07:00 AM

	// Page 6: Medical

    @Column(columnDefinition = "TEXT")
    private String conditions;

    @Column(columnDefinition = "TEXT")
    private String allergies;

    @Column(columnDefinition = "TEXT")
    private String medications;

    private Boolean pregnant = false;

    private Boolean eatingDisorderHistory = false;

	// Page 7: Goals

    private String inBodyFileName;

    private String inBodyFilePath;

	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	public HealthProfile() {

	}

	// Getters & Setters

	@Transient
	private MultipartFile inBodyFile;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
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

	public Integer getAge() {
		return age;
	}

	public String getBloodType() {
		return bloodType;
	}

	public String getGender() {
		return gender;
	}

	public Double getHeight() {
		return height;
	}

	public Double getCurrentWeight() {
		return currentWeight;
	}

	public String getActivityLevel() {
		return activityLevel;
	}

	public String getOccupation() {
		return occupation;
	}

	public LocalTime getWorkStart() {
		return workStart;
	}

	public LocalTime getWorkEnd() {
		return workEnd;
	}

	public LocalTime getBedtime() {
		return bedtime;
	}

	public LocalTime getWakeUpTime() {
		return wakeUpTime;
	}


	public Double getTargetWeight() {
		return targetWeight;
	}

	public String getInBodyFileName() {
		return inBodyFileName;
	}

	public MultipartFile getInBodyFile() {
		return inBodyFile;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setAge(Integer age) {
		this.age = age;
	}
	

	public String getConditions() {
		return conditions;
	}

	public void setConditions(String conditions) {
		this.conditions = conditions;
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

	public Boolean getPregnant() {
		return pregnant;
	}

	public void setPregnant(Boolean pregnant) {
		this.pregnant = pregnant;
	}

	public Boolean getEatingDisorderHistory() {
		return eatingDisorderHistory;
	}

	public void setEatingDisorderHistory(Boolean eatingDisorderHistory) {
		this.eatingDisorderHistory = eatingDisorderHistory;
	}

	public String getInBodyFilePath() {
		return inBodyFilePath;
	}

	public void setInBodyFilePath(String inBodyFilePath) {
		this.inBodyFilePath = inBodyFilePath;
	}

	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public void setCurrentWeight(Double currentWeight) {
		this.currentWeight = currentWeight;
	}

	public void setActivityLevel(String activityLevel) {
		this.activityLevel = activityLevel;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}


	public void setWorkStart(LocalTime workStart) {
		this.workStart = workStart;
	}

	public void setWorkEnd(LocalTime workEnd) {
		this.workEnd = workEnd;
	}

	public void setBedtime(LocalTime bedtime) {
		this.bedtime = bedtime;
	}

	public void setWakeUpTime(LocalTime wakeUpTime) {
		this.wakeUpTime = wakeUpTime;
	}


	public void setTargetWeight(Double targetWeight) {
		this.targetWeight = targetWeight;
	}

	public void setInBodyFileName(String inBodyFileName) {
		this.inBodyFileName = inBodyFileName;
	}

	public void setInBodyFile(MultipartFile inBodyFile) {
		this.inBodyFile = inBodyFile;
	}
}
