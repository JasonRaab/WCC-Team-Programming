package edu.wccnet.ctbriggs.springMVC.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.wccnet.ctbriggs.springMVC.domain.MenuItem;

@Repository
public class MenuDAOImpl implements MenuDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<MenuItem> getMenu() {
		Session session = sessionFactory.getCurrentSession();
		Query<MenuItem> query = session.createQuery("from MenuItem where isActive = 1 order by name", MenuItem.class);
		return query.getResultList();
	}

	@Override
	public void save(MenuItem newMenuItem) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(newMenuItem);
		
	}

	@Override
	public void updateStock(int id, int count) {
		Session session = sessionFactory.getCurrentSession();
		MenuItem item = session.get(MenuItem.class, id);
		item.setStock(count);
		session.saveOrUpdate(item);
		
	}

	@Override
	public List<MenuItem> getInactiveMenu() {
		Session session = sessionFactory.getCurrentSession();
		Query<MenuItem> query = session.createQuery("from MenuItem where isActive = 0 order by name", MenuItem.class);
		return query.getResultList();
	}

	@Override
	public MenuItem getMenuItem(int id) {
		Session session = sessionFactory.getCurrentSession();
		MenuItem item = session.get(MenuItem.class, id);
		return item;
	}

	@Override
	public void deactivate(int id) {
		Session session = sessionFactory.getCurrentSession();
		MenuItem item = session.get(MenuItem.class, id);
		item.setIsActive(0);
		session.saveOrUpdate(item);
		
	}

	@Override
	public void activate(int id) {
		Session session = sessionFactory.getCurrentSession();
		MenuItem item = session.get(MenuItem.class, id);
		item.setIsActive(1);
		session.saveOrUpdate(item);
		
	}

}
