package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dto.req.ProductCreation;
import com.example.demo.dto.req.ProductDelete;
import com.example.demo.dto.req.ProductUpdate;
import com.example.demo.dto.res.ProductResponse;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.model.Product;
import com.example.demo.service.ProductService;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping(path = "/api/manage-product")
public class ProductController {
 @Autowired
 private ProductService productService;

 @Autowired
 private ProductMapper productMapper;

 public ProductController(ProductService productService) {
  this.productService = productService;
 }

 @ApiOperation(value = "Hello World", notes = "Returns a greeting message")
 @GetMapping("/products")
 public List<ProductResponse> products() {
  List<ProductResponse> products = productService.getProducts();
  return products;
 }

 @PostMapping("/create-products")
 public List<Product> createProduct(@RequestBody List<ProductCreation> requests) {
  return productService.createProducts(requests);
 }

 @PutMapping("/update-products")
 public List<Product> updateProducts(@RequestBody List<ProductUpdate> requests) {
  List<Product> updateProducts = productService.updateProducts(requests);
  return updateProducts;
 }

 @DeleteMapping("/delete-products")
 public void deleteProducts(@RequestBody List<ProductDelete> requests) {
  productService.deleteProducts(requests);
 }

}
