package com.project.dbms.model;

import java.sql.Date;

public class BuyingDetail {
    
    private int purchaseid;
    private int bill;
    private String desc;
    private Date date;
    private int supplierid;
    private int paymentid;
    private Supplier supplier;
    private Payment payment;

    public int getPurchaseid(){
        return this.purchaseid;
    } 

    public int getSupplierid(){
        return this.supplierid;
    }

    public String getDesc(){
        return this.desc;
    }

    public int getBill(){
        return this.bill;
    }

    public int getPaymentid(){
        return this.paymentid;
    }

    public Date getDate(){
        return this.date;
    }

    public Supplier getSupplier(){
        return this.supplier;
    }

    public Payment getPayment(){
        return this.payment;
    }


    public void setPurchaseid(int purchaseid){
        this.purchaseid=purchaseid;
    }

    public void setSupplierid(int supplierid){
        this.supplierid=supplierid;
    }

    public void setDesc(String desc){
        this.desc=desc;
    }

    public void setBill(int bill){
        this.bill=bill;
    }
    
    public void setPaymentid(int paymentid){
        this.paymentid=paymentid;
    }

    public void setDate(Date date){
        this.date=date;
    }

    public void setSupplier(Supplier supplier){
        this.supplier=supplier;
    }

    public void setPayment(Payment payment){
        this.payment=payment;
    }

}
