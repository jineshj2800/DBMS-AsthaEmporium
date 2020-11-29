package com.project.dbms.model;

public class CustomerContact {
    
    private String contact;
    private String customerid;

    public String getCustomerid(){
        return this.customerid;
    }

    public String getContact(){
        return this.contact;
    }

    public void setCustomerid(String customerid){
        this.customerid=customerid;
    }

    public void setContact(String contact){
        this.contact=contact;
    }
}
