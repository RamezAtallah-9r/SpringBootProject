package com.axsos.Life.models; import jakarta.persistence.*; import java.time.LocalDate; import static com.axsos.Life.models.Enums.*;
@Entity @Table(name="weight_logs",uniqueConstraints=@UniqueConstraint(columnNames={"user_id","log_date","source"})) public class WeightLog extends BaseEntity {
 @Id @GeneratedValue(strategy=GenerationType.IDENTITY) private Long id; @ManyToOne(fetch=FetchType.LAZY,optional=false) @JoinColumn(name="user_id") private User user; @Column(name="log_date") private LocalDate date; private Double weight; @Enumerated(EnumType.STRING) private WeightSource source;
 public Long getId(){return id;} public void setId(Long v){id=v;} public User getUser(){return user;} public void setUser(User v){user=v;} public LocalDate getDate(){return date;} public void setDate(LocalDate v){date=v;} public Double getWeight(){return weight;} public void setWeight(Double v){weight=v;} public WeightSource getSource(){return source;} public void setSource(WeightSource v){source=v;}
}
