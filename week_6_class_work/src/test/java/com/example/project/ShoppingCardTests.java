package com.example.project;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class ShoppingCartTests {
    // Requirements

    // 1. Initial Cart, Amount of products will be 0.
    @Test
    public void test_createEmplyShoppingCart() {
        ShoppingCart cart = new ShoppingCart();
        assertEquals(0, cart.getProductCount());
    }

    // 2. Add product in cart
    @Test
    public void test_addProductToCart() {
        ShoppingCart cart = new ShoppingCart();
        Product product = new Product();
        product.setName("Milk");
        product.setAmount(2);
        product.setPrice(30.00);
        cart.addProduct(product);
        // Cart amount is 1
        assertEquals(1, cart.getProductCount());
        // Total price is 30 * 2
        assertEquals(60.0, cart.getTotalPrice());
    }

    @Test
    public void test_addProductToCart_2() {
        ShoppingCart cart = new ShoppingCart();
        Product product = new Product();
        Product product2 = new Product();
        // Product 1
        product.setName("Milk");
        product.setAmount(2);
        product.setPrice(30.00);
        // Product 2
        product2.setName("Egg");
        product2.setAmount(5);
        product2.setPrice(2.00);
        cart.addProduct(product);
        cart.addProduct(product2);
        // Cart amount is 2
        assertEquals(2, cart.getProductCount());
        // Total price is ((30 * 2) + (5 * 2)) = 70
        assertEquals(70.0, cart.getTotalPrice());
    }

    // 3. Buy 2 Free 1
    @Test
    public void test_usePromotion() {
        PromotionSale promotion = new PromotionSale();
        ShoppingCart cart = new ShoppingCart();
        cart.setOffer(promotion);
        Product buy = new Product();
        buy.setName("Sticky Rice");
        buy.setAmount(2);
        buy.setPrice(10);
        cart.addProduct(buy);
        assertEquals(2, cart.getProductCount());
        assertEquals(20.0, cart.getTotalPrice());
    }
}
