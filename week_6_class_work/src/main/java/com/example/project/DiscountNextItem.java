package com.example.project;

public class DiscountNextItem implements IOffer {

    @Override
    public void applyOffer(Product product) {
        double originPrice = product.getPrice() * (double) product.getAmount();
        double newPrice = (originPrice * (50 / 100)) + originPrice;
        product.setPrice(newPrice);
    }

}