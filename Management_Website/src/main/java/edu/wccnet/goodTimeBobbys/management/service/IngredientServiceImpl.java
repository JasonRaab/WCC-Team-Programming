package edu.wccnet.goodTimeBobbys.management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.wccnet.goodTimeBobbys.management.dao.IngredientDAO;
import edu.wccnet.goodTimeBobbys.management.entity.IngredientItem;

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
	public List<IngredientItem> getIngredientsIdOrdered() {
		return ingredientDAO.getIngredientsIdOrdered();
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

	@Override
	@Transactional
	public void updateStock(int id, int count) {
		ingredientDAO.updateStock(id, count);
		
	}

	@Override
	@Transactional
	public List<IngredientItem> getInactiveIngredients() {
		return ingredientDAO.getInactiveIngredients();
	}

	@Override
	@Transactional
	public void deactivate(int id) {
		ingredientDAO.deactivate(id);
		
	}

	@Override
	@Transactional
	public void activate(int id) {
		ingredientDAO.activate(id);
		
	}



}
