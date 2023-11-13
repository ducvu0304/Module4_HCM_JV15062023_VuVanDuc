package com.vn.productmanagement.controller;

import com.vn.productmanagement.model.Product;
import com.vn.productmanagement.service.IProductService;
import com.vn.productmanagement.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet(name="Product", value="/Product")
public class ProductController extends HttpServlet {
    private static final IProductService PRODUCT_SERVICE = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action != null) {
            switch (action) {
                case "FINDALL" :
                    showListProduct(PRODUCT_SERVICE.getAll(), req, resp);
                    break;
                case "ADD":
                    req.getRequestDispatcher("/WEB-INF/views/product/add-product.jsp").forward(req,resp);
                    break;
                case "EDIT":
                    int idEdit = Integer.parseInt(req.getParameter("id"));
                    Optional<Product> optionalCustomer = PRODUCT_SERVICE.findProductById(idEdit);
                    optionalCustomer.ifPresent(product -> {
                        req.setAttribute("product", product);
                        try {
                            req.getRequestDispatcher("/WEB-INF/views/product/edit-product.jsp").forward(req,resp);
                        } catch (ServletException | IOException e) {
                            throw new RuntimeException(e);
                        }
                    });
                case "DELETE":
                    int productId = Integer.parseInt(req.getParameter("id"));
                    PRODUCT_SERVICE.deleteProductById(productId);
                    showListProduct(PRODUCT_SERVICE.getAll(),req,resp);
                    break;
                default:
                    System.out.println("error");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String action = req.getParameter("action");
        if (action == null){
            req.getRequestDispatcher("/WEB-INF/views/404.jsp").forward(req,resp);
        }else {
            switch (action){
                case "ADD":
                case "UPDATE":
                    // lấy ra toàn bộ thông in nhập vào
                    String newName  = req.getParameter("name");
                    String price  = req.getParameter("price");
                    String description  = req.getParameter("description");


                    Product product = new Product(PRODUCT_SERVICE.getAll().size(), newName, Double.parseDouble(price),description);
                    PRODUCT_SERVICE.save(product);
                    showListProduct(PRODUCT_SERVICE.getAll(),req,resp);
                    break;
            }
        }
    }

    protected void showListProduct (List<Product> list , HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setAttribute("list",list);
        req.getRequestDispatcher("/WEB-INF/views/product/list-product.jsp").forward(req,res);
    }

}
