package edu.wccnet.ctbriggs.springMVC.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.wccnet.ctbriggs.springMVC.dao.ItemOrderedDAO;
import edu.wccnet.ctbriggs.springMVC.domain.ItemOrdered;
import edu.wccnet.ctbriggs.springMVC.domain.Order;

@Service
public class ItemOrderedServiceImpl implements ItemOrderedService {

	@Autowired
	private ItemOrderedDAO itemOrderedDAO;
	
	@Override
	@Transactional
	public List<Integer> getNumberOfItems(int order_id) {
		return itemOrderedDAO.getNumberOfItems(order_id);
	}

	@Override
	@Transactional
	public List<ItemOrdered> getModifications(int order_id, int itemNumber) {
		return itemOrderedDAO.getModifications(order_id, itemNumber);
	}

	@Override
	@Transactional
	public List<Order> getAllOpenOrders() {
		List<ItemOrdered> items= itemOrderedDAO.getAllOrders();
		HashSet<Order> orders = new HashSet<Order>();
		for (ItemOrdered item : items) {
			if(item.getOrder().getIsOpen() == 1)
			orders.add(item.getOrder());
		}
		return new ArrayList<Order>(orders);
	}

	@Override
	@Transactional
	public List<Order> getAllCompleteOrders() {
		List<ItemOrdered> items= itemOrderedDAO.getAllOrders();
		HashSet<Order> orders = new HashSet<Order>();
		for (ItemOrdered item : items) {
			if(item.getOrder().getIsOpen() == 0)
			orders.add(item.getOrder());
		}
		return new ArrayList<Order>(orders);
	}

}
