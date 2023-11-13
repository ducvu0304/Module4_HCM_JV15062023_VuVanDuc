package com.vn.productmanagement.service;

import com.vn.productmanagement.model.Product;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductService implements IProductService{
    private static List<Product> list = new ArrayList<>();
    public ProductService(){
        Product product = new Product("METASPEED EDGE", 1500, new Date(2023,11,13), "https://storage.sg.content-cdn.io/cdn-cgi/image/width=285,height=215,quality=75,format=auto,fit=cover,g=top/in-resources/92ab8ec8-2216-4f1c-8333-c10c5e7d01c9/Images/ProductImages/Source/1013A116_700_0020044581_RT_Large.jpg");
        Product product1 = new Product("GEL-KAYANO 30", 1470, new Date(2023,11,13), "https://storage.sg.content-cdn.io/cdn-cgi/image/width=285,height=215,quality=75,format=auto,fit=cover,g=top/in-resources/92ab8ec8-2216-4f1c-8333-c10c5e7d01c9/Images/ProductImages/Source/1011B690_003_0020050016_RT_Large.jpg");
        Product product2 = new Product("VERSABLAST", 1000, new Date(2023,11,13), "https://storage.sg.content-cdn.io/cdn-cgi/image/width=285,height=215,quality=75,format=auto,fit=cover,g=top/in-resources/92ab8ec8-2216-4f1c-8333-c10c5e7d01c9/Images/ProductImages/Source/1011B334_404_0020036648_RT_Large.jpg");
        list.add(product);
        list.add(product1);
        list.add(product2);
    }

    @Override
    public List<Product> getAll() {
        return list;
    }

    @Override
    public Product findProductById(int id) {
        if (!list.isEmpty()) {
            for (Product product: list) {
                if (product.getId() == id){
                    return product;
                }
            }
        }
        return null;
    }

    @Override
    public boolean deleteProductById(int id) {
        if (!list.isEmpty()) {
            for (Product product: list) {
                if (product.getId() == id){
                    list.remove(product);
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    public boolean isExistById(int id) {
        if (!list.isEmpty()) {
            for (Product product: list) {
                if (product.getId() == id){
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    public boolean createProduct(Product product) {
        if (product != null) {
            list.add(product);
            return true;
        }
        return false;
    }
}
