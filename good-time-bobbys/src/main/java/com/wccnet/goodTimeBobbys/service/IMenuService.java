package com.wccnet.goodTimeBobbys.service;

import java.util.ArrayList;
import java.util.List;

import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.MenuItem;

public interface IMenuService {

	public Double getTotal(Double subTotal, Double tax);

	public Double getSubTotal(ArrayList<MenuItem> menuItemPrice);

	public int getItemNumber(ArrayList<MenuItem> menuItem);

	public Double getTax(Double subTotal);

	public void addToAddedIngredientsByUser(Ingredient ingredient);

	public List<Ingredient> getAddedIngredientsByUser();

	public Double getIngredientsAddedPriceTotal();

	public void addToRemovedIngredientByUser(Ingredient ingredient);

	public List<Ingredient> getRemovedIngredientsByUser();

	public void clearAddedIngredientsByUser();

	public void clearRemovedIngredientsByUser();
	

}