package edu.wccnet.ctbriggs.springMVC.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="order_info")
public class Order {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "order_id")
	private int id;
	@Column(name="order_date")
	private String date;
	@Column(name="order_subtotal")
	private Double subtotal;
	@Column(name="order_tax")
	private Double tax;
	@Column(name="order_total")
	private Double total;
	@Column(name="order_type")
	private String orderType;
	@Column(name="table_number")
	private String tableNumber;
	@Column(name="is_open")
	private Integer isOpen;
	
	@OneToMany(mappedBy = "order", cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.PERSIST }, fetch = FetchType.LAZY)
	@JsonIgnore
	private List<ItemOrdered> itemsOrdered;
	
	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.PERSIST })
	@JoinColumn(name = "user_id")
	private User user;
	
	public void addItemsOrdered(ItemOrdered itemOrdered) {
		itemsOrdered.add(itemOrdered);
		itemOrdered.setOrder(this);
	}
	
	public void removeItemsOrdered(ItemOrdered itemOrdered) {
		itemsOrdered.remove(itemOrdered);
	}
	
	public Order() {
	}

	public Order(int userId, String date, Double subtotal, Double tax, Double total, String orderType,
			String tableNumber, Integer isOpen, List<ItemOrdered> itemsOrdered) {
		super();
		this.date = date;
		this.subtotal = subtotal;
		this.tax = tax;
		this.total = total;
		this.orderType = orderType;
		this.tableNumber = tableNumber;
		this.isOpen = isOpen;
		this.itemsOrdered = itemsOrdered;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}



	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}

	public Double getTax() {
		return tax;
	}

	public void setTax(Double tax) {
		this.tax = tax;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getTableNumber() {
		return tableNumber;
	}

	public void setTableNumber(String tableNumber) {
		this.tableNumber = tableNumber;
	}

	public int getIsOpen() {
		return isOpen;
	}

	public void setIsOpen(Integer isOpen) {
		this.isOpen = isOpen;
	}

	public List<ItemOrdered> getItemsOrdered() {
		return itemsOrdered;
	}

	public void setItemsOrdered(List<ItemOrdered> itemsOrdered) {
		this.itemsOrdered = itemsOrdered;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", date=" + date + ", subtotal=" + subtotal + ", tax=" + tax
				+ ", total=" + total + ", orderType=" + orderType + ", tableNumber=" + tableNumber + ", isOpen="
				+ isOpen + ", itemsOrdered=" + itemsOrdered + "]";
	}
	
	
	
	
}