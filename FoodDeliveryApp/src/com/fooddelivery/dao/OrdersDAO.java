package com.fooddelivery.dao;
import com.fooddelivery.model.Orders;
import java.util.List;
public interface OrdersDAO {
    int placeOrder(Orders order);
    Orders getOrderById(int id);
    List<Orders> getOrdersByUser(int userId);
    boolean updateOrderStatus(int orderId, String status);
	int createOrder(Orders order);
}
