package edu.wccnet.ctbriggs.springMVC.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.wccnet.ctbriggs.springMVC.domain.Address;
import edu.wccnet.ctbriggs.springMVC.domain.User;

@Repository
public class AddressDAOImpl implements AddressDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Address getAddress(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Address.class, id);
	}
	
	@Override
	public void saveAddress(Address address) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(address);
	}
}
