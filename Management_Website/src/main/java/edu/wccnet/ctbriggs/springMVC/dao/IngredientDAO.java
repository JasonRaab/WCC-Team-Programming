package edu.wccnet.ctbriggs.springMVC.dao;

import java.util.List;

import edu.wccnet.ctbriggs.springMVC.domain.IngredientItem;

public interface IngredientDAO {
	public List<IngredientItem> getIngredients();

	public List<IngredientItem> getIngredients(String category);
	
	public void add(IngredientItem newIngredient);

	public IngredientItem getIngredient(int id);
	
	public List<String> getCategories();
	
}
