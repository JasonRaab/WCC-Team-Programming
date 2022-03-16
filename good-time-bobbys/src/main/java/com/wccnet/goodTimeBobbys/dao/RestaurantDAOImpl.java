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


	@Override
	@Transactional
	public List<MenuItem> getMenuItems() {
		Session session = sessionFactory.getCurrentSession();
		Query<MenuItem> menuItems = session.createQuery("from MenuItem where itemId = 7", MenuItem.class);
		return menuItems.getResultList();

	}

	@Override
	@Transactional
	public List<Ingredient> getIngredient() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query<Ingredient> query = session.createQuery("from Ingredient", Ingredient.class);
		System.out.println("in impl getIngredient()");
		return query.getResultList();
	}

	@Override
	@Transactional
	public List<Ingredient> getMenuItemIngredients() {

		Session session = sessionFactory.getCurrentSession();
		Query<Ingredient> query = session.createQuery("from Ingredient where ingredient_category = 'appetizer'",
				Ingredient.class);
		System.out.println("in impl getFILTERED INGR()");
		return query.getResultList();
	}


}