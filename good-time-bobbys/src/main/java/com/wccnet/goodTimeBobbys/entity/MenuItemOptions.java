package com.wccnet.goodTimeBobbys.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "menu_item_options")
public class MenuItemOptions {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "menu_item_options")
	private int menuItemOptions;

	@Column(name = "menu_item_id")
	private int menuItemId;

	@Column(name = "ingredients_id")
	private int ingredientsId;

	public MenuItemOptions() {

	}

	public MenuItemOptions(int menuItemOptions, int menuItemId, int ingredientsId) {
		super();
		this.menuItemOptions = menuItemOptions;
		this.menuItemId = menuItemId;
		this.ingredientsId = ingredientsId;
	}

	@Override
	public String toString() {
		return "{ MenuItemOptions } \nMenu Item Options: " + menuItemOptions + "\nMenu Item ID: " + menuItemId
				+ "\nIngredients ID: " + ingredientsId;
	}

	public int getMenuItemOptions() {
		return menuItemOptions;
	}

	public void setMenuItemOptions(int menuItemOptions) {
		this.menuItemOptions = menuItemOptions;
	}

	public int getMenuItemId() {
		return menuItemId;
	}

	public void setMenuItemId(int menuItemId) {
		this.menuItemId = menuItemId;
	}

	public int getIngredientsId() {
		return ingredientsId;
	}

	public void setIngredientsId(int ingredientsId) {
		this.ingredientsId = ingredientsId;
	}

}
