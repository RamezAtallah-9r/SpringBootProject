package com.axsos.Life.services;

import org.springframework.stereotype.Service;

import com.axsos.Life.models.MealCircleMember;
import com.axsos.Life.repositories.MealCircleMemberRepository;

import java.util.List;

@Service
public class MealCircleMemberService {

    private final MealCircleMemberRepository memberRepository;

    public MealCircleMemberService(MealCircleMemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    public MealCircleMember add(MealCircleMember member) {
        return memberRepository.save(member);
    }

    public MealCircleMember get(Long id) {
        return memberRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("No member row found with id " + id));
    }

    public List<MealCircleMember> getAll() {
        return memberRepository.findAll();
    }

    public List<MealCircleMember> getMembersForSession(Long sessionId) {
        return memberRepository.findBySessionId(sessionId);
    }

    public MealCircleMember update(MealCircleMember member) {
        return memberRepository.save(member);
    }

    public void delete(Long id) {
        memberRepository.deleteById(id);
    }
}