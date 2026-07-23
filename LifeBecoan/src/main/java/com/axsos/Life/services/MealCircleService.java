package com.axsos.Life.services;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.axsos.Life.models.Enums.ConnectionStatus;
import com.axsos.Life.models.Enums.HealthTagType;
import com.axsos.Life.models.Enums.MealCircleStatus;
import com.axsos.Life.models.FoodMateConnection;
import com.axsos.Life.models.HealthProfile;
import com.axsos.Life.models.HealthTag;
import com.axsos.Life.models.MealCircleForm;
import com.axsos.Life.models.MealCircleMember;
import com.axsos.Life.models.MealCircleSession;
import com.axsos.Life.models.User;
import com.axsos.Life.repositories.FoodMateConnectionRepository;
import com.axsos.Life.repositories.HealthProfileRepository;
import com.axsos.Life.repositories.HealthTagRepository;
import com.axsos.Life.repositories.MealCircleMemberRepository;
import com.axsos.Life.repositories.MealCircleSessionRepository;
import com.axsos.Life.repositories.UserRepository;

@Service
public class MealCircleService {

    private final UserRepository userRepository;
    private final FoodMateConnectionRepository connectionRepository;
    private final MealCircleSessionRepository sessionRepository;
    private final MealCircleMemberRepository memberRepository;
    private final HealthProfileRepository healthProfileRepository;
    private final HealthTagRepository healthTagRepository;
    private final GeminiService geminiService;
    private final ZoneId applicationZone;

    public MealCircleService(UserRepository userRepository,
            FoodMateConnectionRepository connectionRepository,
            MealCircleSessionRepository sessionRepository,
            MealCircleMemberRepository memberRepository,
            HealthProfileRepository healthProfileRepository,
            HealthTagRepository healthTagRepository,
            GeminiService geminiService,
            @Value("${app.timezone:Asia/Hebron}") String timezone) {
        this.userRepository = userRepository;
        this.connectionRepository = connectionRepository;
        this.sessionRepository = sessionRepository;
        this.memberRepository = memberRepository;
        this.healthProfileRepository = healthProfileRepository;
        this.healthTagRepository = healthTagRepository;
        this.geminiService = geminiService;
        this.applicationZone = ZoneId.of(timezone);
    }

    // Search for possible Food Mates
    public List<User> search(User currentUser, String emailSearch) {
        if (emailSearch == null || emailSearch.isBlank()) return List.of();
        return userRepository.findTop10ByEmailContainingIgnoreCaseAndIdNot(
                emailSearch.trim(), currentUser.getId());
    }

    // Send a Food Mate request
    @Transactional
    public void request(User currentUser, Long receiverId) {
        if (currentUser.getId().equals(receiverId)) {
            throw new IllegalArgumentException("You cannot add yourself.");
        }
        User receiver = userRepository.findById(receiverId)
                .orElseThrow(() -> new IllegalArgumentException("User not found."));
        if (connectionRepository.findByRequesterIdAndReceiverIdOrRequesterIdAndReceiverId(
                currentUser.getId(), receiverId, receiverId, currentUser.getId()).isPresent()) {
            throw new IllegalArgumentException("A request or connection already exists.");
        }
        FoodMateConnection connection = new FoodMateConnection();
        connection.setRequester(currentUser);
        connection.setReceiver(receiver);
        connectionRepository.save(connection);
    }

    public List<FoodMateConnection> incoming(Long userId) {
        return connectionRepository.findAllByReceiverIdAndStatus(userId, ConnectionStatus.PENDING);
    }

    public List<User> accepted(User currentUser) {
        return connectionRepository.findAllByStatusAndRequesterIdOrStatusAndReceiverId(
                ConnectionStatus.ACCEPTED, currentUser.getId(),
                ConnectionStatus.ACCEPTED, currentUser.getId())
                .stream()
                .map(connection -> connection.getRequester().getId().equals(currentUser.getId())
                        ? connection.getReceiver() : connection.getRequester())
                .distinct()
                .toList();
    }

    // Accept or decline a request owned by the current user
    @Transactional
    public void respond(User currentUser, Long requestId, boolean accept) {
        FoodMateConnection connection = connectionRepository.findById(requestId)
                .orElseThrow(() -> new IllegalArgumentException("Request not found."));
        if (!connection.getReceiver().getId().equals(currentUser.getId())) {
            throw new IllegalArgumentException("You cannot access this request.");
        }
        connection.setStatus(accept ? ConnectionStatus.ACCEPTED : ConnectionStatus.DECLINED);
        connectionRepository.save(connection);
    }

    // Save the group and its AI result together to avoid partial sessions
    @Transactional
    public MealCircleSession create(User currentUser, MealCircleForm form) {
        List<Long> selectedIds = form.getMemberIds() == null ? List.of() : form.getMemberIds();
        Set<Long> allowedIds = accepted(currentUser).stream().map(User::getId).collect(Collectors.toSet());
        if (selectedIds.size() > 7 || !allowedIds.containsAll(selectedIds)) {
            throw new IllegalArgumentException(
                    "Only accepted Food Mates may be added; maximum 8 people total.");
        }

        List<User> groupMembers = new ArrayList<>();
        groupMembers.add(currentUser);
        for (Long memberId : selectedIds) {
            groupMembers.add(userRepository.findById(memberId)
                    .orElseThrow(() -> new IllegalArgumentException("A selected user was not found.")));
        }

        MealCircleSession mealCircleSession = new MealCircleSession();
        mealCircleSession.setCreator(currentUser);
        mealCircleSession.setCuisineCategory(form.getCuisineCategory());
        mealCircleSession.setCity(form.getCity());
        mealCircleSession.setExpiresAt(LocalDate.now(applicationZone).atTime(LocalTime.MAX));
        sessionRepository.save(mealCircleSession);

        for (User user : groupMembers) {
            MealCircleMember member = new MealCircleMember();
            member.setSession(mealCircleSession);
            member.setUser(user);
            memberRepository.save(member);
            mealCircleSession.getMembers().add(member);
        }

        try {
            MealCircleAiResponse response = geminiService.json(
                    createPrompt(form, groupMembers), MealCircleAiResponse.class);
            validateResponse(response, form.getCuisineCategory(), groupMembers);
            applyResponse(mealCircleSession, response);
            mealCircleSession.setStatus(MealCircleStatus.GENERATED);
            mealCircleSession.setGeneratedAt(LocalDateTime.now(applicationZone));
        } catch (Exception exception) {
            mealCircleSession.setStatus(MealCircleStatus.FAILED);
        }
        return sessionRepository.save(mealCircleSession);
    }

    // Show the result only to a member before it expires
    public MealCircleSession view(User currentUser, Long sessionId) {
        MealCircleSession mealCircleSession = sessionRepository.findById(sessionId)
                .orElseThrow(() -> new IllegalArgumentException("MealCircle was not found."));
        boolean isMember = mealCircleSession.getMembers().stream()
                .anyMatch(member -> member.getUser().getId().equals(currentUser.getId()));
        if (!isMember || mealCircleSession.getExpiresAt().isBefore(LocalDateTime.now(applicationZone))) {
            throw new IllegalArgumentException("This MealCircle is unavailable or expired.");
        }
        return mealCircleSession;
    }

    private String createPrompt(MealCircleForm form, List<User> users) {
        String memberContext = users.stream().map(user -> {
            HealthProfile profile = healthProfileRepository.findByUserId(user.getId()).orElse(null);
            List<String> allergies = healthTagRepository
                    .findAllByUserIdAndType(user.getId(), HealthTagType.ALLERGY)
                    .stream().map(HealthTag::getName).toList();
            return "userId=" + user.getId() + ", name=" + user.getName()
                    + ", goal=" + (profile == null ? "not provided" : profile.getPrimaryGoal())
                    + ", allergies=" + allergies;
        }).collect(Collectors.joining(" | "));

        return "Return JSON only. Cuisine must be " + form.getCuisineCategory() + ". "
                + "Create one shared meal and a different safe meal for each person when goals differ. "
                + "Never include a declared allergy. No markdown or long paragraphs. Structure: "
                + "{cuisine:string,sharedMeal:{mealName:string(max 60),estimatedCalories:int,"
                + "shortReason:string(max 120, one sentence)},memberMeals:[{userId:long,"
                + "mealName:string(max 60),estimatedCalories:int,shortReason:string(max 100, one sentence)}]}. "
                + "Members: " + memberContext;
    }

    private void validateResponse(MealCircleAiResponse response, String cuisine, List<User> users) {
        if (response == null || response.sharedMeal == null || response.memberMeals == null
                || response.memberMeals.size() != users.size()) {
            throw new IllegalArgumentException("Incomplete AI result.");
        }
        if (response.cuisine == null || !response.cuisine.equalsIgnoreCase(cuisine)) {
            throw new IllegalArgumentException("The selected cuisine was not respected.");
        }
        Set<Long> expectedIds = users.stream().map(User::getId).collect(Collectors.toSet());
        Set<Long> returnedIds = response.memberMeals.stream()
                .map(meal -> meal.userId).collect(Collectors.toSet());
        if (!expectedIds.equals(returnedIds)) {
            throw new IllegalArgumentException("Member meals are incomplete.");
        }
        checkLength(response.sharedMeal.mealName, 60);
        checkLength(response.sharedMeal.shortReason, 120);
        for (MemberMeal meal : response.memberMeals) {
            checkLength(meal.mealName, 60);
            checkLength(meal.shortReason, 100);
            List<String> allergies = healthTagRepository
                    .findAllByUserIdAndType(meal.userId, HealthTagType.ALLERGY)
                    .stream().map(tag -> tag.getName().toLowerCase()).toList();
            String mealText = (meal.mealName + " " + meal.shortReason).toLowerCase();
            if (allergies.stream().anyMatch(mealText::contains)) {
                throw new IllegalArgumentException("An unsafe meal was returned.");
            }
        }
    }

    private void applyResponse(MealCircleSession session, MealCircleAiResponse response) {
        session.setSharedMealTitle(clean(response.sharedMeal.mealName, 60));
        session.setSharedMealCalories(response.sharedMeal.estimatedCalories);
        session.setSharedMealDescription(clean(response.sharedMeal.shortReason, 120));
        session.setAiExplanation(null);

        for (MealCircleMember member : session.getMembers()) {
            MemberMeal meal = response.memberMeals.stream()
                    .filter(value -> value.userId.equals(member.getUser().getId()))
                    .findFirst().orElseThrow();
            member.setPersonalizedMealTitle(clean(meal.mealName, 60));
            member.setKcal(meal.estimatedCalories);
            member.setPersonalizedMealDescription(clean(meal.shortReason, 100));
            member.setAiExplanation(null);
        }
    }

    private void checkLength(String value, int maximum) {
        if (value == null || value.isBlank() || value.length() > maximum
                || value.contains("*") || value.contains("#")) {
            throw new IllegalArgumentException("The AI response was not short and clean.");
        }
    }

    private String clean(String value, int maximum) {
        String cleanValue = value.replaceAll("[\\r\\n*#]+", " ").replaceAll("\\s+", " ").trim();
        return cleanValue.length() <= maximum ? cleanValue : cleanValue.substring(0, maximum).trim();
    }

    public static class MealCircleAiResponse {
        public String cuisine;
        public SharedMeal sharedMeal;
        public List<MemberMeal> memberMeals = new ArrayList<>();
    }

    public static class SharedMeal {
        public String mealName;
        public Integer estimatedCalories;
        public String shortReason;
    }

    public static class MemberMeal {
        public Long userId;
        public String mealName;
        public Integer estimatedCalories;
        public String shortReason;
    }
}
