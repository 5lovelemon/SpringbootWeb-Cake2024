package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AllController {
    
    // 顯示蛋糕首頁
	@GetMapping({"/cake", "/"}) // 多打 "/" 是默認入口點
    public String showCakePage() {
        return "cake"; // 返回蛋糕首頁
    }
    
    // 顯示購物須知
    @GetMapping("/shoppingnote")
    public String showShoppingPage() {
        return "shoppingnote"; // 返回購物須知頁面
    }
}