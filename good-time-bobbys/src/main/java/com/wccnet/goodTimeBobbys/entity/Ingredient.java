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

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ingredient_id")
	private int ingredientId;

	@Column(name = "ingredient_name")
	private String ingredientName;

	@Column(name = "ingredient_stock")
	private int ingredientStock;

	@Column(name = "ingredient_price")
	private double ingredientPrice;

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
		return "{ Ingredient table }\ningredient id: " + ingredientId + "\ningredient name: " + ingredientName
				+ "\ningredient stock: " + ingredientStock + "\ningredient price: " + ingredientPrice;
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

}
