package com.vn;

import java.util.Date;
import java.util.List;


import com.vn.dao.CustomerDAO;
import com.vn.dao.ICustomerDAO;
import com.vn.model.Customer;


public class Main {
	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		
		ICustomerDAO customerDAO = new CustomerDAO();
		
		List<Customer> customers = customerDAO.fetchAll();
			
		customers.forEach(System.out::print);
	}
}
