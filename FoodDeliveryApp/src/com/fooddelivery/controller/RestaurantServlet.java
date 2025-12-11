package com.fooddelivery.controller;

import com.fooddelivery.dao.RestaurantDAO;
import com.fooddelivery.dao.impl.RestaurantDAOImpl;
import com.fooddelivery.model.Restaurant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/restaurant")
public class RestaurantServlet extends HttpServlet {
    private RestaurantDAO dao = new RestaurantDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Restaurant> list = dao.getAllRestaurants();
        req.setAttribute("restaurantList", list);
        req.getRequestDispatcher("restaurant.jsp").forward(req, resp);
    }
}
