package com.wccnet.goodTimeBobbys.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Component;

@Component
public class OrderListCreator {

	ArrayList<Integer> itemIdList = new ArrayList<>();
	ArrayList<Integer> ingredientIdList = new ArrayList<>();
	

	Set<Integer> defaultIngredientIdList = new HashSet<>();
	Set<Integer> modifyIngredientIdList = new HashSet<>();
	
	
	public Set<Integer> getDefaultIngredientIdList() {
		return defaultIngredientIdList;
	}

	public Set<Integer> getModifyIngredientIdList() {
		return modifyIngredientIdList;
	}

	//change to MenuItemListCreator(Integer itemID)
	public void listCreator(Integer itemID) {
		itemIdList.add(itemID);
	}
	
	public void ingredientIdListCreator(Integer ingredientID) {
		ingredientIdList.add(ingredientID);
	}	
	
	//This is used when checked checkboxes are collected and added to this Set
	public void ingredientIdSetCreator(Integer ingredientID) {
		modifyIngredientIdList.add(ingredientID);
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
