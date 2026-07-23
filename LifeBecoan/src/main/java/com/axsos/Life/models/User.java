package com.axsos.Life.models;
import jakarta.persistence.*; import java.util.*;
@Entity @Table(name="users",uniqueConstraints=@UniqueConstraint(name="uk_user_email",columnNames="email"))
public class User extends BaseEntity {
 @Id @GeneratedValue(strategy=GenerationType.IDENTITY) private Long id;
 @Column(nullable=false,length=60) private String name;
 @Column(nullable=false,length=160) private String email;
 @Column(nullable=false,length=100) private String passwordHash;
 @Column(length=30) private String phone;
 @Column(nullable=false,length=80) private String city;
 @Column(nullable=false,length=10) private String language="en";
 private boolean emailVerified=true; private boolean onboardingComplete=false;
 @OneToOne(mappedBy="user",cascade=CascadeType.ALL,orphanRemoval=true,fetch=FetchType.LAZY) private HealthProfile healthProfile;
 public Long getId(){return id;} public void setId(Long v){id=v;} public String getName(){return name;} public void setName(String v){name=v;} public String getEmail(){return email;} public void setEmail(String v){email=v;} public String getPasswordHash(){return passwordHash;} public void setPasswordHash(String v){passwordHash=v;} public String getPhone(){return phone;} public void setPhone(String v){phone=v;} public String getCity(){return city;} public void setCity(String v){city=v;} public String getLanguage(){return language;} public void setLanguage(String v){language=v;} public boolean isEmailVerified(){return emailVerified;} public void setEmailVerified(boolean v){emailVerified=v;} public boolean isOnboardingComplete(){return onboardingComplete;} public void setOnboardingComplete(boolean v){onboardingComplete=v;} public HealthProfile getHealthProfile(){return healthProfile;} public void setHealthProfile(HealthProfile v){healthProfile=v;}
}
