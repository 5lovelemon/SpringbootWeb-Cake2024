package com.example.demo.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.dao.UserDao;
import com.example.demo.model.po.User;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override // 查詢所有用戶
    public List<User> findAllUsers() {
        String sql = "SELECT * FROM user";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
    }

    @Override // 根據用戶id 查詢用戶
    public Optional<User> getUser(Integer id) {
        String sql = "SELECT * FROM user WHERE userid = ?";
        try {
            User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), id);
            return Optional.ofNullable(user);
        } catch (Exception e) {
            return Optional.empty();
        }
    }

    @Override // 根據用戶名字 查詢用戶
    public Optional<User> findByUsername(String username) {
        String sql = "SELECT * FROM user WHERE username = ?";
        try {
            User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), username);
            return Optional.ofNullable(user);
        } catch (Exception e) {
            return Optional.empty();
        }
    }

    @Override // 根據用戶Email 查詢用戶
    public Optional<User> getUserByEmail(String email) {
        String sql = "SELECT * FROM user WHERE email = ?";
        try {
            User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), email);
            return Optional.ofNullable(user);
        } catch (Exception e) {
            return Optional.empty();
        }
    }

    @Override // 新增用戶
    public int createUser(User user) {
        String sql = "INSERT INTO user (username, email, phone, birthday, password, created_at) VALUES (?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, user.getUsername(), user.getEmail(), user.getPhone(), user.getBirthday(), user.getPassword(), user.getCreated_at());
    }

    @Override // 更新修改用戶
    public int updateUser(User user) {
        String sql = "UPDATE user SET username = ?, email = ?, phone = ?, birthday = ?, password = ? WHERE userid = ?";
        return jdbcTemplate.update(sql, user.getUsername(), user.getEmail(), user.getPhone(), user.getBirthday(), user.getPassword(), user.getUserId());
    }

    @Override // 刪除用戶
    public int deleteUser(Integer id) {
        String sql = "DELETE FROM user WHERE userid = ?";
        return jdbcTemplate.update(sql, id);
    }
}