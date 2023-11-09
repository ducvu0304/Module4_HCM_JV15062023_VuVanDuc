package com.example.random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "generateArray", value = "/generateArray")
public class GenerateArrayServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int[] numbers = generateRandomArray(20, 1, 100);
        request.setAttribute("numbers", numbers);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    private int[] generateRandomArray(int length, int min, int max) {
        int[] array = new int[length];
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            array[i] = random.nextInt(max - min + 1) + min;
        }
        return array;
    }
}