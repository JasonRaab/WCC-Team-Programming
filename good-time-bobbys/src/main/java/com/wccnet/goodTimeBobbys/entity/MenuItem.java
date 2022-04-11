package com.wccnet.goodTimeBobbys.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "menu_item")
public class MenuItem {

	// One to Many from menuItem to itemOrdered
	// One to Many from menuItem to menuItemDefaultIngredient
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "item_id")
	private int itemId;

	@Column(name = "item_name")
	private String itemName;

	@Column(name = "item_description")
	private String itemDescription;

	// Entree, Side, Drink, etc...
	@Column(name = "item_category")
	private String itemCategory;

	// Is this the total that is in current stock or is it a
	// True/False?*********************************************************************
	@Column(name = "item_stock")
	private int itemStock;

	@Column(name = "item_price")
	private Double itemPrice;

	@Column(name = "is_active")
	private int isActive;
	
	@Transient
	private List<Ingredient> modifiedIngredients;
	
	@Transient
	private int itemNumber;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "menu_item_default_ingredient", joinColumns = {
			@JoinColumn(name = "menu_item_id") }, inverseJoinColumns = { @JoinColumn(name = "ingredient_id") })
	List<Ingredient> ingredients = new ArrayList<Ingredient>();
	
	
	@JsonIgnore
	@OneToMany(mappedBy = "menuItem", cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.PERSIST })
	private List<ItemOrdered> itemsOrdered;
	
	
	public void addItemsOrdered(ItemOrdered itemOrdered) {
		itemsOrdered.add(itemOrdered);
		itemOrdered.setMenuItem(this);
	}
	
	public void removeItemsOrdered(ItemOrdered itemOrdered) {
		itemsOrdered.remove(itemOrdered);
	}
	
	public void clearItemsOrderedList() {
		itemsOrdered.clear();
	}

	public MenuItem() {

	}
	
	public MenuItem(String itemName, String itemDescription, String itemCategory, int itemStock, Double itemPrice,
			int isActive) {
		super();
		this.itemName = itemName;
		this.itemDescription = itemDescription;
		this.itemCategory = itemCategory;
		this.itemStock = itemStock;
		this.itemPrice = itemPrice;
		this.isActive = isActive;
	}
	
	public MenuItem(int itemId,
			String itemName,
			String itemDescription,
			String itemCategory,
			int itemStock,
			Double itemPrice) {
		super();
		this.itemName = itemName;
		this.itemDescription = itemDescription;
		this.itemCategory = itemCategory;
		this.itemStock = itemStock;
		this.itemPrice = itemPrice;
	}

	public void addIngredient(Ingredient ingredient) {
		if (ingredient.getIsActive() == 1) {
			ingredients.add(ingredient);
		}
	}

	public void removeIngredient(Ingredient ingredient) {
		ingredients.remove(ingredient);
	}

	public int getItemNumber() {
		return itemNumber;
	}

	public void setItemNumber(int itemNumber) {
		this.itemNumber = itemNumber;
	}

	@Override
	public String toString() {
		return "{ MenuItem } \nItem ID: " + itemId + " \nItem Name: " + itemName + " \nItem Description: "
				+ itemDescription + " \nItem Category: " + itemCategory + " \nItem Stock: " + itemStock
				+ " \nItem Price: " + itemPrice;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public String getItemCategory() {
		return itemCategory;
	}

	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}

	public int getItemStock() {
		return itemStock;
	}

	public void setItemStock(int itemStock) {
		this.itemStock = itemStock;
	}

	public Double getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(Double itemPrice) {
		this.itemPrice = itemPrice;
	}

	public List<Ingredient> getIngredients() {
		return ingredients;
	}

	public void setIngredients(List<Ingredient> ingredients) {
		this.ingredients = ingredients;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

}
