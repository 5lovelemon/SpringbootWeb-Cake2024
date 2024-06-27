package com.example.demo.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.UserDao;
import com.example.demo.model.dto.UserDto;
import com.example.demo.model.dto.UserUpdateDto;
import com.example.demo.model.po.User;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    // 查詢所有用戶
    public List<User> findAllUsers() {
        return userDao.findAllUsers();
    }

    // 根據用戶ID查詢用戶
    public Optional<User> getUser(Integer userId) {
        return userDao.getUser(userId);
    }

    // 根據用戶Email查詢用戶
    public Optional<User> getUserByEmail(String email) {
        return userDao.getUserByEmail(email);
    }

    // 註冊用戶
    public String createUser(UserDto userDto) {
        if (!userDto.getPassword().equals(userDto.getConfirmPassword())) {
            return "密碼和確認密碼不匹配";
        }

        User user = new User();
        user.setUsername(userDto.getUsername());
        user.setEmail(userDto.getEmail());
        user.setPhone(userDto.getPhone());
        user.setBirthday(userDto.getBirthday());
        user.setPassword(userDto.getPassword()); // 直接保存密码
        user.setCreated_at(LocalDateTime.now()); // 设置创建时间

        int result = userDao.createUser(user);

        if (result > 0) {
            return "註冊成功";
        } else {
            return "註冊失敗";
        }
    }

    // 修改用戶密碼
    public String updateUser(UserUpdateDto userUpdateDto) {
        Optional<User> existingUserOpt = userDao.getUser(userUpdateDto.getUserId());
        if (existingUserOpt.isPresent()) {
            User existingUser = existingUserOpt.get();
            existingUser.setPassword(userUpdateDto.getPassword()); // 只更新密码
            int result = userDao.updateUser(existingUser);
            if (result > 0) {
                return "密碼更新成功";
            } else {
                return "密碼更新失敗";
            }
        }
        return "用戶不存在";
    }

    // 刪除用戶
    public String deleteUser(Integer userId) {
        int result = userDao.deleteUser(userId);
        if (result > 0) {
            return "用戶刪除成功";
        } else {
            return "用戶刪除失敗";
        }
    }
}