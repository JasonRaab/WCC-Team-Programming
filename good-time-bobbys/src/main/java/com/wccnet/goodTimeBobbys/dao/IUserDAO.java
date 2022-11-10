package com.wccnet.goodTimeBobbys.dao;

import java.util.List;

import com.wccnet.goodTimeBobbys.entity.Address;
import com.wccnet.goodTimeBobbys.entity.User;

public interface IUserDAO {

	public User getUserByID(int userId);

	public List<Address> getAddress();

	public List<User> getUsers();

	public Integer getUserByEmailAndPassword(String userEmail, String password);

	public void saveUser(User user);
}
