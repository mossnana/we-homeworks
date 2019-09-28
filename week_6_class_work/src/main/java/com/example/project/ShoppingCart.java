package com.example.project;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {

    private List<Product> productList = new ArrayList<>();
    private PromotionSale promotion;

    public int getProductCount() {
        return this.productList.size();
    }

    public double getTotalPrice() {
        double totalPrice = 0.00;
        for(Product product: productList) {
            if(!product.getIsPromotion()) {
                totalPrice += product.getPrice() * product.getAmount();
            }
        }
        return totalPrice;
    }

    public void addProduct(Product newProduct) {
        this.productList.add(newProduct);
        if(this.checkOffer(newProduct, newProduct.getAmount()) != 0) {
            Product freeProduct = new Product();
            freeProduct.setName(newProduct.getName());
            freeProduct.setPrice(newProduct.getPrice());
            freeProduct.setAmount(this.checkOffer(freeProduct, newProduct.getAmount()));
            freeProduct.setIsPromotion(true);
            this.productList.add(freeProduct);
        }
    }

    private int checkOffer(Product product, int buyAmount) {
        PromotionSale promotion = new PromotionSale();
        if(promotion.check(product.getName())) {
            promotion.setBuyProduct(buyAmount);
            return promotion.applyOffer();
        } else {
            return 0;
        }
    }

    public void setOffer(PromotionSale offer) {
        this.promotion = offer;
    }
}