package com.wccnet.goodTimeBobbys.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.wccnet.goodTimeBobbys.entity.MenuItem;

@Service
public class MenuServiceIMPL implements IMenuService {


	@Override
	public String getTotal(ArrayList<MenuItem> menuItemPrice) {
		// TODO Auto-generated method stub
		Double subtotal = 0.00;
		Double itemPrice = 0.00;
		Double tax = 0.00;
		Double total = 0.00;
		
		for (MenuItem menuItem : menuItemPrice) {
			itemPrice = menuItem.getItemPrice();
			subtotal += itemPrice;
			tax = (subtotal * .06);
			total = (tax += subtotal);
			
		}
		
		return "$" + total;
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
