package com.example.demo.model.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data // 處理用戶修改密碼後的數據
public class UserUpdateDto {

    @NotNull(message = "用戶ID不能為空")
    private Integer userId;

    @NotEmpty(message = "密碼不能為空")
    @Size(min = 8, max = 12, message = "密碼長度必須在8到12個字符之間")
    private String password;
    
 // Getter and Setter methods

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}