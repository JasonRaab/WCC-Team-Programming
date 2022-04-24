package edu.wccnet.ctbriggs.springMVC.service;

import java.util.List;

import edu.wccnet.ctbriggs.springMVC.domain.ItemOrdered;
import edu.wccnet.ctbriggs.springMVC.domain.Order;

public interface ItemOrderedService {
	public List<Integer> getNumberOfItems(int order_id);
	public List<ItemOrdered> getModifications(int order_id, int itemNumber);
	public List<Order> getAllOpenOrders();
	public List<Order> getAllCompleteOrders();
	
}
