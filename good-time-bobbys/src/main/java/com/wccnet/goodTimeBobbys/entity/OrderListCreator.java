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
	
	
//	ArrayList<Object> fullOrderBuilder = new ArrayList<>();
//	ArrayList<Object> fullOrder = new ArrayList<>();
	
//	public void addItemToOrder(int orderID, int itemNumber, int menuItemID, int ingredientID, int modification) {
//		ItemOrdered itemOrdered = new ItemOrdered();
//		itemOrdered.setIngredientId(ingredientID);
//		itemOrdered.setItemNumber(itemNumber);
//		itemOrdered.setMenuItemId(menuItemID);
//		itemOrdered.setModification(modification);
//		itemOrdered.setOrderId(orderID);
//	}

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



	public void ingredientIdListCreator(Integer ingredientID) {
		ingredientIdList.add(ingredientID);
	}

	// This is used when checked checkboxes are collected and added to this Set
	public void ingredientIdSetCreator(Integer ingredientID) {
		modifiedIngredientIdSet.add(ingredientID);
	}
	
	public void modifiedIngredientList(Ingredient ingredient) {
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
