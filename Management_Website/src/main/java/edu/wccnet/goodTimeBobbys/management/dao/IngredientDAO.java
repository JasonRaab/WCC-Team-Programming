package edu.wccnet.goodTimeBobbys.management.dao;

import java.util.List;

import edu.wccnet.goodTimeBobbys.management.entity.IngredientItem;

public interface IngredientDAO {
	public List<IngredientItem> getIngredients();
	
	public List<IngredientItem>getIngredientsIdOrdered();

	public List<IngredientItem> getIngredients(String category);
	
	public void add(IngredientItem newIngredient);

	public IngredientItem getIngredient(int id);
	
	public List<String> getCategories();

	public void updateStock(int id, int count);

	public List<IngredientItem> getInactiveIngredients();

	public void deactivate(int id);

	public void activate(int id);
	
}
