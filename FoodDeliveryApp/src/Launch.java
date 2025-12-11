

import com.fooddelivery.dao.UserDAO;
import com.fooddelivery.dao.impl.UserDAOImpl;
import com.fooddelivery.model.User;

import java.sql.Timestamp;

public class Launch {
    public static void main(String[] args) {
        UserDAO userDao = new UserDAOImpl();

        User u = new User();
        u.setUsername("testuser");
        u.setEmail("test@example.com");
        u.setPhonenumber("9000000000");
        u.setPassword("pwd");
        u.setAddress("Test address");
        u.setRole("USER");
        Timestamp now = new Timestamp(System.currentTimeMillis());
        u.setCreateddate(now);
        u.setLastlogindate(now);

        int id = userDao.createUser(u);
        System.out.println("Inserted user id = " + id);

        User fetched = userDao.getUserById(id);
        System.out.println("Fetched user email = " + (fetched != null ? fetched.getEmail() : "null"));
    }
}
