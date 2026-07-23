package com.axsos.Life.services;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class GeminiService {

    private static final Logger logger = LoggerFactory.getLogger(GeminiService.class);
    private static final String GEMINI_URL =
            "https://generativelanguage.googleapis.com/v1beta/models/%s:generateContent";

    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper;
    private final String apiKey;
    private final String modelName;
    private final int retryCount;

    public GeminiService(
            ObjectMapper objectMapper,
            @Value("${gemini.api.key:}") String apiKey,
            @Value("${gemini.model:gemini-2.5-flash}") String modelName,
            @Value("${gemini.connect-timeout-ms:10000}") int connectTimeout,
            @Value("${gemini.read-timeout-ms:90000}") int readTimeout,
            @Value("${gemini.retry-count:1}") int retryCount) {

        this.objectMapper = objectMapper;
        this.apiKey = apiKey == null ? "" : apiKey.trim();
        this.modelName = modelName == null || modelName.isBlank()
                ? "gemini-2.5-flash"
                : modelName.trim();
        this.retryCount = Math.max(0, Math.min(2, retryCount));

        SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();
        requestFactory.setConnectTimeout(connectTimeout);
        requestFactory.setReadTimeout(readTimeout);
        this.restTemplate = new RestTemplate(requestFactory);

        if (this.apiKey.isBlank()) {
            logger.warn("Gemini API key is not configured. Set GEMINI_API_KEY or gemini.api.key.");
        } else {
            logger.info("Gemini API is configured with model {}.", this.modelName);
        }
    }

    public boolean isAvailable() {
        return !apiKey.isBlank();
    }

    public <T> T json(String prompt, Class<T> responseType) {
        return sendRequest(prompt, null, null, responseType);
    }

    public <T> T jsonWithFile(
            String prompt,
            byte[] fileBytes,
            String mimeType,
            Class<T> responseType) {

        return sendRequest(prompt, fileBytes, mimeType, responseType);
    }

    private <T> T sendRequest(
            String prompt,
            byte[] fileBytes,
            String mimeType,
            Class<T> responseType) {

        if (!isAvailable()) {
            throw new IllegalStateException(
                    "Gemini API key is missing. Set GEMINI_API_KEY or gemini.api.key and restart the project.");
        }

        Exception lastException = null;

        for (int attempt = 0; attempt <= retryCount; attempt++) {
            try {
                return sendOnce(prompt, fileBytes, mimeType, responseType);
            } catch (Exception exception) {
                lastException = exception;
                logger.warn("Gemini request attempt {} failed: {}", attempt + 1, exception.getMessage());

                if (attempt < retryCount) {
                    try {
                        Thread.sleep(700);
                    } catch (InterruptedException interruptedException) {
                        Thread.currentThread().interrupt();
                        break;
                    }
                }
            }
        }

        throw new IllegalStateException(
                "Gemini request failed. Check the console for the exact API error.", lastException);
    }

    @SuppressWarnings("unchecked")
    private <T> T sendOnce(
            String prompt,
            byte[] fileBytes,
            String mimeType,
            Class<T> responseType) throws Exception {

        List<Map<String, Object>> parts = new ArrayList<>();
        parts.add(Map.of("text", prompt));

        if (fileBytes != null) {
            String encodedFile = Base64.getEncoder().encodeToString(fileBytes);
            parts.add(Map.of(
                    "inlineData", Map.of(
                            "mimeType", mimeType,
                            "data", encodedFile)));
        }

        Map<String, Object> requestBody = new HashMap<>();
        requestBody.put("contents", List.of(Map.of("parts", parts)));
        requestBody.put("generationConfig", Map.of(
                "responseMimeType", "application/json",
                "temperature", 0.2));

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // The current Gemini REST API expects the API key in this header.
        headers.set("x-goog-api-key", apiKey);

        String requestUrl = String.format(GEMINI_URL, modelName);
        HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);

        ResponseEntity<String> response;
        try {
            response = restTemplate.postForEntity(requestUrl, requestEntity, String.class);
        } catch (HttpStatusCodeException exception) {
            String responseBody = exception.getResponseBodyAsString(StandardCharsets.UTF_8);
            String safeMessage = readGoogleErrorMessage(responseBody);
            throw new IllegalStateException(
                    "Gemini API returned " + exception.getStatusCode().value() + ": " + safeMessage,
                    exception);
        }

        if (!response.getStatusCode().is2xxSuccessful() || response.getBody() == null) {
            throw new IllegalStateException("Gemini returned an empty response.");
        }

        Map<String, Object> responseMap = objectMapper.readValue(response.getBody(), Map.class);
        List<Map<String, Object>> candidates =
                (List<Map<String, Object>>) responseMap.get("candidates");

        if (candidates == null || candidates.isEmpty()) {
            throw new IllegalStateException(readBlockedReason(responseMap));
        }

        Map<String, Object> content =
                (Map<String, Object>) candidates.get(0).get("content");
        List<Map<String, Object>> responseParts = content == null
                ? null
                : (List<Map<String, Object>>) content.get("parts");

        if (responseParts == null || responseParts.isEmpty()
                || responseParts.get(0).get("text") == null) {
            throw new IllegalStateException("Gemini response did not contain JSON text.");
        }

        String jsonText = cleanJson(String.valueOf(responseParts.get(0).get("text")));
        return objectMapper.readValue(jsonText, responseType);
    }

    @SuppressWarnings("unchecked")
    private String readGoogleErrorMessage(String responseBody) {
        try {
            Map<String, Object> errorResponse = objectMapper.readValue(responseBody, Map.class);
            Map<String, Object> error = (Map<String, Object>) errorResponse.get("error");
            if (error != null && error.get("message") != null) {
                return String.valueOf(error.get("message"));
            }
        } catch (Exception ignored) {
            // Use a simple fallback when Google returns a non-JSON error page.
        }
        return "Request was rejected by Gemini.";
    }

    @SuppressWarnings("unchecked")
    private String readBlockedReason(Map<String, Object> responseMap) {
        Map<String, Object> feedback =
                (Map<String, Object>) responseMap.get("promptFeedback");
        if (feedback != null && feedback.get("blockReason") != null) {
            return "Gemini blocked the request: " + feedback.get("blockReason");
        }
        return "Gemini returned no result.";
    }

    private String cleanJson(String text) {
        String cleanedText = text == null ? "" : text.trim();
        cleanedText = cleanedText.replaceFirst("(?s)^```(?:json)?\\s*", "");
        cleanedText = cleanedText.replaceFirst("(?s)\\s*```$", "");

        int firstBrace = cleanedText.indexOf('{');
        int lastBrace = cleanedText.lastIndexOf('}');
        if (firstBrace >= 0 && lastBrace > firstBrace) {
            return cleanedText.substring(firstBrace, lastBrace + 1);
        }
        return cleanedText;
    }
}
