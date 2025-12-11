package com.fooddelivery.model;

public class Menu {
    private int menuid;
    private String menuname;
    private int price;
    private boolean isavailable;
    private String description;
    private String imageurl;
    private int restaurantid;

    // Getters & Setters
    public int getMenuid() { return menuid; }
    public void setMenuid(int menuid) { this.menuid = menuid; }
    public String getMenuname() { return menuname; }
    public void setMenuname(String menuname) { this.menuname = menuname; }
    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }
    public boolean isIsavailable() { return isavailable; }
    public void setIsavailable(boolean isavailable) { this.isavailable = isavailable; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getImageurl() { return imageurl; }
    public void setImageurl(String imageurl) { this.imageurl = imageurl; }
    public int getRestaurantid() { return restaurantid; }
    public void setRestaurantid(int restaurantid) { this.restaurantid = restaurantid; }
}
