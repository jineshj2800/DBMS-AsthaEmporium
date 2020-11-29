package com.project.dbms.model;

public class Cart {
    private String customerid;
    private int productid;
    private int quantity;

    private Product product;

    public String getCustomerID(){
        return this.customerid;
    }

    public int getQuantity(){
        return this.quantity;
    }

    public int getProductid(){
        return this.productid;
    }

    public Product getProduct(){
        return this.product;
    }

    public void setCustomerID(String customerid){
        this.customerid=customerid;
    }

    public void setQuantity(int quantity){
        this.quantity=quantity;
    }

    public void setProductid(int productid){
        this.productid=productid;
    }

    public void setProduct(Product product){
        this.product=product;
    }
}
