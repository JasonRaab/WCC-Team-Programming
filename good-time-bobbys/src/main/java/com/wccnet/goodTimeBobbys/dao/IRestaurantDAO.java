package com.wccnet.goodTimeBobbys.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.MenuItem;
import com.wccnet.goodTimeBobbys.entity.OrderInfo;

public interface IRestaurantDAO {

//	public List<User> getUsers();
	
	public List<MenuItem> getMenuItems();
	
	public List<Ingredient> getIngredient(); //List Ingredients in ingredient Table
	
	public MenuItem getMenuItemByID(int menuItemID);

//	public List<Ingredient> getMenuItemIngredientsByMenuItemID(int menuItemID);
	
	public List<MenuItem> getMenuItemByMenuItemID(ArrayList<Integer> menuItemID);

	public List<Ingredient> getIngredientsByIngredientCategory(String category);

	public List<MenuItem> getMenuItemByCategory(String string);

	public List<Double> getMenuItemPriceByID(Integer menuItemID);

	void saveOrder(OrderInfo order);

	public OrderInfo getOrderInfoByID(int orderID);

	public Session closeSession();

	//public void beginSession();
}