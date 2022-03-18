package com.wccnet.goodTimeBobbys.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wccnet.goodTimeBobbys.entity.Address;
import com.wccnet.goodTimeBobbys.entity.User;

@Repository
public class UserDAOImpl implements IUserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public User getUserByID(int userId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(User.class, userId);
	}

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
}
