package com.wccnet.goodTimeBobbys.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		Query<MenuItem> menuItems = session.createQuery("from MenuItem mi where mi.isActive = 1", MenuItem.class);

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
		System.out.println("in impl getFILTERED INGR()");
		return query.getResultList();
	}

	// Get MenuItem Ingredients by Menu Item ID
//	@Override
//	@Transactional
//	public List<Ingredient> getMenuItemIngredientsByMenuItemID(int menuItemID){
//		
//		Session session = sessionFactory.getCurrentSession();
//		menuItem = session.get(MenuItem.class, menuItemID);
//		return menuItem.getIngredients();
//	}
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
		Query<OrderInfo> query = session.createQuery("from OrderInfo oi where orderId = :orderID", OrderInfo.class).setParameter("orderID", orderID);
		
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


}

//@Override
//@Transactional
//public List<User> getUsers() {
//	Session session = sessionFactory.getCurrentSession();
//	Query<User> query = session.createQuery("from User", User.class);
//	System.out.println("smelly IMPLEMENTION");
//	return query.getResultList();
//}

//@Override
//@Transactional
//public List<Address> getAddress() {
//	Session session = sessionFactory.getCurrentSession();
//	Query<Address> query = session.createQuery("from Address", Address.class);
//	System.out.println("smelly IMPLEMENTION");
//	return query.getResultList();
//}

// I think we need to allow for a way to return a User and an Address in our
// result set so we can then access the
// User information along with the Address... Its worth noting that we COULD
// just pass in the userId and then
// SOMEHOW filter by it in the result set.

//@SuppressWarnings("deprecation")
//@Override
//@Transactional
//public List<Address> getUserAddress() {
//
//	Session session = sessionFactory.getCurrentSession();
//
//	Criteria crit = session.createCriteria(User.class);
//	crit.createAlias("addresses", "addressesAlias");
//	crit.add(Restrictions.ilike("addressesAlias.streetAddress", "Hell"));
//	List<Address> results = crit.list();
//	
//	for (Address smellyAddress : results) {
//		System.out.println(smellyAddress);
//	}
//
//	return results;

//	
//	System.out.println("after create Alias");
//	for (int i = 0; i < 100; i++) {
//		System.out.println("in the for loop hehe");
//	}
//	
//	@SuppressWarnings("unchecked")
//	List<Address> userAddress = (List<Address>) crit;
//	for (Address smellyAddress : userAddress) {
//		System.out.println(smellyAddress);
//	}

//	Query<Address> query = session.createQuery("from Address a inner join a.users u where u.userId = 1004", Address.class);
//	System.out.println("blah blah blah");
//	List<Address> fuck =  query.getResultList();
//	System.out.println("your mom");

// Query<Address> query = session.createQuery("from UserAddress ua Address a
// where ua.userId = 1004", Address.class);
// User user = new User();

// List<Address> userAddresses = user.getAddresses();

// Query<User> userQuery = session.createQuery("from UserAddress ua, Address a
// where ua.userId = 1004", User.class);
// Query<Address> query = session.createQuery("from Address a, User u where
// u.userId = 1004", Address.class);
//	Query<Address> query = session.createQuery("select a.streetAddress, a.city, a.state, a.zip from UserAddress ua inner join ua.addressId a where userId = 1004", Address.class);
// @SuppressWarnings("unchecked")
// List<Object[]> list = query.list();

//	for(Object[] arr : list) {
//		System.out.println(Arrays.toString(arr));
//	}
// List<User> list = userQuery.getResultList();
//	System.out.println(list);
//	System.out.println(query);
//	return query.getResultList();

// return query.getResultList();
//	String sql = "select a.street_address, a.city, a.state, a.zip "
//			+ "	from user_address ua "
//			+ "	inner join address a on a.address_id = ua.address_id "
//			+ "	where ua.user_id = 1004;";

//	try {
//	NativeQuery<Address> query = session.createSQLQuery(sql);
//	
//	List<Address> result = query.getResultList();
//	return result;
//	
//	//Query<Address> query = session.createQuery("from UserAddress as ua inner join ua.address_id", Address.class);
//	} catch(Exception e){
//		e.printStackTrace();
//		return null;
//	}
//}
