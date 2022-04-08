package edu.wccnet.ctbriggs.springMVC.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.wccnet.ctbriggs.springMVC.domain.IngredientItem;

@Repository
public class IngredientDAOImpl implements IngredientDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<IngredientItem> getIngredients() {
		Session session = sessionFactory.getCurrentSession();
		Query<IngredientItem> query = session.createQuery("from IngredientItem order by name", IngredientItem.class);
		return query.getResultList();
	}

	@Override
	public void add(IngredientItem newIngredient) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(newIngredient);
		
	}

	@Override
	public IngredientItem getIngredient(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(IngredientItem.class, id);
	}

	//tbh this is sketchy but works
	@Override
	public List<String> getCategories() {
		Session session = sessionFactory.getCurrentSession();
		Query<Object> query = session.createQuery("Select DISTINCT category from IngredientItem order by category", Object.class);
		List<Object> results = query.getResultList();
		List<String> stringResults = new ArrayList<String>();
		for(Object o :results) {
			stringResults.add(o.toString());
		}
		return stringResults;
	}

	@Override
	public List<IngredientItem> getIngredients(String category) {
		Session session = sessionFactory.getCurrentSession();
		Query<IngredientItem> query = session.createQuery("from IngredientItem where category = :category order by name", IngredientItem.class);
		query.setParameter("category", category);
		return query.getResultList();
	}

	@Override
	public void updateStock(int id, int count) {
		Session session = sessionFactory.getCurrentSession();
		IngredientItem ingredient = session.get(IngredientItem.class, id);
		ingredient.setStock(count);
		session.saveOrUpdate(ingredient);
		
	}

}