package com.vn.productmanagement.service;

import com.vn.productmanagement.model.Product;

import java.util.List;
import java.util.Optional;

public interface IProductService {
    List<Product> getAll();
    Optional<Product> findProductById(int id);
    boolean deleteProductById(int id);
    boolean isExistById(int id);
    void save(Product product);
}
