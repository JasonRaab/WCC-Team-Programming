package edu.wccnet.goodTimeBobbys.management.dao;

import java.util.List;

import edu.wccnet.goodTimeBobbys.management.entity.ItemOrdered;
import edu.wccnet.goodTimeBobbys.management.entity.Order;

public interface ItemOrderedDAO {
	public List<Integer> getNumberOfItems(int order_id);
	public List<ItemOrdered> getModifications(int order_id, int itemNumber);
	public List<ItemOrdered> getAllOrders();
}
