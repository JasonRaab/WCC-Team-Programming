package edu.wccnet.ctbriggs.springMVC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.wccnet.ctbriggs.springMVC.dao.MenuDAO;
import edu.wccnet.ctbriggs.springMVC.domain.MenuItem;
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

}