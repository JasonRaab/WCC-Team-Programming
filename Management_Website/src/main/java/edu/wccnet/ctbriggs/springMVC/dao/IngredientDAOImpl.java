package edu.wccnet.ctbriggs.springMVC.dao;

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

}
