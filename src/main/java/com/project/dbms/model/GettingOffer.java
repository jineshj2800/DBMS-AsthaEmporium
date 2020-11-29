package com.project.dbms.model;

public class GettingOffer {
    
    private int offerid;
    private String customerID;

    public String getCustomerID(){
        return this.customerID;
    }

    public int getOfferid(){
        return this.offerid;
    }

    public void setCustomerID(String customerID){
        this.customerID=customerID;
    }

    public void setOfferid(int offerid){
        this.offerid=offerid;
    }
}
