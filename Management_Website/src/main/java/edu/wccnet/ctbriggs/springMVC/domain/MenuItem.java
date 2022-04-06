package edu.wccnet.ctbriggs.springMVC.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="menu_item")
public class MenuItem {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "item_id")
	private int id;
	@Column(name = "item_name")
	private String name;
	@Column(name = "item_description")
	private String description;
	@Column(name = "item_category")
	private String category;
	@Column(name = "item_stock")
	private int stock;
	@Column(name = "item_price")
	private double price;
	@Column(name = "is_active")
	private int isActive;
	public MenuItem() {
	}
	public MenuItem(String name, String description, String category, int stock, double price, int isActive) {
		super();
		this.name = name;
		this.description = description;
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
		return "MenuItem [id=" + id + ", name=" + name + ", description=" + description + ", category=" + category
				+ ", stock=" + stock + ", price=" + price + ", isActive=" + isActive + "]";
	}
	

}
