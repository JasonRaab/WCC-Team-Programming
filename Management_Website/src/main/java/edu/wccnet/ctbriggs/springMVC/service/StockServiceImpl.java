package edu.wccnet.ctbriggs.springMVC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.wccnet.ctbriggs.springMVC.dao.StockDAO;
import edu.wccnet.ctbriggs.springMVC.domain.Stock;

@Service
public class StockServiceImpl implements StockService {
	@Autowired
	private StockDAO stockDAO;
	@Override
	@Transactional
	public List<Stock> getStocks() {
		return stockDAO.getStocks();
	}

}
