package com.axsos.Life.models; import jakarta.persistence.*; import static com.axsos.Life.models.Enums.*;
@Entity @Table(name="health_tags",uniqueConstraints=@UniqueConstraint(columnNames={"user_id","type","normalized_name"})) public class HealthTag extends BaseEntity {
 @Id @GeneratedValue(strategy=GenerationType.IDENTITY) private Long id; @ManyToOne(fetch=FetchType.LAZY,optional=false) @JoinColumn(name="user_id") private User user;
 @Enumerated(EnumType.STRING) private HealthTagType type; @Column(nullable=false,length=100) private String name; @Column(name="normalized_name",nullable=false,length=100) private String normalizedName;
 public Long getId(){return id;} public void setId(Long v){id=v;} public User getUser(){return user;} public void setUser(User v){user=v;} public HealthTagType getType(){return type;} public void setType(HealthTagType v){type=v;} public String getName(){return name;} public void setName(String v){name=v;} public String getNormalizedName(){return normalizedName;} public void setNormalizedName(String v){normalizedName=v;}
}
