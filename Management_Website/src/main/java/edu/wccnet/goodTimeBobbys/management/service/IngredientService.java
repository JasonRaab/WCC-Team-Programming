package edu.wccnet.goodTimeBobbys.management.service;

import java.util.List;

import edu.wccnet.goodTimeBobbys.management.entity.IngredientItem;

public interface IngredientService {
	
public List<IngredientItem> getIngredients();

public List<IngredientItem>getIngredientsIdOrdered();

public List<IngredientItem> getIngredients(String category);

public IngredientItem getIngredient(int id);

public void add(IngredientItem newIngredient);

public List<String> getCategories();

public void updateStock(int id, int count);

public List<IngredientItem> getInactiveIngredients();

public void deactivate(int id);

public void activate(int id);
}
