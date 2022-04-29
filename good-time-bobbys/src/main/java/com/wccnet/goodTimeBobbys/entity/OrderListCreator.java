package com.wccnet.goodTimeBobbys.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

@Component
public class OrderListCreator {

	ArrayList<Integer> itemIdList = new ArrayList<>();

	public void menuItemIdListCreator(Integer itemID) {
		itemIdList.add(itemID);

	}

	ArrayList<Integer> ingredientIdList = new ArrayList<>();

	Set<Integer> defaultIngredientIdSet = new HashSet<>();

	public void addToDefaultIngredientIdSet(int ingredientID) {
		defaultIngredientIdSet.add(ingredientID);
	}

	Set<Integer> modifiedIngredientIdSet = new HashSet<>();

	List<Ingredient> modifiedIngredientList = new ArrayList<>();

	ArrayList<Integer> editedMenuItems = new ArrayList<>();

	public void clearModifiedIngredientIdSet() {
		if (!modifiedIngredientIdSet.isEmpty()) {
			modifiedIngredientIdSet.clear();
		}
	}

	public List<Ingredient> getModifiedIngredientList() {
		return modifiedIngredientList;
	}

	public void setModifiedIngredientList(List<Ingredient> modifiedIngredientList) {
		this.modifiedIngredientList = modifiedIngredientList;
	}

	public Set<Integer> compareDefaultWithUserChosenEdits() {
		return defaultIngredientIdSet;
	}

	public Set<Integer> getDefaultIngredientIdSet() {
		return defaultIngredientIdSet;
	}

	public Set<Integer> getModifiedIngredientIdSet() {
		return modifiedIngredientIdSet;
	}

	public void clearAllLists() {
		itemIdList.clear();
		ingredientIdList.clear();
		defaultIngredientIdSet.clear();
		modifiedIngredientIdSet.clear();
		modifiedIngredientList.clear();
		editedMenuItems.clear();
	}

	public void ingredientIdListCreator(Integer ingredientID) {
		ingredientIdList.add(ingredientID);
	}

	// This is used when checked checkboxes are collected and added to this Set
	public void ingredientIdSetCreator(Integer ingredientID) {
		modifiedIngredientIdSet.add(ingredientID);
	}

	public void addToModifiedIngredientList(Ingredient ingredient) {
		modifiedIngredientList.add(ingredient);
	}

	public ArrayList<Integer> getItemIdList() {
		return itemIdList;
	}

	public void setItemIdList(ArrayList<Integer> itemList) {
		this.itemIdList = itemList;
	}

	public ArrayList<Integer> getIngredientIdList() {
		return ingredientIdList;
	}

	public void setIngredientIdList(ArrayList<Integer> ingredientIdList) {
		this.ingredientIdList = ingredientIdList;
	}

}