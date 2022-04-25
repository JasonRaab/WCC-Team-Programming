package edu.wccnet.goodTimeBobbys.management.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ingredient")
public class Stock {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ingredient_id")
	private int id;
	@Column(name = "ingredient_category")
    private String category;
	@Column(name = "ingredient_name")
    private String item;
	@Column(name = "ingredient_stock")
    private int stock;
    
 

    public Stock() {}
	public Stock(String category, String item, int stock) {
	super();
	this.category = category;
	this.item = item;
	this.stock = stock;
}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public String getItem() {
        return item;
    }
    public void setItem(String item) {
        this.item = item;
    }
    public int getStock() {
        return stock;
    }
    public void setStock(int stock) {
        this.stock = stock;
    }
	@Override
	public String toString() {
		return "Stock [id=" + id + ", category=" + category + ", item=" + item + ", stock=" + stock + "]";
	}

}