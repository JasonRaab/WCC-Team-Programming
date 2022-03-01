package edu.wccnet.ctbriggs.springMVC.domain;

public class Stock {

    private String category;
    private String item;
    
    private double stock;
    private double ucAmount;
    private String mStock;
    
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
    public double getUcAmount() {
        return ucAmount;
    }
    public void setUcAmount(double ucAmount) {
        this.ucAmount = ucAmount;
    }
    public String getMStock() {
        return mStock;
    }
    public void setMStock(String mStock) {
        this.mStock = mStock;
    }
}