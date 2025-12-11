package com.fooddelivery.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.fooddelivery.dao.UserDAO;
import com.fooddelivery.dao.impl.UserDAOImpl;
import com.fooddelivery.model.User;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form values
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String address = request.getParameter("address");

        // Create a User object
        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPhonenumber(phone);
        user.setPassword(password);
        user.setAddress(address);
        user.setRole("USER"); // default role

        // Insert user into DB
        UserDAO userDAO = new UserDAOImpl();
        int result = userDAO.createUser(user);

        if (result > 0) {
            // Success → Redirect to login page
            request.setAttribute("message", "Registration Successful! Please login.");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        } else {
            // Error → Stay on registration page
            request.setAttribute("error", "Registration failed! Try again.");
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.forward(request, response);
        }
    }
}
