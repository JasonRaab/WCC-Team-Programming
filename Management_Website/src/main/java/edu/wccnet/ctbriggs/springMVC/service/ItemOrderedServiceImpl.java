package edu.wccnet.ctbriggs.springMVC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.wccnet.ctbriggs.springMVC.dao.ItemOrderedDAO;
import edu.wccnet.ctbriggs.springMVC.domain.ItemOrdered;

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

}
