package edu.wccnet.goodTimeBobbys.management.service;

import java.util.List;

import edu.wccnet.goodTimeBobbys.management.entity.MenuItem;

public interface MenuService {
	
public List<MenuItem> getMenu();

public MenuItem getMenuItem(int id);

public void save(MenuItem newMenuItem);

public void updateStock(int id, int count);

public List<MenuItem> getInactiveMenu();

public void deactivate(int id);

public void activate(int id);

}
