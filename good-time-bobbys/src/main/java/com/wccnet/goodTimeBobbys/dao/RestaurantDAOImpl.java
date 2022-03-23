package com.wccnet.goodTimeBobbys.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wccnet.goodTimeBobbys.entity.Address;
import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.MenuItem;
import com.wccnet.goodTimeBobbys.entity.User;

@Repository
public class RestaurantDAOImpl implements IRestaurantDAO {

	@Autowired
	private SessionFactory sessionFactory;

	private MenuItem menuItem;

	@Override
	@Transactional
	public List<MenuItem> getMenuItems() {
		Session session = sessionFactory.getCurrentSession();
		Query<MenuItem> menuItems = session.createQuery("from MenuItem", MenuItem.class);
		return menuItems.getResultList();

	}

	@Override
	@Transactional
	public MenuItem getMenuItemByID(int menuItemID) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(MenuItem.class, menuItemID);

	}

	@Override
	@Transactional
	public List<MenuItem> getMenuItemByCategory(String category) {
		Session session = sessionFactory.getCurrentSession();
		Query<MenuItem> query = session
				.createQuery("from MenuItem where isActive = 1 AND itemCategory = :category", MenuItem.class)
				.setParameter("category", category);
		return query.getResultList();
	}

	// Get all ingredients from the ingredient table
	@Override
	@Transactional
	public List<Ingredient> getIngredient() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query<Ingredient> query = session.createQuery("from Ingredient", Ingredient.class);
		System.out.println("in impl getIngredient()");
		return query.getResultList();
	}

	// Get Ingredients by Ingredient Category
	@Override
	@Transactional
	public List<Ingredient> getIngredientsByIngredientCategory(String category) {

		Session session = sessionFactory.getCurrentSession();
		Query<Ingredient> query = session
				.createQuery("from Ingredient where ingredient_category = :category", Ingredient.class)
				.setParameter("category", category);
		System.out.println("in impl getFILTERED INGR()");
		return query.getResultList();
	}

	// Get MenuItem Ingredients by Menu Item ID
	@Override
	@Transactional
	public List<Ingredient> getMenuItemIngredientsByMenuItemID(int menuItemID) {

		Session session = sessionFactory.getCurrentSession();
		menuItem = session.get(MenuItem.class, menuItemID);
		return menuItem.getIngredients();
	}

}