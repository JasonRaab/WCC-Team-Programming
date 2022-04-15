package com.wccnet.goodTimeBobbys.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name = "order_info")
public class OrderInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id")
	private int orderId;

	// One User to many Orders
	@Column(name = "user_id")
	private int userId;

	// pass in NOW() to the database to get the correct format - this returns a String
	@Column(name = "order_date")
	private String orderDate;

	//To get this value - add all of the prices of the MenuItems on the order
	@Column(name = "order_subtotal")
	private Double orderSubtotal;

	//To get this value - multiply the order by .06
	@Column(name = "order_tax")
	private Double orderTax;

	//To get this value - add the orderSubtotal and the orderTax
	@Column(name = "order_total")
	private Double orderTotal;
	
	//This is in-store, pick-up, or delivery
	@Column(name = "order_type")
	private String orderType;
	
	//This is the table # for in-store orders
	@Column(name = "table_number")
	private String tableNumber;
	
	//this column is allowing us to track if the order is open = 1 or closed = 0
	
	@Column(name = "is_open")
	private int isOpen;
	
	@JsonIgnore
	@OneToMany(mappedBy = "orderInfo", cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.PERSIST }, fetch = FetchType.EAGER)
	private List<ItemOrdered> itemsOrdered;
	
	public void addItemsOrdered(ItemOrdered itemOrdered) {
		itemsOrdered.add(itemOrdered);
		itemOrdered.setOrderInfo(this);
	}
	
	public void removeItemsOrdered(ItemOrdered itemOrdered) {
		itemsOrdered.remove(itemOrdered);
	}
	
	public void clearItemsOrderedList() {
		itemsOrdered.clear();
	}
	
	
	
	public OrderInfo() {

	}
	
	

	/**
	 * @param userId
	 * @param orderDate
	 * @param orderSubtotal
	 * @param orderTax
	 * @param orderTotal
	 * @param orderType
	 * @param tableNumber
	 * @param isOpen
	 * @param itemsOrdered
	 */
	public OrderInfo(int userId, String orderDate, Double orderSubtotal, Double orderTax, Double orderTotal,
			String orderType, String tableNumber, int isOpen, List<ItemOrdered> itemsOrdered) {
		super();
		this.userId = userId;
		this.orderDate = orderDate;
		this.orderSubtotal = orderSubtotal;
		this.orderTax = orderTax;
		this.orderTotal = orderTotal;
		this.orderType = orderType;
		this.tableNumber = tableNumber;
		this.isOpen = isOpen;
		this.itemsOrdered = itemsOrdered;
	}

	/**
	 * @param userId
	 * @param order_date
	 * @param order_subtotal
	 * @param orderTax
	 * @param orderTotal
	 * @param orderType
	 */
	public OrderInfo(int userId, String orderDate, Double orderSubtotal, Double orderTax, Double orderTotal) {
		super();
		this.userId = userId;
		this.orderDate = orderDate;
		this.orderSubtotal = orderSubtotal;
		this.orderTax = orderTax;
		this.orderTotal = orderTotal;
		this.orderType = "pickup";
		//this.isOpen = 1;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}


	public Double getOrderTax() {
		return orderTax;
	}

	public void setOrderTax(Double orderTax) {
		this.orderTax = orderTax;
	}

	public Double getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(Double orderTotal) {
		this.orderTotal = orderTotal;
	}
	
	

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public Double getOrderSubtotal() {
		return orderSubtotal;
	}

	public void setOrderSubtotal(Double orderSubtotal) {
		this.orderSubtotal = orderSubtotal;
	}

	public int getIsOpen() {
		return isOpen;
	}

	public void setIsOpen(int isOpen) {
		this.isOpen = isOpen;
	}

	public List<ItemOrdered> getItemsOrdered() {
		return itemsOrdered;
	}

	public void setItemsOrdered(List<ItemOrdered> itemsOrdered) {
		this.itemsOrdered = itemsOrdered;
	}

	public String getTableNumber() {
		return tableNumber;
	}

	public void setTableNumber(String tableNumber) {
		this.tableNumber = tableNumber;
	}

	@Override
	public String toString() {
		return " { OrderInfo } Order ID: " + orderId + " /nUser ID: " + userId + " /nOrder Date: " + orderDate
				+ " /nOrder Subtotal: " + orderSubtotal + " /nOrder Tax: " + orderTax + " /nOrder Total: " + orderTotal
				+ " /nOrder Type: " + orderType + " /nTable Number: " + tableNumber;
	}

}