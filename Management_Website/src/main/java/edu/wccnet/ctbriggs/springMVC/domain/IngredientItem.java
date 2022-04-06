package edu.wccnet.ctbriggs.springMVC.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ingredient")
public class IngredientItem {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ingredient_id")
	private int id;
	@Column(name = "ingredient_name")
	private String name;
	@Column(name = "ingredient_category")
	private String category;
	@Column(name = "ingredient_stock")
	private int stock;
	@Column(name = "ingredient_price")
	private double price;
	@Column(name = "is_active")
	private int isActive;
	public IngredientItem() {
	}
	public IngredientItem(String name, String category, int stock, double price, int isActive) {
		super();
		this.name = name;
		this.category = category;
		this.stock = stock;
		this.price = price;
		this.isActive = isActive;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	@Override
	public String toString() {
		return "IngredientItem [id=" + id + ", name=" + name + ", category=" + category + ", stock=" + stock
				+ ", price=" + price + ", isActive=" + isActive + "]";
	}
	
	
	

}
