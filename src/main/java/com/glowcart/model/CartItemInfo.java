package com.glowcart.model;

public class CartItemInfo {
    private int cartId;
    private String productName;
    private double price;
    private String imageUrl;
    private int quantity;

    public CartItemInfo(int cartId, String productName, double price, String imageUrl, int quantity) {
        this.cartId = cartId;
        this.productName = productName;
        this.price = price;
        this.imageUrl = imageUrl;
        this.quantity = quantity;
    }

    public int getCartId() { return cartId; }
    public String getProductName() { return productName; }
    public double getPrice() { return price; }
    public String getImageUrl() { return imageUrl; }
    public int getQuantity() { return quantity; }
}