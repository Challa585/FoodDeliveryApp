package com.fooddelivery.controller;

import com.fooddelivery.model.Cart;
import com.fooddelivery.model.CartItem;
import com.fooddelivery.model.Menu;
import com.fooddelivery.dao.MenuDAO;
import com.fooddelivery.dao.OrdersDAO;
import com.fooddelivery.dao.impl.MenuDAOImp;
import com.fooddelivery.dao.impl.OrdersDAOImpl;
import com.fooddelivery.model.Orders;
import com.fooddelivery.model.OrderItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private MenuDAO menuDao = new MenuDAOImp();
    private OrdersDAO ordersDao = new OrdersDAOImpl();

    private Cart getCart(HttpSession session){
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null){ cart = new Cart(); session.setAttribute("cart", cart); }
        return cart;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        Cart cart = getCart(session);

        if ("add".equalsIgnoreCase(action)){
            int menuId = Integer.parseInt(req.getParameter("menuId"));
            String name = req.getParameter("name");
            int qty = Integer.parseInt(req.getParameter("qty"));
            double price = Double.parseDouble(req.getParameter("price"));
            CartItem ci = new CartItem(menuId, name, qty, price);
            cart.addItem(ci);
            resp.sendRedirect("cart.jsp");
            return;
        }

        if ("update".equalsIgnoreCase(action)){
            int menuId = Integer.parseInt(req.getParameter("menuId"));
            int qty = Integer.parseInt(req.getParameter("qty"));
            cart.updateItem(menuId, qty);
            resp.sendRedirect("cart.jsp");
            return;
        }

        if ("remove".equalsIgnoreCase(action)){
            int menuId = Integer.parseInt(req.getParameter("menuId"));
            cart.removeItem(menuId);
            resp.sendRedirect("cart.jsp");
            return;
        }

        if ("checkout".equalsIgnoreCase(action)){
            Integer userId = (Integer) session.getAttribute("userid");
            if (userId == null) userId = 1; 

            Orders order = new Orders();
            order.setOrderDate(new Timestamp(System.currentTimeMillis()));
            order.setRestaurantid(1);
            order.setUserid(userId);
            order.setTotalamount(cart.getTotalAmount());
            order.setPaymentmethod("COD");
            order.setStatus("PLACED");
            order.setAddress("Customer address");

            List<OrderItem> items = new ArrayList<>();
            cart.getItems().forEach(ci -> {
                OrderItem oi = new OrderItem();
                oi.setMenuid(ci.getMenuId());
                oi.setItemname(ci.getItemName());
                oi.setTotalprice(ci.getTotalPrice());
                items.add(oi);
            });
            order.setItems(items);

            int orderId = ordersDao.placeOrder(order);
            if (orderId > 0) {
               
                session.setAttribute("cart", cart);
                resp.sendRedirect("restaurant"); 
            } else {
                resp.sendRedirect("cart.jsp?error=1");
            }
            return;
        }

        resp.sendRedirect("cart.jsp");
    }
}
