package com.fooddelivery.controller;

import com.fooddelivery.dao.MenuDAO;
import com.fooddelivery.dao.RestaurantDAO;
import com.fooddelivery.dao.impl.MenuDAOImp;
import com.fooddelivery.dao.impl.RestaurantDAOImpl;
import com.fooddelivery.model.Menu;
import com.fooddelivery.model.Restaurant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    private MenuDAO menuDao = new MenuDAOImp();
    private RestaurantDAO restDao = new RestaurantDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("restaurantId");
        if (sid == null) {
            resp.sendRedirect("restaurant");
            return;
        }
        String sid1 = req.getParameter("restaurantId");

        if (sid1 == null || sid1.equals("null") || sid1.trim().isEmpty()) {
            resp.sendRedirect("restaurant");
            return;
        }

        int restaurantId = Integer.parseInt(sid1);
     // Store in session to use in cart.jsp
        HttpSession session = req.getSession();
        session.setAttribute("restaurantId", restaurantId);
        List<Menu> menuList = menuDao.getMenuByRestaurant(restaurantId);
        Restaurant r = restDao.getRestaurantById(restaurantId);
        req.setAttribute("menuList", menuList);
        req.setAttribute("restaurant", r);
        req.getRequestDispatcher("menu.jsp").forward(req, resp);
    }
}
