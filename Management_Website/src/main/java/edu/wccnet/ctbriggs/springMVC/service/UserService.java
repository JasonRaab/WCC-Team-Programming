package edu.wccnet.ctbriggs.springMVC.service;

import java.util.List;

import edu.wccnet.ctbriggs.springMVC.domain.User;

public interface UserService {
	public List<User> getUsers();
	public List<User> getEmployees();
	public User getUser(int id);
}
