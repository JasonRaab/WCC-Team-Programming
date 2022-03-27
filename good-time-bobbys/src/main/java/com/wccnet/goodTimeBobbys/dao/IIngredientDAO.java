package com.wccnet.goodTimeBobbys.dao;

import java.util.List;

import com.wccnet.goodTimeBobbys.entity.Ingredient;

public interface IIngredientDAO {
	
	public List<Ingredient> getIngredientListByMenuItemID(int menuItemID);

}
