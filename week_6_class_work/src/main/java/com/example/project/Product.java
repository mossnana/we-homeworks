package com.example.project;

import java.util.*;

public class Product {
    private String name;
    private int amount;
    private double price;
    private Boolean isPromotion = false;

    public Product() {

    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAmount() {
        return this.amount;
    }

    public Boolean getIsPromotion() {
        return this.isPromotion;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getPrice() {
        return this.price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setIsPromotion(Boolean check) {
        this.isPromotion = check;
    }

}