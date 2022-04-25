package edu.wccnet.goodTimeBobbys.management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.wccnet.goodTimeBobbys.management.dao.UserDAO;
import edu.wccnet.goodTimeBobbys.management.entity.User;

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

	@Override
	@Transactional
	public User getUser(int id) {
		return userDAO.getUser(id);
	}

	@Override
	@Transactional
	public void saveUser(User user) {
		userDAO.saveUser(user);
	}

	@Override
	@Transactional
	public List<User> getPreviousEmployees() {
		return userDAO.getPreviousEmployees();
	}

}
