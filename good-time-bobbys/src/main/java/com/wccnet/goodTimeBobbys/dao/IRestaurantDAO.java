package com.wccnet.goodTimeBobbys.dao;

import java.util.List;

import com.wccnet.goodTimeBobbys.entity.Address;
import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.MenuItem;
import com.wccnet.goodTimeBobbys.entity.User;

public interface IRestaurantDAO {

	public List<User> getUsers();
	
	public List<MenuItem> getMenuItems();
	
	public List<Ingredient> getIngredient(); //List Ingredients in ingredient Table
	
	public List<Ingredient> getMenuItemIngredients(); //List Ingredients for specific MenuItem - will this just be a list of String?
	
	public List<Address> getAddress();
}
