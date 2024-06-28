package com.example.demo.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
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
        if (message.equals("會員註冊成功")) {
            return "redirect:/cname"; // 重新定向到登入頁面
        } else {
            return "account"; // 保留在注册页面
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
        return "updatePassword"; // 保留在修改密码页面
    }

    // 用戶登入頁面
    @GetMapping("/cname")
    public String showLoginForm(Model model) {
        return "cname";
    }

    @PostMapping("/cname")
    public String login(@RequestParam String email, @RequestParam String password, Model model, HttpSession session) {
        Optional<User> userOpt = userService.getUserByEmail(email);
        if (userOpt.isPresent() && userOpt.get().getPassword().equals(password)) {
        	session.setAttribute("loggedInUser", userOpt.get());
            return "redirect:/cake"; // 登入成功，跳转到首页
        } else {
            model.addAttribute("message", "登入失敗，用戶名或密碼錯誤");
            return "cname"; // 登入失敗，保留在登入頁面
        }
    }
    
    // 用戶登出
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 清除當前用戶的會話信息
        return "redirect:/cname"; // 重定向到登入頁面
    }
    
}