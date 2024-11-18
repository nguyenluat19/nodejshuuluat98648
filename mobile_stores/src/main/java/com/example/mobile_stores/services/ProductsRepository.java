package com.example.mobile_stores.services;

import com.example.mobile_stores.models.Product;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductsRepository extends JpaRepository<Product, Long> {
    List<Product> findByIsHiddenFalse();
}
