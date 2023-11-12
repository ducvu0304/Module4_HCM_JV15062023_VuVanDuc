package com.vn.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vn.dao.CustomerDAO;
import com.vn.dao.ICustomerDAO;
import com.vn.model.Customer;

@WebServlet(urlPatterns = "/")
public class CustomerServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ICustomerDAO customerDAO;
	
	@Override
	public void init() throws ServletException {
		customerDAO = new CustomerDAO();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Customer> customers = new ArrayList<>() ;
		customers= customerDAO.fetchAll();
		
		req.setAttribute("customers", customers);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsps");
		dispatcher.forward(req, resp);
	}

	@Override
	public void destroy() {
	}
}
