package com.vn.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.vn.model.Customer;
import com.vn.utils.HibernateUtil;

public class CustomerDAO implements ICustomerDAO {

	@SuppressWarnings("deprecation")
	@Override
	public List<Customer> fetchAll() {
		List<Customer> customersList = new ArrayList<>();
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session =  sessionFactory.openSession();
		
		Transaction tx = null;
		
		try {	
			tx =  session.beginTransaction();
			Criteria criteria = session.createCriteria(Customer.class);
			
			customersList = criteria.list();
			
			tx.commit();
		}catch (Exception e) {
			 if (tx != null)
	            tx.rollback();
	            e.printStackTrace();
		}finally {
	
			session.close();
		}
		
		return customersList;
	}

}
