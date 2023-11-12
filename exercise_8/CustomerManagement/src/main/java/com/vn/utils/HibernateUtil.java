package com.vn.utils;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	private static final SessionFactory SESSION_FACTORY = getSessionFactory1();
	
	@SuppressWarnings("deprecation")
	private static SessionFactory getSessionFactory1() {
		try {
			 // We need to create the SessionFactory from 
            // hibernate.cfg.xml 
			return new Configuration().configure().buildSessionFactory();
		}catch (Exception e) {
			 // Make sure you log the exception, as it might 
            // be swallowed 
            // In case of any exception, it has to be 
            // indicated here 
			System.out.println("SessionFactory creation failed." + e); 		
			throw new ExceptionInInitializerError(e);
		}
	}
	
	public static SessionFactory getSessionFactory() {
		return SESSION_FACTORY;
	}
	
	public static void shutdown() {
		getSessionFactory1().close();
	}
}	

