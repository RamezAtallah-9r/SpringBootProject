package com.axsos.Life.services;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import tools.jackson.databind.ObjectMapper;

import java.util.Base64;
import java.util.List;
import java.util.Map;

// ============================================================
// GeminiClient - THE ONLY CLASS IN THIS PROJECT THAT TALKS
// DIRECTLY TO THE GEMINI API.
//
// Every other AI call site (onboarding roadmap, InBody parsing,
// MealCircle recommendations) calls a method on THIS class instead
// of building its own HTTP request. That way, if you ever need to
// change how the request is built, or switch providers, you change
// it in exactly one place.
//
// If you've never called an external API before, here's the mental
// model: you're sending an HTTP POST request (same kind of request
// your browser sends when you submit a form) to a URL owned by
// Google, with a JSON "body" describing what you want. Google's
// server processes it and sends back a JSON response. RestTemplate
// is just Java's way of doing that "send a request, wait for a
// response" round trip.
// ============================================================
@Service
public class GeminiClient {

    // @Value reads this straight from application.properties -
    // Spring fills in this field automatically when the app starts.
    @Value("${gemini.api.key}")
    private String apiKey;

    @Value("${gemini.model}")
    private String model;

    // A plain instance, created directly - no @Bean/@Configuration
    // class needed. This object is reusable and thread-safe, so one
    // instance per GeminiClient is fine.
    private final RestTemplate restTemplate = new RestTemplate();

    private final ObjectMapper objectMapper = new ObjectMapper();

    private String buildUrl() {
        return "https://generativelanguage.googleapis.com/v1beta/models/"
                + model + ":generateContent?key=" + apiKey;
    }

    // ---------------------------------------------------------
    // SEND: text-only prompt (used by the Roadmap engine and
    // MealCircle - no file attached, just instructions + data).
    // RECEIVE: Gemini's raw text answer.
    // ---------------------------------------------------------
    public String sendTextPrompt(String prompt) {
        Map<String, Object> textPart = Map.of("text", prompt);
        Map<String, Object> content = Map.of("parts", List.of(textPart));
        Map<String, Object> requestBody = Map.of("contents", List.of(content));

        return callGemini(requestBody);
    }

    // ---------------------------------------------------------
    // SEND: prompt + a file (used by InBody parsing - the scan
    // report itself gets attached, base64-encoded, alongside the
    // instructions).
    // RECEIVE: Gemini's raw text answer.
    // ---------------------------------------------------------
    public String sendPromptWithFile(String prompt, byte[] fileBytes, String mimeType) {
        String base64File = Base64.getEncoder().encodeToString(fileBytes);

        Map<String, Object> inlineData = Map.of("mimeType", mimeType, "data", base64File);
        Map<String, Object> filePart = Map.of("inlineData", inlineData);
        Map<String, Object> textPart = Map.of("text", prompt);

        Map<String, Object> content = Map.of("parts", List.of(textPart, filePart));
        Map<String, Object> requestBody = Map.of("contents", List.of(content));

        return callGemini(requestBody);
    }

    // Convenience method: send a text prompt AND parse the answer
    // as JSON in one call. This is what all three call sites
    // actually use, since we always ask Gemini to answer in JSON.
    public Map<String, Object> promptForJson(String prompt) {
        String rawText = sendTextPrompt(prompt);
        return parseJson(rawText);
    }

    public Map<String, Object> promptWithFileForJson(String prompt, byte[] fileBytes, String mimeType) {
        String rawText = sendPromptWithFile(prompt, fileBytes, mimeType);
        return parseJson(rawText);
    }

    // ---------------------------------------------------------
    // The actual HTTP call. Every method above ends up here.
    // ---------------------------------------------------------
    @SuppressWarnings("unchecked")
    private String callGemini(Map<String, Object> requestBody) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestBody, headers);

        Map<String, Object> response;
        try {
            response = restTemplate.postForObject(buildUrl(), request, Map.class);
        } catch (Exception e) {
            // Covers: wrong API key, no internet, Gemini is down,
            // rate limit hit. Every AI call site wraps ITS call to
            // this method in a try/catch too, and falls back to a
            // safe default - see RoadmapEngineService for an example.
            throw new RuntimeException("Could not reach Gemini: " + e.getMessage(), e);
        }

        if (response == null || !response.containsKey("candidates")) {
            throw new RuntimeException("Gemini returned an unexpected response: " + response);
        }

        // Gemini's response shape is always:
        // { "candidates": [ { "content": { "parts": [ { "text": "..." } ] } } ] }
        // We dig through that fixed structure to get the actual text.
        List<Map<String, Object>> candidates = (List<Map<String, Object>>) response.get("candidates");
        Map<String, Object> firstCandidate = candidates.get(0);
        Map<String, Object> content = (Map<String, Object>) firstCandidate.get("content");
        List<Map<String, Object>> parts = (List<Map<String, Object>>) content.get("parts");
        return (String) parts.get(0).get("text");
    }

    // Gemini sometimes wraps JSON in markdown code fences (a "json"
    // language tag followed by the JSON, then a closing fence) even
    // when told not to. This strips that defensively before parsing,
    // so a formatting quirk doesn't crash the whole request.
    public Map<String, Object> parseJson(String rawText) {
        String cleaned = rawText.trim();
        if (cleaned.startsWith("`".repeat(3))) {
            cleaned = cleaned.replaceAll("^`{3}[a-zA-Z]*\\s*", "");
            cleaned = cleaned.replaceAll("`{3}\\s*$", "");
        }
        try {
            return objectMapper.readValue(cleaned, Map.class);
        } catch (Exception e) {
            throw new RuntimeException("Gemini's response wasn't valid JSON: " + rawText, e);
        }
    }
}