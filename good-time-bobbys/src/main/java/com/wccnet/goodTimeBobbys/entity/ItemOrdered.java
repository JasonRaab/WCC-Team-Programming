package com.wccnet.goodTimeBobbys.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "item_ordered")
public class ItemOrdered {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "item_ordered_id")
	private int itemOrderedId;

	@Column(name = "order_id")
	private int orderId;

	@Column(name = "menu_item_options_id")
	private int menuItemOptionsId;

	public ItemOrdered() {

	}

	public ItemOrdered(int orderId, int menuItemOptionsId) {
		super();
		this.orderId = orderId;
		this.menuItemOptionsId = menuItemOptionsId;
	}

	public int getItemOrderedId() {
		return itemOrderedId;
	}

	public void setItemOrderedId(int itemOrderedId) {
		this.itemOrderedId = itemOrderedId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getMenuItemOptionsId() {
		return menuItemOptionsId;
	}

	public void setMenuItemOptionsId(int menuItemOptionsId) {
		this.menuItemOptionsId = menuItemOptionsId;
	}

	@Override
	public String toString() {
		return "{ ItemOrdered Table }\nitem ordered id: " + itemOrderedId + "\norder id: " + orderId
				+ "\nmenu item options id: " + menuItemOptionsId;
	}

}
