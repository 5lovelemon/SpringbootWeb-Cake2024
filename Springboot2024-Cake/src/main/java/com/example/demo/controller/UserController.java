package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;
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
import jakarta.validation.Valid;

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
    @ResponseBody
    public ResponseEntity<Map<String, String>> registerUser(@RequestBody @Valid UserDto userDto) {
        Map<String, String> response = new HashMap<>();
    	
    	// 檢查郵箱是否已註冊
        Optional<User> existingUserByEmail = userService.getUserByEmail(userDto.getEmail());
        if (existingUserByEmail.isPresent()) {
            response.put("message", "該信箱已被註冊");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
        
        // 檢查手機號碼是否已註冊
        Optional<User> existingUserByPhone = userService.getUserByPhone(userDto.getPhone());
        if (existingUserByPhone.isPresent()) {
            response.put("message", "該手機號碼已被註冊");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
        
        // 密碼是否為空
        if (userDto.getPassword() == null || userDto.getPassword().isEmpty()) {
            response.put("message", "密碼不能為空");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
        
        // 如果郵箱和手機號碼都未被註冊，就繼續執行註冊邏輯
        String message = userService.createUser(userDto);
        response.put("message", message);
        if (message.equals("會員註冊成功")) {
            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
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