package edu.wccnet.ctbriggs.springMVC.domain;

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
    private double stock;
/*	 TODO: Figure out how to deal with the two following variables
	 Hibernate requires all variables in an entity class to be linked to a column in the table
	 ucAmount is derived from looking at orders and finding the sum of ingredients used.
	 It might be best to put that off for now.
	 */
//   private double ucAmount;
//   private String mStock;
    
 

    public Stock() {}
	public Stock(String category, String item, double stock) {
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
    public double getStock() {
        return stock;
    }
    public void setStock(double stock) {
        this.stock = stock;
    }
	@Override
	public String toString() {
		return "Stock [id=" + id + ", category=" + category + ", item=" + item + ", stock=" + stock + "]";
	}

}