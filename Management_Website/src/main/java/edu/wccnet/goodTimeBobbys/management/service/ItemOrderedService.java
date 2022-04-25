package edu.wccnet.goodTimeBobbys.management.service;

import java.util.List;

import edu.wccnet.goodTimeBobbys.management.entity.ItemOrdered;
import edu.wccnet.goodTimeBobbys.management.entity.Order;

public interface ItemOrderedService {
	public List<Integer> getNumberOfItems(int order_id);
	public List<ItemOrdered> getModifications(int order_id, int itemNumber);
	public List<Order> getAllOpenOrders();
	public List<Order> getAllCompleteOrders();
	
}
