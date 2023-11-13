package com.vn.productmanagement.model;

import java.util.Date;

public class Product {
    private static int count = 1;
    private int id;
    private String name;
    private double price;

    private Date importDate;
    private String description;
    private String img;

    public Product() {
    }

    public Product(String name, double price, Date importDate, String img) {
        this.id = count++;
        this.name = name;
        this.price = price;
        this.importDate = importDate;
        this.img = img;
    }

    public Product(int id, String name, double price, String description) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
    }

    public static int getCount() {
        return count;
    }

    public static void setCount(int count) {
        Product.count = count;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getImportDate() {
        return importDate;
    }

    public void setImportDate(Date importDate) {
        this.importDate = importDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", importDate=" + importDate +
                ", description='" + description + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
