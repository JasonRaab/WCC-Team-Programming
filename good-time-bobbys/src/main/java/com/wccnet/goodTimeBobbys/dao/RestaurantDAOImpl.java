package com.wccnet.goodTimeBobbys.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.MenuItem;
import com.wccnet.goodTimeBobbys.entity.OrderInfo;

@Repository
public class RestaurantDAOImpl implements IRestaurantDAO {

	@Autowired
	private SessionFactory sessionFactory;

	// private MenuItem menuItem;

	@Override
	@Transactional
	public List<MenuItem> getMenuItems() {
		Session session = sessionFactory.getCurrentSession();
		Query<MenuItem> menuItems = session.createQuery("from MenuItem mi where mi.isActive = 1 AND mi.itemStock > 0",
				MenuItem.class);

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
		Query<Ingredient> query = session.createQuery("from Ingredient i where i.isActive = 1", Ingredient.class);
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
		return query.getResultList();
	}

	@Override
	@Transactional
	public void saveOrder(OrderInfo order) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(order);
	}

	@Override
	@Transactional
	public OrderInfo getOrderInfoByID(int orderID) {
		Session session = sessionFactory.getCurrentSession();
		Query<OrderInfo> query = session.createQuery("from OrderInfo oi where orderId = :orderID", OrderInfo.class)
				.setParameter("orderID", orderID);

		return query.getSingleResult();
	}

	@Override
	@Transactional
	public List<MenuItem> getMenuItemByMenuItemID(ArrayList<Integer> menuItemID) {
		Session session = sessionFactory.getCurrentSession();
		Query<MenuItem> query = session.createQuery("from MenuItem mi where itemId = :menuItemID", MenuItem.class)
				.setParameter("menuItemID", menuItemID);
		return query.getResultList();
	}

	@Override
	@Transactional
	public List<Double> getMenuItemPriceByID(Integer menuItemID) {
		Session session = sessionFactory.getCurrentSession();
		Query<MenuItem> query = session
				.createQuery("select mi.itemPrice from MenuItem mi where itemId = :menuItemID", MenuItem.class)
				.setParameter("menuItemID", menuItemID);
		List<MenuItem> list = query.getResultList();
		ArrayList<Double> priceList = new ArrayList<>();
		for (MenuItem menuItem : list) {
			priceList.add((Double) menuItem.getItemPrice());
		}
		return priceList;
	}

	@Override
	@Transactional
	public Session closeSession() {
		Session session = sessionFactory.getCurrentSession();
		System.out.println(session);
		if (session.isOpen()) {
			session.flush();
			session.clear();
			Session newSession = sessionFactory.openSession();
			newSession = sessionFactory.getCurrentSession();
			System.out.println(newSession);
			return newSession;
		} else {
			return session;
		}
	}
}
