package com.wccnet.goodTimeBobbys.entity;

<<<<<<< HEAD
=======
import java.util.ArrayList;
import java.util.List;

>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
<<<<<<< HEAD
=======
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
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
<<<<<<< HEAD
	
	@Column(name = "is_active")
	private int isActive;

=======

	@Column(name = "is_active")
	private int isActive;

	@ManyToMany
	@JoinTable(name = "menu_item_default_ingredient", joinColumns = {
			@JoinColumn(name = "ingredient_id")}, inverseJoinColumns = {@JoinColumn(name = "item_id")})
	List<MenuItem> menuItems = new ArrayList<MenuItem>();

>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
	public Ingredient() {

	}

	public Ingredient(String ingredientName, int ingredientStock, double ingredientPrice) {
		super();
		this.ingredientName = ingredientName;
		this.ingredientStock = ingredientStock;
		this.ingredientPrice = ingredientPrice;
	}

<<<<<<< HEAD
=======
	public Ingredient(String ingredientName, String ingredientCategory, int ingredientStock, double ingredientPrice,
			int isActive) {
		super();
		this.ingredientName = ingredientName;
		this.ingredientCategory = ingredientCategory;
		this.isActive = isActive;
		this.ingredientStock = ingredientStock;
		this.ingredientPrice = ingredientPrice;
	}

	public void addMenuItem(MenuItem item) {
		menuItems.add(item);
	}
	
	public void removeMenuItem(MenuItem item) {
		menuItems.remove(item);
	}
	
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
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
<<<<<<< HEAD
	
	

}
=======

	public List<MenuItem> getIngredients() {
		return menuItems;
	}

	public void setIngredients(List<MenuItem> ingredients) {
		this.menuItems = ingredients;
	}

}
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
