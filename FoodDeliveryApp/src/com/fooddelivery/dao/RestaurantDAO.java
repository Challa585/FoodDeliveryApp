package com.fooddelivery.dao;
import com.fooddelivery.model.Restaurant;
import java.util.List;
public interface RestaurantDAO {
    int addRestaurant(Restaurant r);
    Restaurant getRestaurantById(int id);
    List<Restaurant> getAllRestaurants();
    boolean updateRestaurant(Restaurant r);
    boolean deleteRestaurant(int id);
}
