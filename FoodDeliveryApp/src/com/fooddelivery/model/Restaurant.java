package com.fooddelivery.model;

public class Restaurant {
    private int restaurantid;
    private String restaurantname;
    private String address;
    private double rating;
    private String cilisine;
    private int deliverytime; // minutes
    private boolean isactive;
    private String imageurl;
    private int adminuserid;

    // Getters & Setters
    public int getRestaurantid() { return restaurantid; }
    public void setRestaurantid(int restaurantid) { this.restaurantid = restaurantid; }
    public String getRestaurantname() { return restaurantname; }
    public void setRestaurantname(String restaurantname) { this.restaurantname = restaurantname; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }
    public String getCilisine() { return cilisine; }
    public void setCilisine(String cilisine) { this.cilisine = cilisine; }
    public int getDeliverytime() { return deliverytime; }
    public void setDeliverytime(int deliverytime) { this.deliverytime = deliverytime; }
    public boolean isIsactive() { return isactive; }
    public void setIsactive(boolean isactive) { this.isactive = isactive; }
    public String getImageurl() { return imageurl; }
    public void setImageurl(String imageurl) { this.imageurl = imageurl; }
    public int getAdminuserid() { return adminuserid; }
    public void setAdminuserid(int adminuserid) { this.adminuserid = adminuserid; }
}
