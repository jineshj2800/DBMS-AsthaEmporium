package com.project.dbms.model;

import java.sql.Date;

public class Offer {
    
    private String offerid;
    private String desc;
    private String discount;
    private Date expiryDate;

	//GETTERS
    public String getOfferid(){
        return this.offerid;
    }

    public String getDesc(){
        return this.desc;
    }

    public String getDiscount(){
        return this.discount;
    }

    public Date getExpiryDate(){
        return this.expiryDate;
    }


    //SETTERS
    public void setOfferid(String offerid){
        this.offerid=offerid;
    }

    public void setDesc(String desc){
        this.desc=desc;
    }

    public void setDiscount(String discount){
        this.discount=discount;
    }

    public void setExpiryDate(Date expiryDate){
        this.expiryDate = expiryDate;
    }
}
