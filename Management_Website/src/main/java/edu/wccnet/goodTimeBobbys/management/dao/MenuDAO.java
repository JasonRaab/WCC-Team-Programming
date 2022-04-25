package edu.wccnet.goodTimeBobbys.management.dao;

import java.util.List;

import edu.wccnet.goodTimeBobbys.management.entity.MenuItem;

public interface MenuDAO {
	public List<MenuItem> getMenu();

	public void save(MenuItem newMenuItem);

	public void updateStock(int id, int count);

	public List<MenuItem> getInactiveMenu();
	
	public MenuItem getMenuItem(int id);

	public void deactivate(int id);
	
	public void activate(int id);
}
