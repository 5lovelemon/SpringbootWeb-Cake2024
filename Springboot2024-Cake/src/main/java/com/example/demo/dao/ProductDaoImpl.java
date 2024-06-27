package com.example.demo.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.model.po.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Product> findAllProducts() {
        String sql = "SELECT * FROM product";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Product.class));
    }

    @Override
    public Optional<Product> findById(Integer id) {
        String sql = "SELECT * FROM product WHERE cakeid = ?";
        try {
            Product cake = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Product.class), id);
            return Optional.ofNullable(cake);
        } catch (Exception e) {
            return Optional.empty();
        }
    }
}