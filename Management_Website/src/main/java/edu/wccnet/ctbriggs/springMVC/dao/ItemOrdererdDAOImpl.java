package edu.wccnet.ctbriggs.springMVC.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.wccnet.ctbriggs.springMVC.domain.IngredientItem;
import edu.wccnet.ctbriggs.springMVC.domain.ItemOrdered;
import edu.wccnet.ctbriggs.springMVC.domain.Order;

@Repository
public class ItemOrdererdDAOImpl implements ItemOrderedDAO {
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Integer> getNumberOfItems(int order_id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Order order = session.get(Order.class, order_id);
		Query<Integer> query = session.createQuery("Select DISTINCT itemNumber From ItemOrdered Where order = :order order by itemNumber", Integer.class);
		query.setParameter("order", order);
		return query.getResultList();
	}

	@Override
	public List<ItemOrdered> getModifications(int order_id, int itemNumber) {
		Session session = sessionFactory.getCurrentSession();
		Order order = session.get(Order.class, order_id);
		Query<ItemOrdered> query = session.createQuery("From ItemOrdered Where order = :order AND itemNumber = :itemNumber", ItemOrdered.class);
		query.setParameter("itemNumber", itemNumber);
		query.setParameter("order", order);
		return query.getResultList();
	}

	@Override
	public List<ItemOrdered> getAllOrders() {
		Session session = sessionFactory.getCurrentSession();
		Query<ItemOrdered> query = session.createQuery("From ItemOrdered", ItemOrdered.class);
		return query.getResultList();
	}

}
