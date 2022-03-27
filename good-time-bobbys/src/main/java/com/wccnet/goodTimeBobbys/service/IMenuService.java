package com.wccnet.goodTimeBobbys.service;

import java.util.ArrayList;

import com.wccnet.goodTimeBobbys.entity.MenuItem;

public interface IMenuService {
	
	public String getAllTotals(ArrayList<Integer> menuItemPrice);

	public String getSubTotal(ArrayList<MenuItem> menuItemPrice);
	

}
