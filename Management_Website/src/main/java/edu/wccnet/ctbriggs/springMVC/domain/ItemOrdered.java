package edu.wccnet.ctbriggs.springMVC.domain;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OrderColumn;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "item_ordered")
public class ItemOrdered implements Serializable{
	
	
	private static final long serialVersionUID = 1L;
	
	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "order_id")
	@OrderColumn(name = "order_id")
	@JsonIgnore
	@Id
	private Order order;

	// This differentiates one "burger" from the next (in case they both have the
	// same topping)
	@Column(name = "item_number")
	@Id
	private int itemNumber;

// One MenuItem to many ItemOrdered
	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.PERSIST })
	@JoinColumn(name = "menu_item")
	@Id
	private MenuItem menuItem;
	
	@Column(name = "ingredient_id")
	@Id
	private Integer ingredientId;
	
	@Column(name = "modification")
	@Id
	private Integer modification;
	
	public ItemOrdered() {
	}

	public ItemOrdered(Order order, int itemNumber, MenuItem menuItem, Integer ingredientId, Integer modification) {
		super();
		this.order = order;
		this.itemNumber = itemNumber;
		this.menuItem = menuItem;
		this.ingredientId = ingredientId;
		this.modification = modification;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public int getItemNumber() {
		return itemNumber;
	}

	public void setItemNumber(int itemNumber) {
		this.itemNumber = itemNumber;
	}

	public MenuItem getMenuItem() {
		return menuItem;
	}

	public void setMenuItem(MenuItem menuItem) {
		this.menuItem = menuItem;
	}

	public Integer getIngredientId() {
		return ingredientId;
	}

	public void setIngredientId(Integer ingredientId) {
		this.ingredientId = ingredientId;
	}

	public Integer getModification() {
		return modification;
	}

	public void setModification(Integer modification) {
		this.modification = modification;
	}

	@Override
	public String toString() {
		return "ItemOrdered = [ itemNumber=" + itemNumber + ", menuItem=" + menuItem
				+ ", ingredientId=" + ingredientId + ", modification=" + modification + "]";
	}
	
	

}
