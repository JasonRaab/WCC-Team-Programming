package com.wccnet.goodTimeBobbys.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

<<<<<<< HEAD
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

=======
import com.mchange.v2.sql.filter.SynchronizedFilterDataSource;
import com.wccnet.goodTimeBobbys.entity.Address;
import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.MenuItem;
import com.wccnet.goodTimeBobbys.entity.User;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class)
				.addAnnotatedClass(Address.class).addAnnotatedClass(Ingredient.class).addAnnotatedClass(MenuItem.class)
				.buildSessionFactory();

		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();

		System.out.println("in the main");

		MenuItem menuItem = new MenuItem("Boneless Chicken Wings",
				"Lightly breaded and tossed in BBQ, Buffalo or Nashville Hot sauce. Served with a choice of dipping sauce",
				"Appetizer", 50, 8.39, 1);
		Ingredient ingredientWings = new Ingredient("Boneless Chicken Wings", "Appetizer", 50, 3.00, 1);

		session.persist(ingredientWings);
		session.persist(menuItem);

		System.out.println("trans has begun");

		menuItem.addIngredient(ingredientWings);
		System.out.println("ingredients for chicken wing appetizer added");
		session.getTransaction().commit();

		System.out.println("completed transaction");
//		User testUser = new User("Lucifer", "Devil", "satan@burning.org");
//		Address testAddress = new Address("666 Hell Ln", "Hell", "MI", "48666");
//		session.persist(testUser);
//		session.persist(testAddress);
//
//		

//		testUser.addAddress(testAddress);
//		System.out.println("address added");
//		
//		session.getTransaction().commit();
//		System.out.println("trans committed");
//		session.persist(testUser);
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
	}

}
