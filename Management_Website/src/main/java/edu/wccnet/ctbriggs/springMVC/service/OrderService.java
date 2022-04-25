package edu.wccnet.ctbriggs.springMVC.service;

import java.util.List;

import edu.wccnet.ctbriggs.springMVC.domain.Order;

public interface OrderService {
	public List<Order> getOrders();
	public List<Order> getCompletedOrders();
	public Order getOrder(int id);
	public void completeOrder(int id);
	public void openOrder(int id);
}
