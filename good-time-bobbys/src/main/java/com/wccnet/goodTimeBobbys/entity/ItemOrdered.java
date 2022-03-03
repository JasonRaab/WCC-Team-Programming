package com.wccnet.goodTimeBobbys.entity;

<<<<<<< HEAD
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

=======
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
//@Entity
//@Table(name = "item_ordered")
public class ItemOrdered {

<<<<<<< HEAD
//	// One OrderInfo to many menuItem(s)
//	@Id
//	@Column(name = "order_id")
//	private int orderId;
//
//	//This differentiates one "burger" from the next (in case they both have the same topping)
//	@Column(name = "item_number")
//	private int itemNumber;
//
//	// One MenuItem to many ItemOrdered
//	@Column(name = "menu_item_id")
//	private int menuItemId;
//
//	//Not sure how to link this up to the datebase **************************************************************
//	@Column(name = "ingredient_id")
//	private int ingredientId;
//
//	// This is a True = 1, False = 0
//	@Column(name = "modification")
//	private int modification;
//
//	public ItemOrdered() {
//
//	}
//
//	/**
//	 * @param orderId
//	 * @param itemNumber
//	 * @param menuItemId
//	 * @param ingredientId
//	 * @param modification
//	 */
//	public ItemOrdered(int orderId, int itemNumber, int menuItemId, int ingredientId, int modification) {
//		super();
//		this.orderId = orderId;
//		this.itemNumber = itemNumber;
//		this.menuItemId = menuItemId;
//		this.ingredientId = ingredientId;
//		this.modification = modification;
//	}
//
//	public int getItemNumber() {
//		return itemNumber;
//	}
//
//	public void setItemNumber(int itemNumber) {
//		this.itemNumber = itemNumber;
//	}
//
//	public int getMenuItemId() {
//		return menuItemId;
//	}
//
//	public void setMenuItemId(int menuItemId) {
//		this.menuItemId = menuItemId;
//	}
//
//	public int getIngredientId() {
//		return ingredientId;
//	}
//
//	public void setIngredientId(int ingredientId) {
//		this.ingredientId = ingredientId;
//	}
//
//	public int getModification() {
//		return modification;
//	}
//
//	public void setModification(int modification) {
//		this.modification = modification;
//	}
//
//	public int getOrderId() {
//		return orderId;
//	}
//
//	public void setOrderId(int orderId) {
//		this.orderId = orderId;
//	}
//
//	@Override
//	public String toString() {
//		return " { ItemOrdered } Order ID: " + orderId + " /nItem Number: " + itemNumber + " /nMenu Item Id: " + menuItemId
//				+ " /nIngredient ID: " + ingredientId + " /nModification: " + modification;
//	}

}
=======
//    // One OrderInfo to many menuItem(s)
//    @Id
//    @Column(name = "order_id")
//    private int orderId;
//
//    //This differentiates one "burger" from the next (in case they both have the same topping)
//    @Column(name = "item_number")
//    private int itemNumber;
//
//    // One MenuItem to many ItemOrdered
//    @Column(name = "menu_item_id")
//    private int menuItemId;
//
//    //Not sure how to link this up to the datebase **************************************************************
//    @Column(name = "ingredient_id")
//    private int ingredientId;
//
//    // This is a True = 1, False = 0
//    @Column(name = "modification")
//    private int modification;
//
//    public ItemOrdered() {
//
//    }
//
//    /**
//     * @param orderId
//     * @param itemNumber
//     * @param menuItemId
//     * @param ingredientId
//     * @param modification
//     */
//    public ItemOrdered(int orderId, int itemNumber, int menuItemId, int ingredientId, int modification) {
//        super();
//        this.orderId = orderId;
//        this.itemNumber = itemNumber;
//        this.menuItemId = menuItemId;
//        this.ingredientId = ingredientId;
//        this.modification = modification;
//    }
//
//    public int getItemNumber() {
//        return itemNumber;
//    }
//
//    public void setItemNumber(int itemNumber) {
//        this.itemNumber = itemNumber;
//    }
//
//    public int getMenuItemId() {
//        return menuItemId;
//    }
//
//    public void setMenuItemId(int menuItemId) {
//        this.menuItemId = menuItemId;
//    }
//
//    public int getIngredientId() {
//        return ingredientId;
//    }
//
//    public void setIngredientId(int ingredientId) {
//        this.ingredientId = ingredientId;
//    }
//
//    public int getModification() {
//        return modification;
//    }
//
//    public void setModification(int modification) {
//        this.modification = modification;
//    }
//
//    public int getOrderId() {
//        return orderId;
//    }
//
//    public void setOrderId(int orderId) {
//        this.orderId = orderId;
//    }
//
//    @Override
//    public String toString() {
//        return " { ItemOrdered } Order ID: " + orderId + " /nItem Number: " + itemNumber + " /nMenu Item Id: " + menuItemId
//                + " /nIngredient ID: " + ingredientId + " /nModification: " + modification;
//    }
}
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
