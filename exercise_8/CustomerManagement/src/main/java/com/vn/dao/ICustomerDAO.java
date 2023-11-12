package com.vn.dao;

import java.util.List;

import com.vn.model.Customer;

public interface ICustomerDAO {
	List<Customer> fetchAll();
}
