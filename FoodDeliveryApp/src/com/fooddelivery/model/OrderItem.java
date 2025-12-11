package com.fooddelivery.model;

public class OrderItem {
    private int orderitemid;
    private int orderid;
    private String itemname;
    private int menuid;
    private double totalprice;

    // Getters & Setters
    public int getOrderitemid() { return orderitemid; }
    public void setOrderitemid(int orderitemid) { this.orderitemid = orderitemid; }
    public int getOrderid() { return orderid; }
    public void setOrderid(int orderid) { this.orderid = orderid; }
    public String getItemname() { return itemname; }
    public void setItemname(String itemname) { this.itemname = itemname; }
    public int getMenuid() { return menuid; }
    public void setMenuid(int menuid) { this.menuid = menuid; }
    public double getTotalprice() { return totalprice; }
    public void setTotalprice(double totalprice) { this.totalprice = totalprice; }
	public void setQuantity(int quantity) {
		// TODO Auto-generated method stub
		
	}
}
