package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.demo.model.po.Product;

@Service
public class ShoppingService {

    private List<Product> cart = new ArrayList<>();

    public void addToCart(Product product) {
        Optional<Product> existingProduct = cart.stream()
                .filter(p -> p.getCakeid().equals(product.getCakeid()))
                .findFirst();
        if (existingProduct.isPresent()) {
            Product p = existingProduct.get();
            p.setQuantity(p.getQuantity() + product.getQuantity());
        } else {
            cart.add(product);
        }
    }

    public List<Product> getCakesInCart() {
        return new ArrayList<>(cart);
    }

    public void updateQuantity(Integer cakeId, Integer quantity) {
        cart.stream()
            .filter(p -> p.getCakeid().equals(cakeId))
            .findFirst()
            .ifPresent(p -> p.setQuantity(quantity));
    }

    public void removeFromCart(Integer cakeId) {
        cart.removeIf(p -> p.getCakeid().equals(cakeId));
    }

    public void clearCart() {
        cart.clear();
    }

    public double calculateTotalPrice() {
        return cart.stream()
                   .mapToDouble(p -> p.getCakeprice() * p.getQuantity())
                   .sum();
    }
}