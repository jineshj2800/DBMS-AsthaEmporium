package com.project.dbms.model;

import java.sql.Date;

public class Payment {
    
    private int paymentid;
    private int amount;
    private String mode;
    private Date date;

    //GETTERS
    public int getPaymentid() {
        return this.paymentid;
    }

    public int getAmount(){
        return this.amount;
    }

    public String getMode(){
        return this.mode;
    }

    public Date getDate(){
        return this.date;
    }

    //SETTERS
    public void setPaymentid(int paymentid) {
        this.paymentid=paymentid;
    }

    public void setAmount(int amount){
        this.amount=amount;
    }

    public void setMode(String mode){
        this.mode=mode;
    }

    public void setDate(Date date){
        this.date=date;
    }
    
}
