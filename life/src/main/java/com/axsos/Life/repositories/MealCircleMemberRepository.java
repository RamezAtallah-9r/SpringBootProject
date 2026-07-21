package com.axsos.Life.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.axsos.Life.models.MealCircleMember;

import java.util.List;

public interface MealCircleMemberRepository extends JpaRepository<MealCircleMember, Long> {

    // Every member row for one session - used to build the group
    // context sent to the AI, and to display the "who's in this
    // circle" list.
    List<MealCircleMember> findBySessionId(Long sessionId);

    // Every session a given user belongs to (as a member, not creator)
    List<MealCircleMember> findByUserId(Long userId);
}
