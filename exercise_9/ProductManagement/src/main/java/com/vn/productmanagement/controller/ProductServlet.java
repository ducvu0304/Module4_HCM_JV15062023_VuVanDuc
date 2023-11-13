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

@WebServlet(name="Product", value="/Product")
public class ProductServlet extends HttpServlet {
    private static final IProductService PRODUCT_SERVICE = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action != null) {
            switch (action) {
                case "FINDALL" :
                    showListProduct(PRODUCT_SERVICE.getAll(), req, resp);
                    break;
                default:
                    System.out.println("error");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    protected void showListProduct (List<Product> list , HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setAttribute("list",list);
        req.getRequestDispatcher("/WEB-INF/views/product/list-product.jsp").forward(req,res);
    }

}
