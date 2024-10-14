package com.example.demo.mapper;

import com.example.demo.dto.req.ProductCreation;
import com.example.demo.dto.req.ProductUpdate;
import com.example.demo.dto.res.CategoryResponse;
import com.example.demo.dto.res.ProductResponse;
import com.example.demo.model.Category;
import com.example.demo.model.Product;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2024-10-13T10:36:34+0700",
    comments = "version: 1.5.5.Final, compiler: Eclipse JDT (IDE) 3.40.0.v20240919-1711, environment: Java 17.0.12 (Eclipse Adoptium)"
)
@Component
public class ProductMapperImpl implements ProductMapper {

    @Override
    public Product toProduct(ProductCreation request) {
        if ( request == null ) {
            return null;
        }

        Product.ProductBuilder product = Product.builder();

        product.description( request.getDescription() );
        product.imageUrl( request.getImageUrl() );
        product.price( request.getPrice() );
        product.productName( request.getProductName() );
        product.stock( request.getStock() );

        return product.build();
    }

    @Override
    public void update(Product product, ProductUpdate request) {
        if ( request == null ) {
            return;
        }

        product.setDescription( request.getDescription() );
        product.setId( request.getId() );
        product.setImageUrl( request.getImageUrl() );
        product.setPrice( request.getPrice() );
        product.setProductName( request.getProductName() );
        product.setStock( request.getStock() );
    }

    @Override
    public ProductResponse toProductData(Product product) {
        if ( product == null ) {
            return null;
        }

        ProductResponse.ProductResponseBuilder productResponse = ProductResponse.builder();

        productResponse.description( product.getDescription() );
        productResponse.id( product.getId() );
        productResponse.imageUrl( product.getImageUrl() );
        productResponse.price( product.getPrice() );
        productResponse.productName( product.getProductName() );
        productResponse.stock( product.getStock() );

        return productResponse.build();
    }

    @Override
    public CategoryResponse toCategoryData(Category category) {
        if ( category == null ) {
            return null;
        }

        CategoryResponse.CategoryResponseBuilder categoryResponse = CategoryResponse.builder();

        categoryResponse.categoryName( category.getCategoryName() );
        categoryResponse.description( category.getDescription() );

        return categoryResponse.build();
    }
}
