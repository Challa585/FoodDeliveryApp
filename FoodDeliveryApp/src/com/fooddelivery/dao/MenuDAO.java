package com.fooddelivery.dao;
import com.fooddelivery.model.Menu;
import java.util.List;
public interface MenuDAO {
    int addMenu(Menu m);
    Menu getMenuById(int id);
    List<Menu> getMenuByRestaurant(int restId);
    boolean updateMenu(Menu m);
    boolean deleteMenu(int id);
}
