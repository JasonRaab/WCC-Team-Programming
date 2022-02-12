package com.wccnet.goodTimeBobbys.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "order_info")
public class OrderInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id")
	private int orderId;

	@Column(name = "order_type")
	private String orderType;

	@Column(name = "order_price")
	private double orderPrice;

	public OrderInfo() {

	}

	public OrderInfo(String orderType, double orderPrice) {
		super();
		this.orderType = orderType;
		this.orderPrice = orderPrice;
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

	public double getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(double orderPrice) {
		this.orderPrice = orderPrice;
	}

	@Override
	public String toString() {
		return " { OrderInfo table }\norder id: " + orderId + "\norder type: " + orderType + "\norder price: "
				+ orderPrice;
	}

}
