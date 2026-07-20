package com.axsos.Life.models;

import jakarta.persistence.*;

@Entity
@Table(name = "restaurant_meals")
public class RestaurantMeal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 150)
    private String restaurant;

    @Column(nullable = false, length = 100)
    private String city;

    @Column(nullable = false, length = 100)
    private String country;

    @Column(name = "cuisine_tag", length = 50)
    private String cuisineTag;

    @Column(name = "meal_name", nullable = false, length = 150)
    private String mealName;

    private Integer kcal;

    private Double price;

    // Comma-separated, e.g. "nuts,dairy" - kept simple on purpose
    // since we're just doing a "does this text contain that word"
    // check in Java, not a relational lookup.
    @Column(name = "allergen_tags")
    private String allergenTags;

    private boolean active = true;

    public RestaurantMeal() {
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getRestaurant() { return restaurant; }
    public void setRestaurant(String restaurant) { this.restaurant = restaurant; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    public String getCuisineTag() { return cuisineTag; }
    public void setCuisineTag(String cuisineTag) { this.cuisineTag = cuisineTag; }

    public String getMealName() { return mealName; }
    public void setMealName(String mealName) { this.mealName = mealName; }

    public Integer getKcal() { return kcal; }
    public void setKcal(Integer kcal) { this.kcal = kcal; }

    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }

    public String getAllergenTags() { return allergenTags; }
    public void setAllergenTags(String allergenTags) { this.allergenTags = allergenTags; }

    public boolean isActive() { return active; }
    public void setActive(boolean active) { this.active = active; }
}
