package com.wccnet.goodTimeBobbys.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "checkout")
public class Checkout {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ticket_id")
    private int ticketId;
    

    @Column(name = "user_id")
    private int userId;
    

    @Column(name = "order_id")
    private int orderId;
    

    @Column(name = "checkout_date")
    private String checkoutDate;
    

    @Column(name = "checkout_subtotal")
    private Double checkoutSubtotal;
    

    @Column(name = "checkout_tax")
    private Double checkoutTax;
    

    @Column(name = "checkout_total")
    private Double checkoutTotal;

    public Checkout() {
        
    }

    public Checkout(int userId, int orderId, String checkoutDate, Double checkoutSubtotal, Double checkoutTax,
            Double checkoutTotal) {
        super();
        this.userId = userId;
        this.orderId = orderId;
        this.checkoutDate = checkoutDate;
        this.checkoutSubtotal = checkoutSubtotal;
        this.checkoutTax = checkoutTax;
        this.checkoutTotal = checkoutTotal;
    }

    @Override
    public String toString() {
        return "{ Checkout } \nTicket Id: " + ticketId + " \nUser ID: " + userId + "\nOrder ID: " + orderId + "\nCheckout Date: "
                + checkoutDate + "\nCheckout Subtotal: " + checkoutSubtotal + "\nCheckout Tax: " + checkoutTax
                + "\nCheckout Total: " + checkoutTotal;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(String checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public Double getCheckoutSubtotal() {
        return checkoutSubtotal;
    }

    public void setCheckoutSubtotal(Double checkoutSubtotal) {
        this.checkoutSubtotal = checkoutSubtotal;
    }

    public Double getCheckoutTax() {
        return checkoutTax;
    }

    public void setCheckoutTax(Double checkoutTax) {
        this.checkoutTax = checkoutTax;
    }

    public Double getCheckoutTotal() {
        return checkoutTotal;
    }

    public void setCheckoutTotal(Double checkoutTotal) {
        this.checkoutTotal = checkoutTotal;
    }    

}
