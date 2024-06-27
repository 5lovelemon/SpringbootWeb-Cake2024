package com.example.demo.model.dto;

import java.time.LocalDate;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data // 處理用戶輸入的數據
public class UserDto {

    @NotEmpty(message = "用戶名稱不能為空")
    @Size(max = 50, message = "用戶名稱不能超過50個字符")
    private String username;

    @NotEmpty(message = "信箱不能為空")
    @Email(message = "信箱格式不正確")
    @Size(max = 100, message = "信箱不能超過100個字符")
    private String email;

    @NotEmpty(message = "電話號碼不能為空")
    @Size(min = 10, max = 10, message = "電話號碼必須是10位數字")
    private String phone;

    @NotEmpty(message = "生日不能為空")
    @Past(message = "生日必須是過去的日期")
    private LocalDate birthday;

    @NotEmpty(message = "密碼不能為空")
    @Size(min = 8, max = 12, message = "密碼長度必須在8到12個字符之間")
    private String password;

    @NotEmpty(message = "確認密碼不能為空")
    @Size(min = 8, max = 12, message = "確認密碼長度必須在8到12個字符之間")
    private String confirmPassword;
    
 // Getter and Setter methods

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}