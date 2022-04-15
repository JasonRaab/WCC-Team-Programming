package com.wccnet.goodTimeBobbys.service;

import java.util.ArrayList;

import com.wccnet.goodTimeBobbys.entity.MenuItem;


public interface IMenuService {

	public Double getTotal(ArrayList<MenuItem> menuItemPrice, Double subTotal, Double tax);

	public Double getSubTotal(ArrayList<MenuItem> menuItemPrice);

	public int getItemNumber(ArrayList<MenuItem> menuItem);

	public Double getTax(Double subTotal);
	

}