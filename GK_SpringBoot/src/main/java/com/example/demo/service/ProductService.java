package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.req.ProductCreation;
import com.example.demo.dto.req.ProductDelete;
import com.example.demo.dto.req.ProductUpdate;
import com.example.demo.dto.res.ProductResponse;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.model.Category;
import com.example.demo.model.Product;
import com.example.demo.repository.CategoryRepository;
import com.example.demo.repository.ProductRepository;

import jakarta.transaction.Transactional;

@Service
public class ProductService {
  @Autowired
  private ProductRepository productRepository;
  @Autowired
  private ProductMapper productMapper;
  @Autowired
  private CategoryRepository categoryRepository;

  public List<Product> createProducts(List<ProductCreation> requests) {
    List<Product> saveProducts = new ArrayList<>();

    for (ProductCreation request : requests) {
      Product product = productMapper.toProduct(request);

      Optional<Category> categoryOptional = categoryRepository.findById(request.getCategoryId());

      if (categoryOptional.isPresent()) {
        product.setCategory(categoryOptional.get());
      } else {
        throw new RuntimeException("Category this not found" + request.getCategoryId());
      }

      saveProducts.add(product);
    }
    return productRepository.saveAll(saveProducts);
  }

  public List<ProductResponse> getProducts() {
    return productRepository.findAll().stream()
        .map(this::convertProductDto)
        .collect(Collectors.toList());
  }

  private ProductResponse convertProductDto(Product product) {
    return new ProductResponse(
        product.getId(),
        product.getProductName(),
        product.getDescription(),
        product.getStock(),
        product.getPrice(),
        product.getImageUrl(),
        product.getCategory() != null ? product.getCategory().getCategoryName() : null);
  }

  @Transactional
  public List<Product> updateProducts(List<ProductUpdate> requests) {
    List<Product> saveProducts = new ArrayList<>();

    for (ProductUpdate request : requests) {
      Optional<Product> optionalProduct = productRepository.findById(request.getId());
      if (optionalProduct.isPresent()) {
        Product product = optionalProduct.get();
        productMapper.update(product, request);
        saveProducts.add(product);
      }
    }
    return productRepository.saveAll(saveProducts);
  }

  public void deleteProducts(List<ProductDelete> requests) {

    List<String> productIds = requests.stream()
        .map(ProductDelete::getId)
        .collect(Collectors.toList());

    productRepository.deleteAllByIdInBatch(productIds);
  }

}
