package com.wccnet.goodTimeBobbys.entity;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component
public class OrderListCreator {
	
	ArrayList<Integer> itemIdList = new ArrayList<>();
	
	public void listCreator(Integer itemID) {
		itemIdList.add(itemID);
	}

	public ArrayList<Integer> getItemList() {
		return itemIdList;
	}

	public void setItemList(ArrayList<Integer> itemList) {
		this.itemIdList = itemList;
	}

}
