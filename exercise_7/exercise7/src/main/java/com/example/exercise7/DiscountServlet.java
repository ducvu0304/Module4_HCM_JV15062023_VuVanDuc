package com.example.exercise7;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DiscountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        double listPrice = Double.parseDouble(request.getParameter("listPrice"));
        double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));

        double discountAmount = listPrice * discountPercent * 0.01;
        double discountPrice = listPrice - discountAmount;

        // Hiển thị kết quả
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><head><title>Discount Result</title></head><body>");
        out.println("<h1>Discount Result</h1>");
        out.println("<p><strong>Discount Amount:</strong> " + discountAmount + "</p>");
        out.println("<p><strong>Discount Price:</strong> " + discountPrice + "</p>");
        out.println("</body></html>");
    }
}