package com.wccnet.goodTimeBobbys.entity;

import java.util.ArrayList;

public class CompleteOrderInfo {

	MenuItem menuItem;
	Ingredient ingredient;
	OrderInfo orderInfo;
	ItemOrdered itemOrdered;
	Address address;
	User user;
	UserAddress userAddress;
	ArrayList<ItemOrdered> itemOrderedList = new ArrayList<>();
	
	
//	to process an order we need all the menuItems
//	that were ordered and all of the ingredients that were modified
//	we also need the orderinfo that was already created
	
	public CompleteOrderInfo() {
		
	}
	
	/**
	 * @param menuItem
	 * @param ingredient
	 * @param orderInfo
	 * @param itemOrdered
	 * @param user
	 */
	public CompleteOrderInfo(MenuItem menuItem, Ingredient ingredient, OrderInfo orderInfo, ItemOrdered itemOrdered,
			User user) {
		super();
		this.menuItem = menuItem;
		this.ingredient = ingredient;
		this.orderInfo = orderInfo;
		this.itemOrdered = itemOrdered;
		this.user = user;
	}
	public MenuItem getMenuItem() {
		return menuItem;
	}
	public void setMenuItem(MenuItem menuItem) {
		this.menuItem = menuItem;
	}
	public Ingredient getIngredient() {
		return ingredient;
	}
	public void setIngredient(Ingredient ingredient) {
		this.ingredient = ingredient;
	}
	public OrderInfo getOrderInfo() {
		return orderInfo;
	}
	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}
	public ItemOrdered getItemOrdered() {
		return itemOrdered;
	}
	public void setItemOrdered(ItemOrdered itemOrdered) {
		this.itemOrdered = itemOrdered;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserAddress getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(UserAddress userAddress) {
		this.userAddress = userAddress;
	}
	
	
}
