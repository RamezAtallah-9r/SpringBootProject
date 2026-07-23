package com.axsos.Life.models;
import jakarta.persistence.*; import java.time.LocalDateTime;
@MappedSuperclass public abstract class BaseEntity {
 @Column(nullable=false,updatable=false) private LocalDateTime createdAt;
 @Column(nullable=false) private LocalDateTime updatedAt;
 @PrePersist void prePersist(){ createdAt=updatedAt=LocalDateTime.now(); }
 @PreUpdate void preUpdate(){ updatedAt=LocalDateTime.now(); }
 public LocalDateTime getCreatedAt(){return createdAt;} public LocalDateTime getUpdatedAt(){return updatedAt;}
}
