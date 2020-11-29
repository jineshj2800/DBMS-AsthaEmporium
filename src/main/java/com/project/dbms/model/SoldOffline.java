package com.project.dbms.model;

public class SoldOffline {
    
    private int productid;
    private int saleid;
    private int quantity;

    public int getProductid(){
        return this.productid;
    }

    public int getSaleid(){
        return this.saleid;
    }

    public int getQuantity(){
        return this.quantity;
    }


    public void setProductid(int productid){
        this.productid=productid;
    }

    public void setSaleid(int saleid){
        this.saleid=saleid;
    }

    public void setQuantity(int quantity){
        this.quantity=quantity;
    }

}
