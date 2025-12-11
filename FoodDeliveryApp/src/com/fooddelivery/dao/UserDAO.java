package com.fooddelivery.dao;
import com.fooddelivery.model.User;
import java.util.List;

public interface UserDAO {
    int createUser(User user);
    User getUserById(int id);
    User getUserByEmailAndPassword(String email, String password);
    List<User> getAllUsers();
    boolean updateUser(User user);
    boolean deleteUser(int id);
	User login(String email, String password);
}
