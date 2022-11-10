package com.wccnet.goodTimeBobbys.dao;

import java.util.ArrayList;
import java.util.List;

import com.wccnet.goodTimeBobbys.entity.MenuItem;

public interface IMenu {

	public List<MenuItem> getMenuItems();
	
	public MenuItem getMenuItemByID(int menuItemID);

	public List<MenuItem> getMenuItemByCategory(String string);
	
	public List<MenuItem> getMenuItemByMenuItemID(ArrayList<Integer> menuItemID);

}
