package com.vn.productmanagement.service;

import com.vn.productmanagement.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAll();
    Product findProductById(int id);
    boolean deleteProductById(int id);
    boolean isExistById(int id);
    boolean createProduct(Product product);
}
