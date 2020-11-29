package com.project.dbms.model;

import java.sql.Date;
import java.util.List;

public class OfflineSale {
    
    private int saleid;
    private String cName;
    private int bill;
    private Date date;
    private int paymentid;
    private List<Product> items;

    private String mode;

    //GETTERS
    public int getSaleid(){
        return this.saleid;
    }

    public String getcName(){
        return this.cName;
    }

    public int getBill(){
        return this.bill;
    }

    public Date getDate(){
        return this.date;
    }

    public int getPaymentid(){
        return this.paymentid;
    }

    public List<Product> getItems(){
        return this.items;
    }


    public String getMode(){
        return this.mode;
    }

    //SETTERS
    public void setSaleid(int saleid){
        this.saleid=saleid;
    }

    public void setcName(String cName){
        this.cName=cName;
    }

    public void setBill(int bill){
        this.bill=bill;
    }

    public void setDate(Date date){
        this.date=date;
    }

    public void setPaymentid(int paymentid){
        this.paymentid=paymentid;
    }

    public void setItems(List<Product> items){
        this.items=items;
    }

    public void setMode(String mod){
        this.mode=mod;
    }

}
