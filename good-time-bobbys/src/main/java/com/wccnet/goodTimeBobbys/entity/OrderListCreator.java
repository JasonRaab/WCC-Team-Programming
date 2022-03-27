package com.wccnet.goodTimeBobbys.entity;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component
public class OrderListCreator {

	ArrayList<Integer> itemIdList = new ArrayList<>();
	ArrayList<Integer> ingredientIdList = new ArrayList<>();
	
	
	//change to MenuItemListCreator(Integer itemID)
	public void listCreator(Integer itemID) {
		itemIdList.add(itemID);
	}
	
	public void ingredientIdListCreator(Integer ingredientID) {
		ingredientIdList.add(ingredientID);
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
