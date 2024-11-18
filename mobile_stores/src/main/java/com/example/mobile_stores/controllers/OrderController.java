package com.example.mobile_stores.controllers;

import com.example.mobile_stores.services.OrderService;
import jakarta.persistence.criteria.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/orders")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @PostMapping("/checkout")
    public Order checkout(@RequestBody OrderRequest orderRequest) {
        return (Order) orderService.saveOrder(
                orderRequest.getProductId(),
                orderRequest.getQuantity(),
                orderRequest.getTotalPrice()
        );
    }
}

// Class Request DTO
class OrderRequest {
    private Long productId;
    private Integer quantity;
    private Double totalPrice;

    // Getters và Setters
    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
}

