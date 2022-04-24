package com.wccnet.goodTimeBobbys.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.MenuItem;

@Service
public class MenuServiceImpl implements IMenuService {

	BigDecimal bd;

	List<Ingredient> addedIngredientsByUser = new ArrayList<Ingredient>();
	List<Ingredient> removedIngredientsByUser = new ArrayList<Ingredient>();

	Double ingredientPriceTotal = 0.00;

	@Override
	public void clearAddedIngredientsByUser() {
		addedIngredientsByUser.clear();
	}

	@Override
	public void clearRemovedIngredientsByUser() {
		removedIngredientsByUser.clear();
	}

	@Override
	public void addToAddedIngredientsByUser(Ingredient ingredient) {
		addedIngredientsByUser.add(ingredient);
	}

	@Override
	public void addToRemovedIngredientByUser(Ingredient ingredient) {
		removedIngredientsByUser.add(ingredient);
	}

	@Override
	public List<Ingredient> getRemovedIngredientsByUser() {
		return removedIngredientsByUser;
	}

	public void setRemovedIngredientsByUser(List<Ingredient> removedIngredientsByUser) {
		this.removedIngredientsByUser = removedIngredientsByUser;
	}

	@Override
	public Double getIngredientsAddedPriceTotal() {

		for (Ingredient ingredient : addedIngredientsByUser) {
			ingredientPriceTotal += ingredient.getIngredientPrice();
		}

		return ingredientPriceTotal;
	}

	@Override
	public Double getTotal(Double subTotal, Double tax) {

		Double total = 0.00;
		total = (tax += subTotal);

		bd = new BigDecimal(total).setScale(2, RoundingMode.HALF_UP);

		double newTotal = bd.doubleValue();

		return newTotal;
	}

	@Override
	public Double getTax(Double subTotal) {
		Double tax = (subTotal * .06);

		bd = new BigDecimal(tax).setScale(2, RoundingMode.HALF_UP);

		double newTax = bd.doubleValue();

		return newTax;
	}

	@Override
	public Double getSubTotal(ArrayList<MenuItem> menuItemPrice) {
		Double subTotal = 0.00;
		Double itemPrice = 0.00;

		double addedIngredientsPriceTotal = getIngredientsAddedPriceTotal();

		for (MenuItem menuItem : menuItemPrice) {
			itemPrice = menuItem.getItemPrice();
			subTotal += itemPrice;
		}

		subTotal += addedIngredientsPriceTotal;

		bd = new BigDecimal(subTotal).setScale(2, RoundingMode.HALF_UP);

		double newSubTotal = bd.doubleValue();

		return newSubTotal;
	}

	@Override
	public int getItemNumber(ArrayList<MenuItem> menuItemList) {

		int itemNumber = 0;
		for (MenuItem menuItem : menuItemList) {
			itemNumber = menuItem.getItemNumber();
		}

		return itemNumber;
	}

	@Override
	public List<Ingredient> getAddedIngredientsByUser() {
		return addedIngredientsByUser;
	}

	public void setAddedIngredientsByUser(List<Ingredient> addedIngredientsByUser) {
		this.addedIngredientsByUser = addedIngredientsByUser;
	}

}