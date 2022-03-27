package edu.wccnet.ctbriggs.springMVC.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.wccnet.ctbriggs.springMVC.domain.User;


@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired // automatically finds sessionFactory bean that has already been set up
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<User> getUsers() {
		Session session = sessionFactory.getCurrentSession();
		Query<User> query = session.createQuery("from User order by firstName", User.class);
		return query.getResultList();
	}


	@Override
	public List<User> getEmployees() {
		Session session = sessionFactory.getCurrentSession();
		Query<User> query = session.createQuery("from User where id = 3 order by firstName", User.class);	//id 3 is marked as employee
		return query.getResultList();
	}


	@Override
	public User getUser(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(User.class, id);
	}


	@Override
	public void saveUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(user);
	}

}
