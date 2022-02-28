package com.wccnet.goodTimeBobbys.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.wccnet.goodTimeBobbys.entity.Address;
import com.wccnet.goodTimeBobbys.entity.User;



public class Test {


	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).addAnnotatedClass(Address.class).buildSessionFactory();

		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		System.out.println("in the main");
		
		
		User testUser = new User("Lucifer", "Devil", "satan@burning.org");
		Address testAddress = new Address("666 Hell Ln", "Hell", "MI", "48666");
		session.persist(testUser);
		session.persist(testAddress);

		
		System.out.println("trans has begun");
		
		testUser.addAddress(testAddress);
		System.out.println("address added");
		
		session.getTransaction().commit();
		System.out.println("trans committed");
//		session.persist(testUser);

	}

}
