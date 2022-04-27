package com.wccnet.goodTimeBobbys.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OrderColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.lang.Nullable;

import com.wccnet.goodTimeBobbys.dao.IIngredientDAO;

@Entity
@Table(name = "item_ordered")
//@IdClass(ItemOrdered.class)
public class ItemOrdered implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.PERSIST })
	@JoinColumn(name = "order_id")
	@OrderColumn(name = "order_id")
	private OrderInfo orderInfo;

	// This differentiates one "burger" from the next (in case they both have the
	// same topping)
	@Column(name = "item_number")
	private int itemNumber;

	@Id
	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.PERSIST })
	@JoinColumn(name = "menu_item")
	private MenuItem menuItem;

	@Nullable
	@Column(name = "ingredient_id")
	private Integer ingredientId;

	// This is a True = 1, False = 0

	@Column(name = "modification")
	private Integer modification;

	@Override
	public int hashCode() {
		return Objects.hash(orderInfo, itemNumber, menuItem, ingredientId, modification);
	}

	@Transient
	private String menuItemName;

	public String getMenuItemName() {
		return menuItem.getItemName();
	}

	public ItemOrdered() {

	}

	public ItemOrdered(OrderInfo orderInfo, Integer itemNumber, MenuItem menuItem, Integer ingredientId,
			Integer modification) {
		super();
		this.orderInfo = orderInfo;
		this.itemNumber = itemNumber;
		this.menuItem = menuItem;
		this.ingredientId = ingredientId;
		this.modification = modification;
	}

	public ItemOrdered(OrderInfo orderInfo, Integer itemNumber, MenuItem menuItem) {
		super();
		this.orderInfo = orderInfo;
		this.itemNumber = itemNumber;
		this.menuItem = menuItem;
	}

	public Integer getItemNumber() {
		return itemNumber;
	}

	public void setItemNumber(Integer itemNumber) {
		this.itemNumber = itemNumber;
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

	public OrderInfo getOrderInfo() {
		return orderInfo;
	}

	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}

	public MenuItem getMenuItem() {
		return menuItem;
	}

	public void setMenuItem(MenuItem menuItem) {
		this.menuItem = menuItem;
	}

	@Override
	public String toString() {
		return "&nbsp;&nbsp; " + ((modification != null) ? ((modification == 1) ? "+" : "-") : "")
				+ ((ingredientId != null) ? " " : "");
	}

	// ((modification == 1) ? "Added" : "Removed")
	// ((modification != null) ? (modification == 1) ? "Added" : "Removed") : null)
	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (!(o instanceof ItemOrdered))
			return false;
		ItemOrdered itemOrdered = (ItemOrdered) o;
		return Objects.equals(orderInfo, itemOrdered.orderInfo) && Objects.equals(itemNumber, itemOrdered.itemNumber)
				&& Objects.equals(menuItem, itemOrdered.menuItem)
				&& Objects.equals(ingredientId, itemOrdered.ingredientId)
				&& Objects.equals(modification, itemOrdered.modification);
	}

}