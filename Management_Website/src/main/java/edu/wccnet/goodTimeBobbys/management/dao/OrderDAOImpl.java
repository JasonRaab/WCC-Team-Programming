package edu.wccnet.goodTimeBobbys.management.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.wccnet.goodTimeBobbys.management.entity.Order;
import edu.wccnet.goodTimeBobbys.management.entity.User;

@Repository
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Order> getOrders() {
		Session session = sessionFactory.getCurrentSession();
		Query<Order> query = session.createQuery("from Order where isOpen = 1", Order.class);
		return query.getResultList();
	}

	@Override
	public Order getOrder(int id) {;
		Session session = sessionFactory.getCurrentSession();
		Order order = session.get(Order.class, id);
		return order;
	}

	@Override
	public void completeOrder(int id) {
		Session session = sessionFactory.getCurrentSession();
		Order order = session.get(Order.class, id);
		order.setIsOpen(0);
		session.saveOrUpdate(order);
	}
	@Override
	public void openOrder(int id) {
		Session session = sessionFactory.getCurrentSession();
		Order order = session.get(Order.class, id);
		order.setIsOpen(1);
		session.saveOrUpdate(order);
	}

	@Override
	public List<Order> getCompletedOrders() {
		Session session = sessionFactory.getCurrentSession();
		Query<Order> query = session.createQuery("from Order where isOpen = 0", Order.class);
		return query.getResultList();
	}



}
