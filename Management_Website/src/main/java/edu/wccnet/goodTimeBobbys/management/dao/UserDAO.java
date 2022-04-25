package edu.wccnet.goodTimeBobbys.management.dao;

import java.util.List;

import edu.wccnet.goodTimeBobbys.management.entity.User;

public interface UserDAO {
	public List<User> getUsers();
	public List<User> getEmployees();
	public void saveUser(User user);
	public User getUser(int id);
	public List<User> getPreviousEmployees();
}
