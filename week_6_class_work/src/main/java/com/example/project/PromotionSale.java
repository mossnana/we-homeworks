package com.example.project;

import java.util.ArrayList;

public class PromotionSale implements IOffer {

    private int buyProduct;
    private int getProduct;
    private ArrayList<String> productList = new ArrayList<>();

    public PromotionSale() {
        this.productList.add("Sticky Rice");
    }

    public Boolean check(String name) {
        Boolean loop = false;
        for(String product: productList) {
            if(name == product) {
                loop = true;
            }
        }
        return loop;
    }

    public int applyOffer() {
        if(this.buyProduct == 2) {
            return 1;
        } else {
            return 0;
        }
    }

    public int getBuyProduct() {
        return this.buyProduct;
    }

    public void setBuyProduct(int buyProduct) {
        this.buyProduct = buyProduct;
    }

    public int getGetProduct() {
        return this.getProduct;
    }

    public void setGetProduct(int getProduct) {
        this.getProduct = getProduct;
    }

    @Override
    public void applyOffer(Product product) {
        
    }
}