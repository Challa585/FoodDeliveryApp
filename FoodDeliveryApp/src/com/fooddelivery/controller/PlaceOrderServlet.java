package com.fooddelivery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooddelivery.dao.OrdersDAO;
import com.fooddelivery.dao.impl.OrdersDAOImpl;
import com.fooddelivery.model.Orders;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            // If user is not logged in → redirect to login
            response.sendRedirect("login.jsp");
            return;
        }

        String address = request.getParameter("address");
        String payment = request.getParameter("payment");

        // SAVE ORDER TO DATABASE
        OrdersDAO orderDAO = new OrdersDAOImpl();
        Orders order = new Orders();

        order.setUserid(userId);
        order.setAddress(address);
        order.setPaymentmethod(payment);

        int orderId = orderDAO.createOrder(order);

        // After order is created → redirect to confirmation page
        response.sendRedirect("orderconfirmation.jsp?orderId=" + orderId);
    }
}
