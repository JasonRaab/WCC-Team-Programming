package com.wccnet.goodTimeBobbys.dao;

import java.util.List;

import com.wccnet.goodTimeBobbys.entity.Address;
import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.MenuItem;
import com.wccnet.goodTimeBobbys.entity.User;

public interface IRestaurantDAO {

//	public List<User> getUsers();
	
	public List<MenuItem> getMenuItems();
	
	public List<Ingredient> getIngredient(); //List Ingredients in ingredient Table
	
	public MenuItem getMenuItemByID(int menuItemID);

	public List<Ingredient> getMenuItemIngredientsByMenuItemID(int menuItemID);

	public List<Ingredient> getIngredientsByIngredientCategory(String category);
	
//	public List<Address> getAddress();
	
//	public List<Address> getUserAddress();
}