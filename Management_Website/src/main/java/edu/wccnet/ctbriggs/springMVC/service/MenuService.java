package edu.wccnet.ctbriggs.springMVC.service;

import java.util.List;

import edu.wccnet.ctbriggs.springMVC.domain.MenuItem;

public interface MenuService {
	
public List<MenuItem> getMenu();

public MenuItem getMenuItem(int id);

public void save(MenuItem newMenuItem);

public void updateStock(int id, int count);

public List<MenuItem> getInactiveMenu();

public void deactivate(int id);

public void activate(int id);

}
