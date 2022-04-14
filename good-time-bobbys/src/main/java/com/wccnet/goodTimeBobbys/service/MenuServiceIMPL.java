package com.wccnet.goodTimeBobbys.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.wccnet.goodTimeBobbys.entity.MenuItem;

@Service
public class MenuServiceIMPL implements IMenuService {


	@Override
	public Double getTotal(ArrayList<MenuItem> menuItemPrice, Double subTotal, Double tax) {
		// TODO Auto-generated method stub
		
		Double itemPrice = 0.00;
		
		Double total = 0.00;
		
		for (MenuItem menuItem : menuItemPrice) {
			itemPrice = menuItem.getItemPrice();
			subTotal += itemPrice;

			total = (tax += subTotal);
			
		}
		
		return total;
	}
	@Override
	public Double getTax(Double subTotal) {
		Double tax = (subTotal * .06);
		return tax;
	}
	
	@Override
	public Double getSubTotal(ArrayList<MenuItem> menuItemPrice) {
		Double subTotal = 0.00;
		Double itemPrice = 0.00;
		for (MenuItem menuItem : menuItemPrice) {
			itemPrice = menuItem.getItemPrice();
			subTotal += itemPrice;
		}
		
		return subTotal;
	}
	
	@Override
	public int getItemNumber(ArrayList<MenuItem> menuItemList) {
		
		int itemNumber = 0;
		for (MenuItem menuItem : menuItemList) {
			itemNumber = menuItem.getItemNumber();
		}
		
		
		return itemNumber;
	}

}
