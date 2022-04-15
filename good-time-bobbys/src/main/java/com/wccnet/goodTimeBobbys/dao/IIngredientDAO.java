package com.wccnet.goodTimeBobbys.dao;

import java.util.List;
import java.util.Set;

import com.wccnet.goodTimeBobbys.entity.Ingredient;

public interface IIngredientDAO {
	public List<Ingredient> getIngredientListByMenuItemID(int menuItemID);

	public List<Ingredient> getAllIngredients();

	Set<Integer> getDefaultIngredientIDs(int menuItemID);

	public int compareDefaultAndChosenIngredients(int menuItemID);
	
	public Ingredient getIngredientByID(int ingredientID);
}
