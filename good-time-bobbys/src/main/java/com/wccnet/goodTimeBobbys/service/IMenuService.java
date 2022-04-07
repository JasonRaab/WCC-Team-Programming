package com.wccnet.goodTimeBobbys.service;

import java.util.ArrayList;

import com.wccnet.goodTimeBobbys.entity.MenuItem;

public interface IMenuService {

	public String getTotal(ArrayList<MenuItem> menuItemPrice);

	public String getSubTotal(ArrayList<MenuItem> menuItemPrice);

	public int getItemNumber(ArrayList<MenuItem> menuItem);
	

}
