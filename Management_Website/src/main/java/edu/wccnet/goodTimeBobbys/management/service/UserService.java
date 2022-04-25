package edu.wccnet.goodTimeBobbys.management.service;

import java.util.List;

import edu.wccnet.goodTimeBobbys.management.entity.User;

public interface UserService {
	public List<User> getUsers();
	public List<User> getEmployees();
	public void saveUser(User user);
	public User getUser(int id);
	public List<User> getPreviousEmployees();
}
