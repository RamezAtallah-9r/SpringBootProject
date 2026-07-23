package com.axsos.Life.models; import jakarta.persistence.*; import static com.axsos.Life.models.Enums.*;
@Entity @Table(name="food_mate_connections",uniqueConstraints=@UniqueConstraint(columnNames={"requester_id","receiver_id"})) public class FoodMateConnection extends BaseEntity {
 @Id @GeneratedValue(strategy=GenerationType.IDENTITY) private Long id; @ManyToOne(fetch=FetchType.LAZY) @JoinColumn(name="requester_id") private User requester; @ManyToOne(fetch=FetchType.LAZY) @JoinColumn(name="receiver_id") private User receiver; @Enumerated(EnumType.STRING) private ConnectionStatus status=ConnectionStatus.PENDING;
 public Long getId(){return id;} public void setId(Long v){id=v;} public User getRequester(){return requester;} public void setRequester(User v){requester=v;} public User getReceiver(){return receiver;} public void setReceiver(User v){receiver=v;} public ConnectionStatus getStatus(){return status;} public void setStatus(ConnectionStatus v){status=v;}
}
