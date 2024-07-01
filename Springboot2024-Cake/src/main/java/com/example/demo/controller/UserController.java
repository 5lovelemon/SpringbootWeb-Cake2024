package com.example.demo.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.model.dto.UserDto;
import com.example.demo.model.dto.UserUpdateDto;
import com.example.demo.model.po.User;
import com.example.demo.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping
public class UserController {

    @Autowired
    private UserService userService;
    
    // 用戶註冊頁面
    @GetMapping("/account")
    public String showRegisterForm() {
        return "account";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute UserDto userDto, Model model) {
        String message = userService.createUser(userDto);
        model.addAttribute("message", message);
        System.out.println("Registration message: " + message);  // 日誌
        if (message.equals("會員註冊成功")) {
        	System.out.println("Redirecting to login page");  // 日誌
            return "redirect:/cname"; // 重新定向到登入頁面
        } else {
            return "account"; // 保留在註冊頁面
        }
    }
    
    // 用戶修改頁面
    @GetMapping("/updatePassword")
    public String showUpdatePasswordForm(Model model) {
        model.addAttribute("userUpdateDto", new UserUpdateDto());
        return "updatePassword";
    }

    @PostMapping("/updatePassword")
    public String updatePassword(@ModelAttribute UserUpdateDto userUpdateDto, Model model) {
        String message = userService.updateUser(userUpdateDto);
        model.addAttribute("message", message);
        return "updatePassword"; // 保留在修改密碼頁面
    }

    // 用戶登入頁面
    @GetMapping("/cname")
    public String showLoginForm(Model model) {
        return "cname";
    }

    @PostMapping("/cname")
    public ResponseEntity<?> login(@RequestParam String email, @RequestParam String password, HttpSession session) {
        Optional<User> userOpt = userService.getUserByEmail(email);
        if (userOpt.isPresent() && userOpt.get().getPassword().equals(password)) {
            session.setAttribute("loggedInUser", userOpt.get());
            return ResponseEntity.ok().build(); // 登入成功，返回 200 OK
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("用戶名或密碼錯誤"); // 登入失败，返回 401 Unauthorized
        }
    }

    // 用戶登出
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 清除當前用戶的會話信息
        return "redirect:/cname"; // 重定向到登入頁面
    }
    
}