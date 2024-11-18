package com.example.mobile_stores.services;

import com.example.mobile_stores.models.Order;
import com.example.mobile_stores.services.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;



@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    public Order saveOrder(Long productId, Integer quantity, Double totalPrice) {
        Order order = new Order();
        order.setProductId(productId);
        order.setQuantity(quantity);
        order.setTotalPrice(totalPrice);
        order.setCreatedAt(LocalDateTime.now());
        return orderRepository.save(order);
    }
}


