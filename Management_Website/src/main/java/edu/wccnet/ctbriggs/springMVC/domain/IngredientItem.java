package edu.wccnet.ctbriggs.springMVC.domain;



public class IngredientItem {
	private String name;
	private String category;
	private double price;	//change to better money based datatype
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	
	
}
