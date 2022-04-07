package edu.wccnet.ctbriggs.springMVC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.wccnet.ctbriggs.springMVC.dao.IngredientDAO;
import edu.wccnet.ctbriggs.springMVC.domain.IngredientItem;

@Service
public class IngredientServiceImpl implements IngredientService{

	@Autowired
	private IngredientDAO ingredientDAO;
	
	@Override
	@Transactional
	public List<IngredientItem> getIngredients() {
		return ingredientDAO.getIngredients();
	}

	@Override
	@Transactional
	public void add(IngredientItem newIngredient) {
		ingredientDAO.add(newIngredient);
		
	}

	@Override
	@Transactional
	public IngredientItem getIngredient(int id) {
		return ingredientDAO.getIngredient(id);
	}

	@Override
	@Transactional
	public List<String> getCategories() {
		return ingredientDAO.getCategories();
	}

	@Override
	@Transactional
	public List<IngredientItem> getIngredients(String category) {
		return ingredientDAO.getIngredients(category);
	}
	

}
