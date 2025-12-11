package com.fooddelivery.model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class Orders {
    private int orderid;
    private Timestamp orderDate;
    private int restaurantid;
    private int userid;
    private double totalamount;
    private String paymentmethod;
    private String status;
    private String address;
    private List<OrderItem> items;

    // Getters & Setters
    public int getOrderid() { return orderid; }
    public void setOrderid(int orderid) { this.orderid = orderid; }
    public Timestamp getOrderDate() { return orderDate; }
    public void setOrderDate(Timestamp orderDate) { this.orderDate = orderDate; }
    public int getRestaurantid() { return restaurantid; }
    public void setRestaurantid(int restaurantid) { this.restaurantid = restaurantid; }
    public int getUserid() { return userid; }
    public void setUserid(int userid) { this.userid = userid; }
    public double getTotalamount() { return totalamount; }
    public void setTotalamount(double totalamount) { this.totalamount = totalamount; }
    public String getPaymentmethod() { return paymentmethod; }
    public void setPaymentmethod(String paymentmethod) { this.paymentmethod = paymentmethod; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public List<OrderItem> getItems() { return items; }
    public void setItems(List<OrderItem> items) { this.items = items; }
}
