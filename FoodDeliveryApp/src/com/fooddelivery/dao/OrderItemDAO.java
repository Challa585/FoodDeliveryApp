package com.fooddelivery.dao;
import com.fooddelivery.model.OrderItem;
import java.util.List;
public interface OrderItemDAO {
    int addOrderItem(OrderItem item);
    List<OrderItem> getItemsByOrder(int orderId);
}
