package com.wccnet.goodTimeBobbys.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ingredient")
public class Ingredient {

	// One to Many menuItemDefaultIngredient
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ingredient_id")
	private int ingredientId;

	@Column(name = "ingredient_name")
	private String ingredientName;

	// What is this referring to? Is it the same as MenuItem.category or is it
	// something
	// else?**********************************************************************
	@Column(name = "ingredient_category")
	private String ingredientCategory;

	@Column(name = "ingredient_stock")
	private int ingredientStock;

	@Column(name = "ingredient_price")
	private double ingredientPrice;
	
	@Column(name = "is_active")
	private int isActive;

	public Ingredient() {

	}

	public Ingredient(String ingredientName, int ingredientStock, double ingredientPrice) {
		super();
		this.ingredientName = ingredientName;
		this.ingredientStock = ingredientStock;
		this.ingredientPrice = ingredientPrice;
	}

	@Override
	public String toString() {
		return "{ Ingredient Table }\nIngredient Id: " + ingredientId + "\nIngredient Name: " + ingredientName
				+ "\nIngredient Stock: " + ingredientStock + "\nIngredient Price: " + ingredientPrice;
	}

	public int getIngredientId() {
		return ingredientId;
	}

	public void setIngredientId(int ingredientId) {
		this.ingredientId = ingredientId;
	}

	public String getIngredientName() {
		return ingredientName;
	}

	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}

	public int getIngredientStock() {
		return ingredientStock;
	}

	public void setIngredientStock(int ingredientStock) {
		this.ingredientStock = ingredientStock;
	}

	public double getIngredientPrice() {
		return ingredientPrice;
	}

	public void setIngredientPrice(double ingredientPrice) {
		this.ingredientPrice = ingredientPrice;
	}

	public String getCategory() {
		return ingredientCategory;
	}

	public void setCategory(String ingredientCategory) {
		this.ingredientCategory = ingredientCategory;
	}

	public String getIngredientCategory() {
		return ingredientCategory;
	}

	public void setIngredientCategory(String ingredientCategory) {
		this.ingredientCategory = ingredientCategory;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	
	

}