package com.fooddelivery.dao.impl;

import com.fooddelivery.dao.OrderItemDAO;
import com.fooddelivery.model.OrderItem;
import com.fooddelivery.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDAOImpl implements OrderItemDAO {

    @Override
    public int addOrderItem(OrderItem item) {
        String sql = "INSERT INTO orderitem (orderid,itemname,menuid,totalprice) VALUES (?,?,?,?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
             ps.setInt(1, item.getOrderid());
             ps.setString(2, item.getItemname());
             ps.setInt(3, item.getMenuid());
             ps.setDouble(4, item.getTotalprice());
             ps.executeUpdate();
             try (ResultSet rs = ps.getGeneratedKeys()) { if (rs.next()) return rs.getInt(1); }
        } catch (SQLException e) { e.printStackTrace(); }
        return -1;
    }

    @Override
    public List<OrderItem> getItemsByOrder(int orderId) {
        List<OrderItem> list = new ArrayList<>();
        String sql = "SELECT * FROM orderitem WHERE orderid=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, orderId);
             try (ResultSet rs = ps.executeQuery()) {
                 while (rs.next()) {
                     OrderItem it = new OrderItem();
                     it.setOrderitemid(rs.getInt("orderitemid"));
                     it.setOrderid(rs.getInt("orderid"));
                     it.setItemname(rs.getString("itemname"));
                     it.setMenuid(rs.getInt("menuid"));
                     it.setTotalprice(rs.getDouble("totalprice"));
                     list.add(it);
                 }
             }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
}
