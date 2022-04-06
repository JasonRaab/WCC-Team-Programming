package edu.wccnet.ctbriggs.springMVC.service;

import java.util.List;

import edu.wccnet.ctbriggs.springMVC.domain.IngredientItem;

public interface IngredientService {
	
public List<IngredientItem> getIngredients();

public IngredientItem getIngredient(int id);

public void add(IngredientItem newIngredient);
}
