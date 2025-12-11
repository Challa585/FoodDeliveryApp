package com.fooddelivery.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.fooddelivery.dao.UserDAO;
import com.fooddelivery.dao.impl.UserDAOImpl;
import com.fooddelivery.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAOImpl();
        User user = userDAO.login(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getUserid());
            session.setAttribute("username", user.getUsername());

            // Redirect to checkout or home
            response.sendRedirect("checkout.jsp");
        } else {
            request.setAttribute("error", "Invalid Email or Password!");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }
}
