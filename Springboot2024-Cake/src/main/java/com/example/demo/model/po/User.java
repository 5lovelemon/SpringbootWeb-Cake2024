package com.example.demo.model.po;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table("user")
public class User {

    @Id
    @Column("userid")
    private Integer userId;

    @NotEmpty(message = "用戶名稱不能為空")
    @Size(max = 50, message = "用戶名稱不能超過50個字符")
    @Column("username")
    private String username;

    @NotEmpty(message = "信箱不能為空")
    @Email(message = "信箱格式不正確")
    @Size(max = 100, message = "信箱不能超過100個字符")
    @Column("email")
    private String email;

    @NotEmpty(message = "電話號碼不能為空")
    @Size(min = 10, max = 10, message = "電話號碼必須是10位數字")
    @Column("phone")
    private String phone;

    @NotNull(message = "生日不能為空")
    @Past(message = "生日必須是過去的日期")
    @Column("birthday")
    private LocalDate birthday;

    @NotEmpty(message = "密碼不能為空")
    @Size(min = 8, max = 12, message = "密碼長度必須在8到12個字符之間")
    @Column("password")
    private String password;
    
    private String confirmPassword;

    @Column("created_at")
    private LocalDateTime created_at;

    // Getters 和 Setters

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

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

    public String getConfirmpassword() {
    	return confirmPassword;
	}
    
    public void setconfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
    
    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

}