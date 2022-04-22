package edu.wccnet.ctbriggs.springMVC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.wccnet.ctbriggs.springMVC.dao.OrderDAO;
import edu.wccnet.ctbriggs.springMVC.domain.Order;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	@Transactional
	public List<Order> getOrders() {
		return orderDAO.getOrders();
	}

	@Override
	@Transactional
	public Order getOrder(int id) {
		return orderDAO.getOrder(id);
	}

	@Override
	@Transactional
	public void completeOrder(int id) {
		orderDAO.completeOrder(id);
		
	}

	@Override
	@Transactional
	public List<Order> getCompletedOrders() {
		return orderDAO.getCompletedOrders();
	}

}
