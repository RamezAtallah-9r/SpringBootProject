# LifeBeacon

**LifeBeacon** is a team graduation project that presents an AI-powered personal nutrition and wellness platform. The system is designed to generate a personalized daily roadmap for meals, hydration, activity, and healthy habits based on the user's profile, lifestyle, health information, progress, and optional InBody data.

> This repository represents a collaborative **team project**. The application features, backend architecture, database, AI integration, and frontend pages are developed and maintained by the project team.

---

## Project Overview

Many wellness applications require users to manually log every meal and repeatedly interpret their own numbers. LifeBeacon follows a different approach: it prepares a structured daily roadmap that helps the user understand what to eat, when to drink water, when to exercise, and how to stay aligned with personal goals.

The project is intended as a wellness support platform and does not replace professional medical diagnosis or treatment.

---

## Main Features

- AI-generated daily wellness roadmap
- Timed meal recommendations
- Hydration schedule
- Workout and movement schedule
- Calories and macronutrient progress
- Weight trend tracking
- Optional InBody report support
- Health onboarding wizard
- Health-aware recommendations
- Deterministic allergy filtering
- MealCircle group meal planning
- Local food and restaurant intelligence
- Arabic and English interface support
- Email verification and password recovery
- WhatsApp roadmap reminders
- Responsive dashboard and landing page

---

## Frontend Pages Included in This Contribution

### Landing Page

The landing page introduces the LifeBeacon platform and includes:

- Navigation bar
- Hero section
- Product overview
- Main features
- How LifeBeacon works
- MealCircle section
- Wellness safety notice
- Contact Us section
- Call-to-action section
- Footer

The Contact Us area is currently a frontend-only information section without a form or backend submission.

### Dashboard

The dashboard frontend includes:

- Daily greeting and progress status
- Calories progress
- Hydration progress
- Macronutrients progress
- Today's roadmap timeline
- Completed and upcoming roadmap items
- Weight trend card
- Body composition card
- AI insight card
- Responsive layout

The displayed dashboard values are currently static frontend placeholders. The backend team can later replace them with JSP Expression Language values received from Spring MVC controllers.

---

## Technology Stack

### Backend

- Java
- Spring Boot
- Spring MVC
- Spring Security
- Spring Data JPA
- Hibernate

### Database

- MySQL

### Frontend

- JSP
- HTML5
- Tailwind CSS via CDN
- Vanilla JavaScript
- Lucide Icons

### Planned Integrations

- Gemini AI
- SendGrid
- WhatsApp Business API

---
---

## JSP View Configuration

Add the following configuration to `src/main/resources/application.properties`:

```properties
spring.mvc.view.prefix=/WEB-INF/
spring.mvc.view.suffix=.jsp
```

A Spring MVC controller can render the landing page and dashboard using:

```java
@Controller
public class MainController {

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/dashboard")
    public String dashboard() {
        return "dashboard";
    }
}
```

---

## Running the Project

1. Clone the repository.
2. Open the project in Eclipse STS.
3. Configure the MySQL connection in `application.properties`.
4. Update the Maven project.
5. Run the project as a Spring Boot application.
6. Open the following routes:

```text
http://localhost:8080/
http://localhost:8080/dashboard
```

---

## Example MySQL Configuration

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/lifebeacon_db?createDatabaseIfNotExist=true&useSSL=false&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=YOUR_PASSWORD

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true
```

Do not commit real database passwords, API keys, or private credentials to GitHub.

---

## Future Backend Integration

The static dashboard values can later be replaced with JSP values such as:

```jsp
${currentUser.name}
${roadmap.targetCalories}
${roadmap.consumedCalories}
${roadmap.waterTargetLiters}
${latestInBody.weightKg}
```

Roadmap items can be displayed dynamically using JSTL:

```jsp
<c:forEach var="item" items="${roadmapItems}">
    <!-- roadmap item design -->
</c:forEach>
```

---

## Team Collaboration

LifeBeacon is developed as a collaborative graduation project. Different team members contribute to areas such as:

- Frontend design
- Spring MVC controllers
- Authentication and security
- Database models and relationships
- AI roadmap generation
- InBody processing
- MealCircle
- Email and WhatsApp integration
- Testing and documentation

All project achievements should be presented as the work of the complete team.

---

## Safety Notice

LifeBeacon provides wellness and lifestyle guidance only. It is not a medical device and must not be used as a replacement for professional medical advice, diagnosis, emergency care, or treatment.

---

## License

This project was created for educational and graduation-project purposes.
