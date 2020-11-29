package com.project.dbms.model;

public class PaymentMade {

    private String customerid;
    private int paymentid;

    public int getPaymentid(){
        return this.paymentid;
    }

    public String getCustomerid(){
        return this.customerid;
    }


    public void setPaymentid(int paymentid){
        this.paymentid=paymentid;
    }

    public void setCustomerid(String customerid){
        this.customerid=customerid;
    }
}
