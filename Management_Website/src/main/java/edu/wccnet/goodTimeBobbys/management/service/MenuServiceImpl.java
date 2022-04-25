package edu.wccnet.goodTimeBobbys.management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.wccnet.goodTimeBobbys.management.dao.MenuDAO;
import edu.wccnet.goodTimeBobbys.management.entity.MenuItem;
@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuDAO menuDAO;
	
	@Override
	@Transactional
	public List<MenuItem> getMenu() {
		// TODO Auto-generated method stub
		return menuDAO.getMenu();
	}

	@Override
	@Transactional
	public void save(MenuItem newMenuItem) {
		menuDAO.save(newMenuItem);
		
	}

	@Override
	@Transactional
	public void updateStock(int id, int count) {
		menuDAO.updateStock(id, count);
		
	}

	@Override
	@Transactional
	public List<MenuItem> getInactiveMenu() {
		return menuDAO.getInactiveMenu();
	}

	@Override
	@Transactional
	public MenuItem getMenuItem(int id) {
		return menuDAO.getMenuItem(id);
	}

	@Override
	@Transactional
	public void deactivate(int id) {
		menuDAO.deactivate(id);
		
	}

	@Override
	@Transactional
	public void activate(int id) {
		menuDAO.activate(id);
		
	}


}
