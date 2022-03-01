package edu.wccnet.ctbriggs.springMVC.domain;

import java.io.File;

public class MenuItem {

	private String name;
	private String description;
	private String category;
	private double price;	//change to better money based datatype
	private String[] ingredients;
	private File Image;	//check proper way to upload image with jsp
	
	public File getImage() {
		return Image;
	}
	public void setImage(File image) {
		Image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public String[] getIngredients() {
		return ingredients;
	}
	public void setIngredients(String[] ingredients) {
		this.ingredients = ingredients;
	}
}
