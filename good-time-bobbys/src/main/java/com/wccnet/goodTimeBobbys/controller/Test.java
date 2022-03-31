package com.wccnet.goodTimeBobbys.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.wccnet.goodTimeBobbys.entity.Address;
import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.MenuItem;
import com.wccnet.goodTimeBobbys.entity.OrderListCreator;
import com.wccnet.goodTimeBobbys.entity.User;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class)
				.addAnnotatedClass(Address.class).addAnnotatedClass(Ingredient.class).addAnnotatedClass(MenuItem.class)
				.buildSessionFactory();

		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();

		OrderListCreator olc = new OrderListCreator();
		

		Set<Integer> defaultIngredients = new HashSet<Integer>(olc.getDefaultIngredientIdList());
		Set<Integer> ingredientsFromModifyPage = new HashSet<Integer>(olc.getModifyIngredientIdList());

		for (Integer obj : defaultIngredients) {
			if (!ingredientsFromModifyPage.contains(obj)) {
				/* ... this object was removed ... */
			}
		}

		for (Integer obj : ingredientsFromModifyPage) {
			if (!defaultIngredients.contains(obj)) {
				/* ... this object was added ... */
			}
		}

//		System.out.println("in the main");
//
//		MenuItem menuItem = new MenuItem("Boneless Chicken Wings",
//				"Lightly breaded and tossed in BBQ, Buffalo or Nashville Hot sauce. Served with a choice of dipping sauce",
//				"Appetizer", 50, 8.39, 1);
//		Ingredient ingredientWings = new Ingredient("Boneless Chicken Wings", "Appetizer", 50, 3.00, 1);
//
//		session.persist(ingredientWings);
//		session.persist(menuItem);
//
//		System.out.println("trans has begun");
//
//		menuItem.addIngredient(ingredientWings);
//		System.out.println("ingredients for chicken wing appetizer added");
//		session.getTransaction().commit();
//
//		System.out.println("completed transaction");
//		

		// In the SQL Script to Add/Remove Ingredients from the MenuItem that is being
		// ordered - I think this is the ItemOrdered Table
		// Modification means:

		// null == no modification
		// True == Add Ingredient to the ItemOrdered
		// False == Remove Ingredient FROM the ItemOrdered

		// On the MODIFY page we need to: Collect the list of checked CheckBoxes

		// Pass the list to the final Checkout page - in that function do the following:

		// Iterate thru the list that is passed FROM the MODIFY page
		// Compare each IngredientID to the list of IngredientID's found in the
		// DefaultMenuItemIngredient table that is associated with the MenuItem in
		// question

		// If the IngredientID that is passed from the page matches an IngredientID in
		// the DefaultIngredient list then:
		// Do nothing

		// If the IngredientID that is passed FROM the MODIFY page does NOT match an
		// IngredientID in the DefaultIngredient list then:
		// Run the script to ADD the Ingredient TO the MenuItem

		// If there is an IngredientID that is in the DefaultMenuItemIngredient List AND
		// is not in the MODIFY page checkbox list then:
		// Run the scrript to remove that Ingredient from the MenuItem

		// for (Integer ingredient : ingredientIDs) {
		{
			// run remove from menuItem sql script
		}
		// run add to menuItem sql script

	}

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
}
