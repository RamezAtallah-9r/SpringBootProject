package com.axsos.Life.services;

// Utility for estimating BMR (Basal Metabolic Rate) when no InBody
// scan is available, using the Mifflin-St Jeor equation.
public class TdeeCalculator {

    // weight in kg, height in cm, age in years
    public static int estimateBmr(double weight, double height, int age, String gender) {
        double bmr;
        if (gender != null && gender.equalsIgnoreCase("male")) {
            bmr = 10 * weight + 6.25 * height - 5 * age + 5;
        } else {
            bmr = 10 * weight + 6.25 * height - 5 * age - 161;
        }
        return (int) Math.round(bmr);
    }
}