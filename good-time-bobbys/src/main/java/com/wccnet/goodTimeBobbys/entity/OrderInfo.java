package com.wccnet.goodTimeBobbys.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
<<<<<<< HEAD

//@Entity
//@Table(name = "order_info")
public class OrderInfo {

//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "order_id")
//	private int orderId;
//
//	// One User to many Orders
//	@Column(name = "user_id")
//	private int userId;
//
//	// pass in NOW() to the database to get the correct format - this returns a String
//	@Column(name = "order_date")
//	private String orderDate;
//
//	//To get this value - add all of the prices of the MenuItems on the order
//	@Column(name = "order_subtotal")
//	private Double orderSubtotal;
//
//	//To get this value - multiply the order by .06
//	@Column(name = "order_tax")
//	private Double orderTax;
//
//	//To get this value - add the orderSubtotal and the orderTax
//	@Column(name = "order_total")
//	private Double orderTotal;
//	
//	//This is in-store, pick-up, or delivery
//	@Column(name = "order_type")
//	private String orderType;
//	
//	//This is the table # for in-store orders
//	@Column(name = "table_number")
//	private String tableNumber;
//
//	public OrderInfo() {
//
//	}
//
//	/**
//	 * @param userId
//	 * @param order_date
//	 * @param order_subtotal
//	 * @param orderTax
//	 * @param orderTotal
//	 * @param orderType
//	 */
//	public OrderInfo(int userId, String orderDate, Double orderSubtotal, Double orderTax, Double orderTotal,
//			String orderType) {
//		super();
//		this.userId = userId;
//		this.orderDate = orderDate;
//		this.orderSubtotal = orderSubtotal;
//		this.orderTax = orderTax;
//		this.orderTotal = orderTotal;
//		this.orderType = orderType;
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
//	public String getOrderType() {
//		return orderType;
//	}
//
//	public void setOrderType(String orderType) {
//		this.orderType = orderType;
//	}
//
//	public int getUserId() {
//		return userId;
//	}
//
//	public void setUserId(int userId) {
//		this.userId = userId;
//	}
//
//	public String getOrder_date() {
//		return orderDate;
//	}
//
//	public void setOrder_date(String orderDate) {
//		this.orderDate = orderDate;
//	}
//
//	public Double getOrder_subtotal() {
//		return orderSubtotal;
//	}
//
//	public void setOrder_subtotal(Double orderSubtotal) {
//		this.orderSubtotal = orderSubtotal;
//	}
//
//	public Double getOrderTax() {
//		return orderTax;
//	}
//
//	public void setOrderTax(Double orderTax) {
//		this.orderTax = orderTax;
//	}
//
//	public Double getOrderTotal() {
//		return orderTotal;
//	}
//
//	public void setOrderTotal(Double orderTotal) {
//		this.orderTotal = orderTotal;
//	}
//	
//	
//
//	public String getTableNumber() {
//		return tableNumber;
//	}
//
//	public void setTableNumber(String tableNumber) {
//		this.tableNumber = tableNumber;
//	}
//
//	@Override
//	public String toString() {
//		return " { OrderInfo } Order ID: " + orderId + " /nUser ID: " + userId + " /nOrder Date: " + orderDate
//				+ " /nOrder Subtotal: " + orderSubtotal + " /nOrder Tax: " + orderTax + " /nOrder Total: " + orderTotal
//				+ " /nOrder Type: " + orderType + " /nTable Number: " + tableNumber;
//	}

}
=======
@Entity
@Table(name = "order_info")
public class OrderInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private int orderId;

    // One user to many orders
    @Column(name = "user_id")
    private int userId;

    // pass in NOW() to the database to get correct format - returns a string
    @Column(name = "order_date")
    private String orderDate;

    // to get this value = add all of the prices of the MenuItems on the orders
    @Column(name = "order_subtotal")
    private Double orderSubtotal;

    //multiply order by .06
    @Column(name = "order_tax")
    private Double orderTax;

    //add order subtotal and tax
    @Column(name = "order_total")
    private Double orderTotal;

    //in-store, pickup or delivery
    @Column(name = "order_type")
    private String orderType;
    
    @Column(name="table_number")
    private String tableNumber;

    public OrderInfo() {

    }

    /**
     * @param userId
     * @param order_date
     * @param order_subtotal
     * @param orderTax
     * @param orderTotal
     * @param orderType
     */
    public OrderInfo(int userId, String order_date, Double order_subtotal, Double orderTax, Double orderTotal,
            String orderType) {
        super();
        this.userId = userId;
        this.orderDate = order_date;
        this.orderSubtotal = order_subtotal;
        this.orderTax = orderTax;
        this.orderTotal = orderTotal;
        this.orderType = orderType;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getOrder_date() {
        return orderDate;
    }

    public void setOrder_date(String order_date) {
        this.orderDate = order_date;
    }

    public Double getOrder_subtotal() {
        return orderSubtotal;
    }

    public void setOrder_subtotal(Double order_subtotal) {
        this.orderSubtotal = order_subtotal;
    }

    public Double getOrderTax() {
        return orderTax;
    }

    public void setOrderTax(Double orderTax) {
        this.orderTax = orderTax;
    }

    public Double getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(Double orderTotal) {
        this.orderTotal = orderTotal;
    }

    @Override
    public String toString() {
        return " { OrderInfo } orderId= " + orderId + " /nuserId=" + userId + " /nOrder Date=" + orderDate
                + " /nOrder Subtotal=" + orderSubtotal + " /nOrder Tax=" + orderTax + " /nOrder Total=" + orderTotal
                + " /nOrder Type=" + orderType;
    }

	public String getTableNumber() {
		return tableNumber;
	}

	public void setTableNumber(String tableNumber) {
		this.tableNumber = tableNumber;
	}

}
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
