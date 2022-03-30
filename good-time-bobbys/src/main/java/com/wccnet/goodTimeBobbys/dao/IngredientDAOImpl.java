package com.wccnet.goodTimeBobbys.dao;

import java.util.ArrayList;
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
		
			Session session = sessionFactory.getCurrentSession();
		
			MenuItem menuItem = session.get(MenuItem.class, menuItemID);

			List<Ingredient> listOfIngredients = menuItem.getIngredients();
			List<Ingredient> activeIngredients = new ArrayList<>();
			
			for (Ingredient ingredient : listOfIngredients) {
				if (ingredient.getIsActive() == 1) {
					activeIngredients.add(ingredient);
				}
			}
			
			return activeIngredients;
	}

	
	
}
