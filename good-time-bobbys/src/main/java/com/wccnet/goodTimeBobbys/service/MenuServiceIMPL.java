package com.wccnet.goodTimeBobbys.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.wccnet.goodTimeBobbys.entity.MenuItem;

@Service
public class MenuServiceIMPL implements IMenuService {

	@Override
	public String getAllTotals(ArrayList<Integer> menuItemPrice) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getSubTotal(ArrayList<MenuItem> menuItemPrice) {
		Double subTotal = 0.00;
		Double itemPrice = 0.00;
		for (MenuItem menuItem : menuItemPrice) {
			itemPrice = menuItem.getItemPrice();
			subTotal += itemPrice;
		}
		
		return "$" + subTotal;
	}



}
