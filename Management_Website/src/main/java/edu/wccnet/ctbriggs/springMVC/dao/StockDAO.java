package edu.wccnet.ctbriggs.springMVC.dao;

import java.util.List;

import edu.wccnet.ctbriggs.springMVC.domain.Stock;

public interface StockDAO {
	
	public List<Stock> getStocks();

	public void updateCount(int stockId, int count);
}
