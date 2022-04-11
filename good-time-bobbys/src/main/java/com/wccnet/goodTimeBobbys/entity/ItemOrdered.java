package com.wccnet.goodTimeBobbys.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "item_ordered")
public class ItemOrdered implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */

	// One OrderInfo to many menuItem(s)
//	@Id
//	@Column(name = "order_id")
//	private int orderId;
	@Id
	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.PERSIST })
	@JoinColumn(name = "order_id")
	private OrderInfo orderInfo;

	// This differentiates one "burger" from the next (in case they both have the
	// same topping)
	@Column(name = "item_number")
	private int itemNumber;

	// One MenuItem to many ItemOrdered
//	@Id
//	@Column(name = "menu_item")
//	private int menuItemId;

	@Id
	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.PERSIST })
	@JoinColumn(name = "menu_item")
	private MenuItem menuItem;

	// Not sure how to link this up to the datebase
	// **************************************************************
	@Column(name = "ingredient_id")
	private int ingredientId;

	// This is a True = 1, False = 0
	@Column(name = "modification")
	private int modification;

	public ItemOrdered() {

	}

	/**
	 * @param orderId
	 * @param itemNumber
	 * @param menuItemId
	 * @param ingredientId
	 * @param modification
	 */
	public ItemOrdered(OrderInfo orderInfo, int itemNumber, MenuItem menuItem, int ingredientId, int modification) {
		super();
		this.orderInfo = orderInfo;
		this.itemNumber = itemNumber;
		this.menuItem = menuItem;
		this.ingredientId = ingredientId;
		this.modification = modification;
	}
	
	public int getItemNumber() {
		return itemNumber;
	}

	public void setItemNumber(int itemNumber) {
		this.itemNumber = itemNumber;
	}

	public int getIngredientId() {
		return ingredientId;
	}

	public void setIngredientId(int ingredientId) {
		this.ingredientId = ingredientId;
	}

	public int getModification() {
		return modification;
	}

	public void setModification(int modification) {
		this.modification = modification;
	}

	public OrderInfo getOrderInfo() {
		return orderInfo;
	}

	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}

	public MenuItem getMenuItem() {
		return menuItem;
	}

	public void setMenuItem(MenuItem menuItem) {
		this.menuItem = menuItem;
	}

	@Override
	public String toString() {
		return " { ItemOrdered } Order ID: " + orderInfo.getOrderId() + " /nItem Number: " + itemNumber + " /nMenu Item Id: "
				+ menuItem.getItemId() + " /nIngredient ID: " + ingredientId + " /nModification: " + modification;
	}

}