package com.axsos.Life.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.axsos.Life.models.RestaurantMeal;

import java.util.List;

public interface RestaurantMealRepository extends JpaRepository<RestaurantMeal, Long> {

    // The core "Local Food Intelligence" query - only active meals,
    // filtered to the user's own city.
    List<RestaurantMeal> findByCityAndActiveTrue(String city);
}
