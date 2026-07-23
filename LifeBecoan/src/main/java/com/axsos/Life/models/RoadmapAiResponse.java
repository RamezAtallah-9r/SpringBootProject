package com.axsos.Life.models;

import java.util.*;

public class RoadmapAiResponse {
	public Integer targetCalories;
	public Integer targetWaterMl;
	public Double targetProtein;
	public Double targetCarbs;
	public Double targetFat;
	public String primaryGoalSummary;
	public String coachingSummary;
	public List<Item> items = new ArrayList<>();

	public static class Item {
		public String category, time, title, description, slot, activityType;
		public Integer calories, waterAmountMl, duration, displayOrder;
		public Double protein, carbs, fat;
	}
}
