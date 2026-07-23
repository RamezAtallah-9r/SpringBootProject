package com.axsos.Life.services; import com.axsos.Life.models.HealthProfileForm; import com.axsos.Life.models.*; import com.axsos.Life.repositories.*; import org.springframework.stereotype.Service; import org.springframework.transaction.annotation.Transactional; import java.time.*; import java.util.*; import static com.axsos.Life.models.Enums.*;
@Service public class HealthProfileService { private final HealthProfileRepository profiles; private final HealthTagRepository tags; private final WeightLogRepository weights; private final UserRepository users; public HealthProfileService(HealthProfileRepository p,HealthTagRepository t,WeightLogRepository w,UserRepository u){profiles=p;tags=t;weights=w;users=u;}
 public Optional<HealthProfile> find(Long id){return profiles.findByUserId(id);} public List<HealthTag> tags(Long id){return tags.findAllByUserId(id);}
 public void validateTimes(HealthProfileForm form, org.springframework.validation.BindingResult bindingResult) {
     if (form.getWorkStartTime() != null && form.getWorkEndTime() != null) {
         long workMinutes = Duration.between(form.getWorkStartTime(), form.getWorkEndTime()).toMinutes();
         if (workMinutes <= 0) workMinutes += 24 * 60;
         if (workMinutes < 60 || workMinutes > 16 * 60) {
             bindingResult.rejectValue("workEndTime", "work.time", "Work duration must be between 1 and 16 hours.");
         }
     }
     if (form.getSleepTime() != null && form.getWakeTime() != null) {
         long sleepMinutes = Duration.between(form.getSleepTime(), form.getWakeTime()).toMinutes();
         if (sleepMinutes <= 0) sleepMinutes += 24 * 60;
         if (sleepMinutes < 4 * 60 || sleepMinutes > 14 * 60) {
             bindingResult.rejectValue("wakeTime", "sleep.time", "Sleep duration must be between 4 and 14 hours.");
         }
     }
 }
 @Transactional public HealthProfile save(User u,HealthProfileForm f){HealthProfile p=profiles.findByUserId(u.getId()).orElseGet(HealthProfile::new);p.setUser(u);p.setAge(f.getAge());p.setGender(f.getGender());p.setBloodType(f.getBloodType());p.setHeight(f.getHeight());p.setWeight(f.getWeight());p.setTargetWeight(f.getTargetWeight());p.setPrimaryGoal(f.getPrimaryGoal());p.setActivityLevel(f.getActivityLevel());p.setOccupation(f.getOccupation());p.setWorkStartTime(f.getWorkStartTime());p.setWorkEndTime(f.getWorkEndTime());p.setSleepTime(f.getSleepTime());p.setWakeTime(f.getWakeTime());p.setPregnant(f.isPregnant());p.setEatingDisorderHistory(f.isEatingDisorderHistory());p.setGateNotes(f.getGateNotes());profiles.save(p); sync(u,HealthTagType.ALLERGY,f.getAllergies());sync(u,HealthTagType.CONDITION,f.getConditions());sync(u,HealthTagType.MEDICATION,f.getMedications()); WeightLog wl=weights.findByUserIdAndDateAndSource(u.getId(),LocalDate.now(),WeightSource.ONBOARDING).orElseGet(WeightLog::new);wl.setUser(u);wl.setDate(LocalDate.now());wl.setWeight(f.getWeight());wl.setSource(WeightSource.ONBOARDING);weights.save(wl);u.setOnboardingComplete(true);users.save(u);return p;}
 private void sync(User user, HealthTagType type, String raw) {
     LinkedHashMap<String, String> desired = new LinkedHashMap<>();

     if (raw != null) {
         Arrays.stream(raw.split("[,;\n]"))
             .map(String::trim)
             .filter(value -> !value.isBlank())
             .filter(value -> !value.equalsIgnoreCase("none"))
             .filter(value -> !value.equalsIgnoreCase("n/a"))
             .filter(value -> !value.equalsIgnoreCase("no"))
             .forEach(value -> desired.putIfAbsent(
                 value.toLowerCase(Locale.ROOT), value));
     }

     List<HealthTag> existing = tags.findAllByUserIdAndType(user.getId(), type);

     existing.stream()
         .filter(tag -> !desired.containsKey(tag.getNormalizedName()))
         .forEach(tags::delete);

     Set<String> existingNames = existing.stream()
         .map(HealthTag::getNormalizedName)
         .filter(desired::containsKey)
         .collect(java.util.stream.Collectors.toSet());

     desired.forEach((normalized, displayName) -> {
         if (!existingNames.contains(normalized)) {
             HealthTag tag = new HealthTag();
             tag.setUser(user);
             tag.setType(type);
             tag.setName(displayName);
             tag.setNormalizedName(normalized);
             tags.save(tag);
         }
     });
 }
 public HealthProfileForm toForm(User u){HealthProfileForm f=new HealthProfileForm();find(u.getId()).ifPresent(p->{f.setAge(p.getAge());f.setGender(p.getGender());f.setBloodType(p.getBloodType());f.setHeight(p.getHeight());f.setWeight(p.getWeight());f.setTargetWeight(p.getTargetWeight());f.setPrimaryGoal(p.getPrimaryGoal());f.setActivityLevel(p.getActivityLevel());f.setOccupation(p.getOccupation());f.setWorkStartTime(p.getWorkStartTime());f.setWorkEndTime(p.getWorkEndTime());f.setSleepTime(p.getSleepTime());f.setWakeTime(p.getWakeTime());f.setPregnant(p.isPregnant());f.setEatingDisorderHistory(p.isEatingDisorderHistory());f.setGateNotes(p.getGateNotes());}); for(HealthTagType type:HealthTagType.values()){String s=tags(u.getId()).stream().filter(t->t.getType()==type).map(HealthTag::getName).reduce((a,b)->a+", "+b).orElse("");if(type==HealthTagType.ALLERGY)f.setAllergies(s);if(type==HealthTagType.CONDITION)f.setConditions(s);if(type==HealthTagType.MEDICATION)f.setMedications(s);}return f;}
}
