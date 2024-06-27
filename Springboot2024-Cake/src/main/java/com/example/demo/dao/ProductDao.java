
package com.example.demo.dao;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.po.Product;

public interface ProductDao {
    List<Product> findAllProducts();
    Optional<Product> findById(Integer id);
}
