package com.fooddelivery.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items = new ArrayList<>();

    public List<CartItem> getItems(){ return items; }

    public void addItem(CartItem newItem){
        for (CartItem it : items){
            if (it.getMenuId() == newItem.getMenuId()){
                it.setQuantity(it.getQuantity() + newItem.getQuantity());
                return;
            }
        }
        items.add(newItem);
    }

    public void updateItem(int menuId, int qty){
        for (CartItem it : items){
            if (it.getMenuId() == menuId){
                it.setQuantity(qty);
                return;
            }
        }
    }

    public void removeItem(int menuId){
        items.removeIf(i -> i.getMenuId() == menuId);
    }

    public double getTotalAmount(){
        double sum = 0;
        for (CartItem it : items) sum += it.getTotalPrice();
        return sum;
    }

    public void clear(){ items.clear(); }
    public boolean isEmpty(){ return items.isEmpty(); }
}
