package com.example.demo.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "products")

public class Product {
 @Id
 @GeneratedValue(strategy = GenerationType.UUID)
 String id;
 String productName;
 String description;
 String stock;
 @ManyToOne(fetch = FetchType.EAGER)
 @JoinColumn(name = "category_id", nullable = false)
 Category category;
 String price;
 String imageUrl;
 @Column(updatable = false)
 LocalDateTime createdAt;
 LocalDateTime updatedAt;
}
