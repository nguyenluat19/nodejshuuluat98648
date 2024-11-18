package com.example.mobile_stores.controllers;

import com.example.mobile_stores.models.Product;
import com.example.mobile_stores.services.ProductsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/")
public class ProductsController {

    @Autowired
    private ProductsRepository repo;

    // Trang chủ
    @GetMapping("/")
    public String homeProductList(Model model) {
        List<Product> products = repo.findAll();
        model.addAttribute("products", products);
        return "products/index";
    }

    // Trang bán chạy
    @GetMapping("/banchay")
    public String banchayProductList(Model model) {
        List<Product> products = repo.findAll();
        model.addAttribute("products", products);
        return "products/banchay";
    }

    // Trang cart
    @GetMapping("/cart")
    public String cartProductList(Model model) {
        List<Product> products = repo.findAll();
        model.addAttribute("products", products);
        return "products/cart";
    }

    // Trang lỗi
    @GetMapping("/custom-error")
    public String errorProductList(Model model) {
        List<Product> products = repo.findAll();
        model.addAttribute("products", products);
        return "products/error";
    }

    // Trang showcart
    @GetMapping("/showcart")
    public String showProductList(Model model) {
        List<Product> products = repo.findAll();
        model.addAttribute("products", products);
        return "products/showcart";
    }

    @GetMapping("/admin")
    public String adminProductList(Model model) {
        List<Product> products = repo.findByIsHiddenFalse();
        model.addAttribute("products", products);
        return "products/admin";
    }

    @GetMapping("/xemthem/{id}")
    public String showProductDetails(@PathVariable("id") Long productId, Model model) {
        Product product = repo.findById(productId).orElse(null);
        model.addAttribute("product", product);
        return "products/xemthem";
    }

    // Trang này khi người dùng click vào button thêm vào giỏ hàng
    @GetMapping("/cart/{id}")
    public String cartProductDetails(@PathVariable("id") Long productId, Model model) {
        Product product = repo.findById(productId).orElse(null);
        model.addAttribute("product", product);
        return "products/cart";
    }

    // Xóa sản phẩm
//    @DeleteMapping("/delete/{id}")
//    public String deleteProduct(@PathVariable("id") Long id) {
//        try {
//            Product product = repo.findById(id).orElse(null);
//            if (product != null) {
//                product.setHidden(true);
//                repo.save(product);
//                return "redirect:/admin?success=true";
//            }
//            return "redirect:/admin?error=true";
//        } catch (Exception e) {
//            return "redirect:/admin?error=true";
//        }
//    }

}
