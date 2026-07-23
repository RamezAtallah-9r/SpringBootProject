package com.axsos.Life.models;

public final class Enums {
	private Enums() {
	}

	public enum Gender {
		MALE, FEMALE
	}

	public enum ActivityLevel {
		SEDENTARY, LIGHTLY_ACTIVE, ACTIVE, VERY_ACTIVE
	}

	public enum PrimaryGoal {
		LOSE_WEIGHT, MAINTAIN_WEIGHT, GAIN_MUSCLE, IMPROVE_WELLNESS
	}

	public enum HealthTagType {
		ALLERGY, CONDITION, MEDICATION
	}

	public enum RoadmapCategory {
		MEAL, WATER, WORKOUT, SLEEP, OTHER
	}

	public enum RoadmapItemStatus {
		PENDING, DONE, SKIPPED, CHANGED
	}

	public enum AiStatus {
		GENERATED, FALLBACK, FAILED
	}

	public enum ConnectionStatus {
		PENDING, ACCEPTED, DECLINED
	}

	public enum InBodySource {
		MANUAL, AI_FILE_EXTRACTION
	}

	public enum WeightSource {
		ONBOARDING, INBODY, MANUAL
	}

	public enum MealCircleStatus {
		DRAFT, GENERATED, FAILED, EXPIRED
	}
}
