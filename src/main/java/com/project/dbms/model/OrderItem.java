package com.project.dbms.model;

public class OrderItem {
    
    private int itemid;
    private int orderid;
    private int quantity;
    private int productid;

    //GETTERS
    public int getItemid(){
        return this.itemid;
    }

    public int getOrderid() {
        return this.orderid;
    }

    public int getQuantity(){
        return this.quantity;
    }

    public int getProductid(){
        return this.productid;
    }

    //SETTERS
    public void setItemid(int itemid){
        this.itemid=itemid;
    }

    public void setOrderid(int orderid) {
        this.orderid=orderid;
    }

    public void setQuantity(int quantity){
        this.quantity=quantity;
    }

    public void setProductid(int productid){
        this.productid=productid;
    }
}
