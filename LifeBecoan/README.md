# VitaPath

VitaPath is a Spring Boot MVC/JSP wellness platform with session authentication, health onboarding, daily AI roadmaps, InBody history, Chart.js graphs, Food Mate requests, and temporary MealCircle sessions.

## Requirements
- Java 17
- Maven 3.9+
- MySQL 8
- Optional Gemini API key

## Run
1. Set environment variables: `DB_USERNAME`, `DB_PASSWORD`, and `GEMINI_API_KEY`.
2. The database `LifeBeaconDB` is created automatically when the MySQL user has permission.
3. Run `mvn clean test`, then `mvn spring-boot:run`.
4. Open `http://localhost:8080`.

The app starts without a Gemini key. AI actions then use a friendly fallback plan or show an unavailable message. Never commit a real API key.

## Main routes
`/`, `/auth`, `/onboarding`, `/dashboard`, `/inbody`, `/mealcircle`, `/profile`.

## Architecture
`models`, `repositories`, `dto`, `services`, `services/ai`, `controllers`, `config`, `util`.

## Safety
VitaPath is a wellness tool, not medical advice. AI responses are range-validated, and declared allergens cause generated plans to be rejected and replaced with a deterministic fallback.


## Gemini API setup

Use one of these two methods, then completely restart Spring Tool Suite:

### Method 1: application.properties

Open `src/main/resources/application.properties` and temporarily set:

```properties
gemini.api.key=YOUR_REAL_GEMINI_API_KEY
gemini.model=gemini-2.5-flash
```

Do not commit a real key to GitHub. Before pushing, restore:

```properties
gemini.api.key=${GEMINI_API_KEY:${GOOGLE_API_KEY:}}
```

### Method 2: STS environment variable

Open **Run Configurations → Environment**, add:

```text
GEMINI_API_KEY=YOUR_REAL_GEMINI_API_KEY
```

Apply the change and restart the application. The console should show:

```text
Gemini API is configured with model gemini-2.5-flash.
```

The Gemini request now sends the key in the required `x-goog-api-key` HTTP header. If Google rejects a request, the exact safe API error is printed in the STS console without printing the key.
