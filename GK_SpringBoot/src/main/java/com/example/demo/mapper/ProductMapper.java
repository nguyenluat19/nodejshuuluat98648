package com.example.demo.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

import com.example.demo.dto.req.ProductCreation;
import com.example.demo.dto.req.ProductUpdate;
import com.example.demo.dto.res.CategoryResponse;
import com.example.demo.dto.res.ProductResponse;
import com.example.demo.model.Category;
import com.example.demo.model.Product;

@Mapper(componentModel = "spring")

public interface ProductMapper {

 @Mapping(target = "category", ignore = true)
 Product toProduct(ProductCreation request);

 void update(@MappingTarget Product product, ProductUpdate request);

 ProductResponse toProductData(Product product);

 CategoryResponse toCategoryData(Category category);
}
