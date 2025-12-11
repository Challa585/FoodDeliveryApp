package com.fooddelivery.dao.impl;

import com.fooddelivery.dao.MenuDAO;
import com.fooddelivery.model.Menu;
import com.fooddelivery.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuDAOImp implements MenuDAO {
    @Override
    public int addMenu(Menu m) {
        String sql = "INSERT INTO menu (menuname,price,isavailable,description,imageurl,restaurantid) VALUES (?,?,?,?,?,?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, m.getMenuname());
            ps.setDouble(2, m.getPrice());
            ps.setBoolean(3, m.isIsavailable());
            ps.setString(4, m.getDescription());
            ps.setString(5, m.getImageurl());
            ps.setInt(6, m.getRestaurantid());
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) { if (rs.next()) return rs.getInt(1); }
        } catch (SQLException e) { e.printStackTrace(); }
        return -1;
    }

    @Override
    public Menu getMenuById(int id) {
        String sql = "SELECT * FROM menu WHERE menuid=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Menu m = new Menu();
                    m.setMenuid(rs.getInt("menuid"));
                    m.setMenuname(rs.getString("menuname"));
                    m.setPrice(rs.getInt("price"));
                    m.setIsavailable(rs.getBoolean("isavailable"));
                    m.setDescription(rs.getString("description"));
                    m.setImageurl(rs.getString("imageurl"));
                    m.setRestaurantid(rs.getInt("restaurantid"));
                    return m;
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    @Override
    public List<Menu> getMenuByRestaurant(int restaurantId) {
        List<Menu> list = new ArrayList<>();
        String sql = "SELECT * FROM menu WHERE restaurantid=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, restaurantId);
             try (ResultSet rs = ps.executeQuery()) {
                 while (rs.next()) {
                     Menu m = new Menu();
                     m.setMenuid(rs.getInt("menuid"));
                     m.setMenuname(rs.getString("menuname"));
                     m.setPrice(rs.getInt("price"));
                     m.setIsavailable(rs.getBoolean("isavailable"));
                     m.setDescription(rs.getString("description"));
                     m.setImageurl(rs.getString("imageurl"));
                     m.setRestaurantid(rs.getInt("restaurantid"));
                     list.add(m);
                 }
             }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    @Override
    public boolean updateMenu(Menu m) {
        String sql = "UPDATE menu SET menuname=?,price=?,isavailable=?,description=?,imageurl=? WHERE menuid=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setString(1, m.getMenuname());
             ps.setDouble(2, m.getPrice());
             ps.setBoolean(3, m.isIsavailable());
             ps.setString(4, m.getDescription());
             ps.setString(5, m.getImageurl());
             ps.setInt(6, m.getMenuid());
             return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    @Override
    public boolean deleteMenu(int id) {
        String sql = "DELETE FROM menu WHERE menuid=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, id);
             return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
}
