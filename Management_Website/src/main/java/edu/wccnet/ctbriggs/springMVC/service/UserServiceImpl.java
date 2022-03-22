package edu.wccnet.ctbriggs.springMVC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.wccnet.ctbriggs.springMVC.dao.UserDAO;
import edu.wccnet.ctbriggs.springMVC.domain.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;
	
	@Override
	@Transactional
	public List<User> getUsers() {
		return userDAO.getUsers();
	}

	@Override
	@Transactional
	public List<User> getEmployees() {
		return userDAO.getEmployees();
	}

}
