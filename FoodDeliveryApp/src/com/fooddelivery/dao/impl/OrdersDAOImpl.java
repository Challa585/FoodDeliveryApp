package com.fooddelivery.dao.impl;

import com.fooddelivery.dao.OrdersDAO;
import com.fooddelivery.dao.OrderItemDAO;
import com.fooddelivery.model.Orders;
import com.fooddelivery.model.OrderItem;
import com.fooddelivery.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrdersDAOImpl implements OrdersDAO {

    private final OrderItemDAO orderItemDAO = new OrderItemDAOImpl();
	private Timestamp orderDate;

    @Override
    public int placeOrder(Orders order) {
        String sql = "INSERT INTO orders (orderdate,restaurantid,userid,totalamount,paymentmethod,status,address) VALUES (?,?,?,?,?,?,?)";
        int orderId = -1;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

             ps.setTimestamp(1, order.getOrderDate());
             ps.setInt(2, order.getRestaurantid());
             ps.setInt(3, order.getUserid());
             ps.setDouble(4, order.getTotalamount());
             ps.setString(5, order.getPaymentmethod());
             ps.setString(6, order.getStatus());
             ps.setString(7, order.getAddress());
             ps.executeUpdate();

             try (ResultSet rs = ps.getGeneratedKeys()) {
                 if (rs.next()) orderId = rs.getInt(1);
             }

             // insert order items using same connection (but our DAO opens new connections).
             // For simplicity and reliability we insert items individually after getting orderId.
             if (orderId > 0 && order.getItems() != null) {
                 for (OrderItem it : order.getItems()) {
                     it.setOrderid(orderId);
                     orderItemDAO.addOrderItem(it);
                 }
             }

        } catch (SQLException e) { e.printStackTrace(); }
        return orderId;
    }

    @Override
    public Orders getOrderById(int id) {
        String sql = "SELECT * FROM orders WHERE orderid=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, id);
             try (ResultSet rs = ps.executeQuery()) {
                 if (rs.next()) {
                     Orders o = new Orders();
                     o.setOrderid(rs.getInt("orderid"));
                     o.setOrderDate(rs.getTimestamp("orderdate"));
                     o.setRestaurantid(rs.getInt("restaurantid"));
                     o.setUserid(rs.getInt("userid"));
                     o.setTotalamount(rs.getDouble("totalamount"));
                     o.setPaymentmethod(rs.getString("paymentmethod"));
                     o.setStatus(rs.getString("status"));
                     o.setAddress(rs.getString("address"));
                     // populate items
                     o.setItems(new OrderItemDAOImpl().getItemsByOrder(o.getOrderid()));
                     return o;
                 }
             }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    @Override
    public List<Orders> getOrdersByUser(int userId) {
        List<Orders> list = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE userid=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, userId);
             try (ResultSet rs = ps.executeQuery()) {
                 while (rs.next()) {
                     Orders o = new Orders();
                     o.setOrderid(rs.getInt("orderid"));
                    
					o.setOrderDate(orderDate);
                     o.setRestaurantid(rs.getInt("restaurantid"));
                     o.setUserid(rs.getInt("userid"));
                     o.setTotalamount(rs.getDouble("totalamount"));
                     o.setPaymentmethod(rs.getString("paymentmethod"));
                     o.setStatus(rs.getString("status"));
                     o.setAddress(rs.getString("address"));
                     o.setItems(new OrderItemDAOImpl().getItemsByOrder(o.getOrderid()));
                     list.add(o);
                 }
             }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    @Override
    public boolean updateOrderStatus(int orderId, String status) {
        String sql = "UPDATE orders SET status=? WHERE orderid=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setString(1, status);
             ps.setInt(2, orderId);
             return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

	@Override
	public int createOrder(Orders order) {
		// TODO Auto-generated method stub
		return 0;
	}
}
