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
		Query<MenuItem> query = session.createQuery("from MenuItem order by name", MenuItem.class);
		return query.getResultList();
	}

}
