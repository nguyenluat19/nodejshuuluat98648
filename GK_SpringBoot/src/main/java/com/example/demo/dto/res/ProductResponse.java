package com.example.demo.dto.res;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Builder

public class ProductResponse {
 private String id;
 private String productName;
 private String description;
 private String stock;
 private String price;
 private String imageUrl;
 private String categoryName;
}
