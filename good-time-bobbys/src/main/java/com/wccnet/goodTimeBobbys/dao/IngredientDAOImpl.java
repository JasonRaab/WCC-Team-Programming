package com.wccnet.goodTimeBobbys.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.ItemOrdered;
import com.wccnet.goodTimeBobbys.entity.MenuItem;
import com.wccnet.goodTimeBobbys.entity.OrderInfo;
import com.wccnet.goodTimeBobbys.entity.OrderListCreator;

@Repository
public class IngredientDAOImpl implements IIngredientDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private OrderListCreator orderlistCreator;

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

	@Override
	@Transactional
	public Set<Integer> getDefaultIngredientIDs(int menuItemID) {

		Session session = sessionFactory.getCurrentSession();
		MenuItem menuItem = session.get(MenuItem.class, menuItemID);

		List<Ingredient> listOfIngredients = menuItem.getIngredients();

		Set<Integer> setOfDefaultIngredientIds = new HashSet<>();

		for (Ingredient ingredient : listOfIngredients) {
			if (ingredient.getIsActive() == 1) {
				setOfDefaultIngredientIds.add(ingredient.getIngredientId());
			}
		}
		return setOfDefaultIngredientIds;
	}

	public int compareDefaultAndChosenIngredients(int menuItemID) {
		// Gets all possible Ingredients
		List<Ingredient> listOfIngredients = getAllIngredients();

		// Will be set as all ID's of possible Ingredients
		Set<Integer> allIngredientIds = new HashSet<>();

		Set<Integer> modifiedIngredientsList = orderlistCreator.getModifiedIngredientIdSet();
		// Adds all possible IngredientID's to a Set of Integer called
		// 'allIngredientIds'
		for (Ingredient ingredient : listOfIngredients) {
			if (ingredient.getIsActive() == 1) {
				allIngredientIds.add(ingredient.getIngredientId());
			}
		}

		// Will be set as menuItem's default IngredientId's
		Set<Integer> defaultIngredientIds = getDefaultIngredientIDs(menuItemID);


		return 1;
	}

	@Transactional
	public void createOrderInfo(int userID, double subtotal, int orderId, int itemNumber, int menuItemID,
			int ingredientID, int isAdded) {
		Session session = sessionFactory.getCurrentSession();
		Date now = new Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentTime = sdf.format(now);
		double tax = (subtotal * 1.06);
		double total = (subtotal + tax);

		OrderInfo order = new OrderInfo(userID, currentTime, subtotal, tax, total);
		session.persist(order);
	}

	@Override
	@Transactional
	public List<Ingredient> getAllIngredients() {

		Session session = sessionFactory.getCurrentSession();

		Query<Ingredient> query = session.createQuery("from Ingredient", Ingredient.class);

		return query.getResultList();
	}

	@Override
	@Transactional
	public Ingredient getIngredientByID(int ingredientID) {

		Session session = sessionFactory.getCurrentSession();
		Query<Ingredient> query = session
				.createQuery("from Ingredient i where i.ingredientId = :ingredientID", Ingredient.class)
				.setParameter("ingredientID", ingredientID);

		return query.getSingleResult();
	}

	@Override
	@Transactional
	public String getIngredientNameByID(int ingredientID) {

		Session session = sessionFactory.getCurrentSession();

		Ingredient ingredient = session.get(Ingredient.class, ingredientID);
		String ingredientName = ingredient.getIngredientName();

		System.out.println(ingredientName);

		return ingredientName;
	}
	
	@Override
	@Transactional
	public Double getIngredientPriceByID(int ingredientID) {
		
		Session session = sessionFactory.getCurrentSession();

		Ingredient ingredient = session.get(Ingredient.class, ingredientID);
		Double ingredientPrice = ingredient.getIngredientPrice();
		
		return ingredientPrice;
	}

}
