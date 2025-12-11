package com.fooddelivery.dao.impl;

import com.fooddelivery.dao.RestaurantDAO;
import com.fooddelivery.model.Restaurant;
import com.fooddelivery.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;

public class RestaurantDAOImpl implements RestaurantDAO {

    @Override
    public int addRestaurant(Restaurant r) {
        String sql = "INSERT INTO restaurant (restaurantname,address,rating,cilisine,deliverytime,isactive,imageurl,adminuserid) VALUES (?,?,?,?,?,?,?,?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, r.getRestaurantname());
            ps.setString(2, r.getAddress());
            ps.setDouble(3, r.getRating());
            ps.setString(4, r.getCilisine());
            ps.setInt(5, r.getDeliverytime());
            ps.setBoolean(6, r.isIsactive());
            ps.setString(7, r.getImageurl());
            ps.setInt(8, r.getAdminuserid());
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) { if (rs.next()) return rs.getInt(1); }
        } catch (SQLException e) { e.printStackTrace(); }
        return -1;
    }

    @Override
    public Restaurant getRestaurantById(int id) {
        String sql = "SELECT * FROM restaurant WHERE restaurantid=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, id);
             try (ResultSet rs = ps.executeQuery()) {
                 if (rs.next()) {
                     Restaurant r = new Restaurant();
                     r.setRestaurantid(rs.getInt("restaurantid"));
                     r.setRestaurantname(rs.getString("restaurantname"));
                     r.setAddress(rs.getString("address"));
                     r.setRating(rs.getDouble("rating"));
                     r.setCilisine(rs.getString("cilisine"));
                     r.setDeliverytime(rs.getInt("deliverytime"));
                     r.setIsactive(rs.getBoolean("isactive"));
                     r.setImageurl(rs.getString("imageurl"));
                     r.setAdminuserid(rs.getInt("adminuserid"));
                     return r;
                 }
             }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    @Override
    public List<Restaurant> getAllRestaurants() {
        List<Restaurant> list = new ArrayList<>();
        String sql = "SELECT * FROM restaurant";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
             while (rs.next()) {
                 Restaurant r = new Restaurant();
                 r.setRestaurantid(rs.getInt("restaurantid"));
                 r.setRestaurantname(rs.getString("restaurantname"));
                 r.setAddress(rs.getString("address"));
                 r.setRating(rs.getDouble("rating"));
                 r.setCilisine(rs.getString("cilisine"));
                 r.setDeliverytime(rs.getInt("deliverytime"));
                 r.setIsactive(rs.getBoolean("isactive"));
                 r.setImageurl(rs.getString("imageurl"));
                 r.setAdminuserid(rs.getInt("adminuserid"));
                 list.add(r);
             }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    @Override
    public boolean updateRestaurant(Restaurant r) {
        String sql = "UPDATE restaurant SET restaurantname=?,address=?,rating=?,cilisine=?,deliverytime=?,isactive=?,imageurl=? WHERE restaurantid=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setString(1, r.getRestaurantname());
             ps.setString(2, r.getAddress());
             ps.setDouble(3, r.getRating());
             ps.setString(4, r.getCilisine());
             ps.setInt(5, r.getDeliverytime());
             ps.setBoolean(6, r.isIsactive());
             ps.setString(7, r.getImageurl());
             ps.setInt(8, r.getRestaurantid());
             return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    @Override
    public boolean deleteRestaurant(int id) {
        String sql = "DELETE FROM restaurant WHERE restaurantid=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, id);
             return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
}
