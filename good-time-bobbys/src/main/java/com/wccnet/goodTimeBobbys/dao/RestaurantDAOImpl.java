package com.wccnet.goodTimeBobbys.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.hibernate.query.criteria.HibernateCriteriaBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<User> getUsers() {
		Session session = sessionFactory.getCurrentSession();
		Query<User> query = session.createQuery("from User", User.class);
		System.out.println("smelly IMPLEMENTION");
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public List<Address> getAddress() {
		Session session = sessionFactory.getCurrentSession();
		Query<Address> query = session.createQuery("from Address", Address.class);
		System.out.println("smelly IMPLEMENTION");
		return query.getResultList();
	}
	
	//I think we need to allow for a way to return a User and an Address in our result set so we can then access the 
	//User information along with the Address... Its worth noting that we COULD just pass in the userId and then 
	//SOMEHOW filter by it in the result set.

//	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Address> getUserAddress(){
		
		Session session = sessionFactory.getCurrentSession();
		//Query<Address> query = session.createQuery("from UserAddress ua Address a where ua.userId = 1004", Address.class);
		
		
		//Query<User> userQuery = session.createQuery("from UserAddress ua, Address a where ua.userId = 1004", User.class);
		Query<Address> query = session.createQuery("from Address a, User u where u.userId = 1004", Address.class);
		
		//List<User> list = userQuery.getResultList();
//		System.out.println(list);
//		System.out.println(query);
		
		return query.getResultList();
//		String sql = "select a.street_address, a.city, a.state, a.zip "
//				+ "	from user_address ua "
//				+ "	inner join address a on a.address_id = ua.address_id "
//				+ "	where ua.user_id = 1004;";
		
//		try {
//		NativeQuery<Address> query = session.createSQLQuery(sql);
//		
//		List<Address> result = query.getResultList();
//		return result;
//		
//		//Query<Address> query = session.createQuery("from UserAddress as ua inner join ua.address_id", Address.class);
//		} catch(Exception e){
//			e.printStackTrace();
//			return null;
//		}
	}

	@Override
	@Transactional
	public List<MenuItem> getMenuItems() {
		// TODO Auto-generated method stub
		return null;
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
		Query<Ingredient> query = session.createQuery("from Ingredient where ingredient_category = 'mexican'", Ingredient.class);
		System.out.println("in impl getFILTERED INGR()");
		return query.getResultList();
	}
	


	
}































