package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.model.po.Product;
import com.example.demo.service.ProductService;
import com.example.demo.service.ShoppingService;

@Controller
@RequestMapping
public class ProductController {

    @Autowired
    private ProductService productService;
    
    @Autowired
    private ShoppingService shoppingService;

    // 顯示所有商品頁面
    @GetMapping("/product")
    public String listProducts(Model model) {
        model.addAttribute("products", productService.findAllProducts());
        return "product";
    }
    
    // 將商品添加到購物車
    @PostMapping("/add-to-cart")
    public String addToCart(@RequestParam Integer cakeId, @RequestParam Integer quantity, Model model) {
        // 根据 cakeId 查找商品
        Product cake = productService.findById(cakeId).orElseThrow(() -> new RuntimeException("Product not found"));
        cake.setQuantity(quantity); // 設置商品數量
        shoppingService.addToCart(cake); //將產品添加到購物車
        return "redirect:/product"; //添加完成後重新定向商品頁面
    }

    // 查看購物車頁面
    @GetMapping("/cart")
    public String viewCart(Model model) {
        model.addAttribute("cartItems", shoppingService.getCakesInCart());
        model.addAttribute("totalPrice", shoppingService.calculateTotalPrice());
        return "cart";
    }

    // 更新購物車商品的數量
    @PostMapping("/update-quantity")
    public String updateQuantity(@RequestParam Integer cakeId, @RequestParam Integer quantity) {
        shoppingService.updateQuantity(cakeId, quantity);
        return "redirect:/cart";
    }
    
    // 從購物車移除商品
    @PostMapping("/remove-from-cart")
    public String removeFromCart(@RequestParam Integer cakeId) {
        shoppingService.removeFromCart(cakeId);
        return "redirect:/cart";
    }

    // 清空購物車
    @PostMapping("/clear-cart")
    public String clearCart() {
        shoppingService.clearCart(); // 清空購物車
        return "redirect:/cart"; // 清空完成後重新定向到購物車
    }
}