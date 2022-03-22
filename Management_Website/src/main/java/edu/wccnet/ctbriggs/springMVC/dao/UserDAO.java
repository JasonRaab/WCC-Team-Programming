package edu.wccnet.ctbriggs.springMVC.dao;

import java.util.List;

import edu.wccnet.ctbriggs.springMVC.domain.User;

public interface UserDAO {
	public List<User> getUsers();
}
