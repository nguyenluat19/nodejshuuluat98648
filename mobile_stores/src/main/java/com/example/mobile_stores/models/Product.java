package com.example.mobile_stores.models;

import jakarta.persistence.*;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String tragop;
    private String name;
    private String image;
    private String img_detail;
    private double pricesgoc;
    private double prices;
    private String danhgia;

    @Column(columnDefinition = "TEXT")
    private String description;
    private String baiviet;

    private boolean isHidden = false;

    public String getImg_detail() {
        return img_detail;
    }

    public void setImg_detail(String img_detail) {
        this.img_detail = img_detail;
    }

    // Getter và Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTragop() {
        return tragop;
    }

    public void setTragop(String tragop) {
        this.tragop = tragop;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPricesgoc() {
        return pricesgoc;
    }

    public void setPricesgoc(double pricesgoc) {
        this.pricesgoc = pricesgoc;
    }

    public double getPrices() {
        return prices;
    }

    public void setPrices(double prices) {
        this.prices = prices;
    }

    public String getDanhgia() {
        return danhgia;
    }

    public void setDanhgia(String danhgia) {
        this.danhgia = danhgia;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBaiviet() {
        return baiviet;
    }

    public void setBaiviet(String baiviet) {
        this.baiviet = baiviet;
    }

    public boolean isHidden() {
        return isHidden;
    }

    public void setHidden(boolean hidden) {
        this.isHidden = hidden;
    }
}
