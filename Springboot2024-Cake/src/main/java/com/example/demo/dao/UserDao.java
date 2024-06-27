package com.example.demo.dao;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.po.User;

public interface UserDao {
    List<User> findAllUsers();
   
    Optional<User> getUser(Integer id);
    
    Optional<User> findByUsername(String username);
   
    Optional<User> getUserByEmail(String email);
   
    int createUser(User user);

    int updateUser(User user);
		
    int deleteUser(Integer id);
    
}