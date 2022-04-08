package edu.wccnet.ctbriggs.springMVC.dao;

import java.util.List;

import edu.wccnet.ctbriggs.springMVC.domain.MenuItem;

public interface MenuDAO {
	public List<MenuItem> getMenu();

	public void save(MenuItem newMenuItem);

	public void updateStock(int id, int count);
}
