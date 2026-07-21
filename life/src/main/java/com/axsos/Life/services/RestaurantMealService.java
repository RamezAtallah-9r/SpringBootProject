package com.axsos.Life.services;

import org.springframework.stereotype.Service;

import com.axsos.Life.models.RestaurantMeal;
import com.axsos.Life.repositories.RestaurantMealRepository;

import java.util.List;

@Service
public class RestaurantMealService {

    private final RestaurantMealRepository restaurantMealRepository;

    public RestaurantMealService(RestaurantMealRepository restaurantMealRepository) {
        this.restaurantMealRepository = restaurantMealRepository;
    }

    public RestaurantMeal add(RestaurantMeal meal) {
        return restaurantMealRepository.save(meal);
    }

    public RestaurantMeal get(Long id) {
        return restaurantMealRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("No restaurant meal found with id " + id));
    }

    public List<RestaurantMeal> getAll() {
        return restaurantMealRepository.findAll();
    }

    // The main method other services will call - see MealCircle
    // and "what to eat now" logic.
    public List<RestaurantMeal> getActiveMealsInCity(String city) {
        return restaurantMealRepository.findByCityAndActiveTrue(city);
    }

    public RestaurantMeal update(RestaurantMeal meal) {
        return restaurantMealRepository.save(meal);
    }

    public void delete(Long id) {
        restaurantMealRepository.deleteById(id);
    }
}
