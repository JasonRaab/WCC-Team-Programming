package com.wccnet.goodTimeBobbys.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.MenuItem;

@Repository
public class IngredientDAOImpl implements IIngredientDAO {

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	@Transactional
	public List<Ingredient> getIngredientListByMenuItemID(int menuItemID) {
		
			System.out.println("entering the method");
			Session session = sessionFactory.getCurrentSession();
		
			System.out.println("got the session");
			MenuItem menuItem = session.get(MenuItem.class, menuItemID);

			System.out.println("got the menuItem");
			List<Ingredient> listOfIngredients = menuItem.getIngredients();

			System.out.println("got the listOfIngredients");
			return listOfIngredients;
	}

}
