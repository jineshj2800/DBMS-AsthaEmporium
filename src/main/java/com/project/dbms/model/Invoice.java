package com.project.dbms.model;

import java.sql.Date;
import java.sql.Time;

public class Invoice {
    
    private int invoiceid;
    private int tax;
    private int amount;
    private int discount;
    private Date date;
    private Time time;
    private String customerid;

    //GETTERS
    public int getInvoiceid(){
        return this.invoiceid;
    }

    public int getAmount(){
        return this.amount;
    }

    public int getTax(){
        return this.tax;
    }

    public int getDiscount(){
        return this.discount;
    }

    public Date getDate(){
        return this.date;
    }

    public Time getTime(){
        return this.time;
    }

    public String getCustomerid(){
        return this.customerid;
    }


    //SETTERS
    public void setInvoiceid(int invoiceid){
        this.invoiceid=invoiceid;
    }

    public void setAmount(int amount){
        this.amount=amount;
    }

    public void setTax(int tax){
        this.tax=tax;
    }

    public void setDiscount(int discount){
        this.discount=discount;
    }

    public void setDate(Date date){
        this.date=date;
    }

    public void setTime(Time time){
        this.time=time;
    }

    public void setCustomerid(String customerid){
        this.customerid=customerid;
    }

}
