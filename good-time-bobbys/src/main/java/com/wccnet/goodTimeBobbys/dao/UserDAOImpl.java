package com.wccnet.goodTimeBobbys.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	@Transactional
	public Integer getUserByEmailAndPassword(String userEmail, String password) {
		System.out.println("userEmail and password that is passed in: " + userEmail + " " + password);
		Session session = sessionFactory.getCurrentSession();
		Query<User> query = session
				.createQuery("from User u where u.email = :userEmail AND u.password = :password", User.class)
				.setParameter("userEmail", userEmail).setParameter("password", password);
		List<User> results = query.getResultList();

		System.out.println("after query in UserDAO");
		if ((results != null) && (results.size() > 0)) {
			User user = query.getSingleResult();
			Integer userIdInteger = user.getUserId();
			return userIdInteger;
		}

		return -1;
	}

	@Override
	@Transactional
	public void saveUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(user);
	}

}
