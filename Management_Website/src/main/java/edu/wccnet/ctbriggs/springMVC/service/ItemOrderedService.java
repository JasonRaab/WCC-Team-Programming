package edu.wccnet.ctbriggs.springMVC.service;

import java.util.List;

import edu.wccnet.ctbriggs.springMVC.domain.ItemOrdered;

public interface ItemOrderedService {
	public List<Integer> getNumberOfItems(int order_id);
	public List<ItemOrdered> getModifications(int order_id, int itemNumber);
	
}
