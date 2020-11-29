package com.project.dbms.model;

public class SupplierContact {
    
    private String contact;
    private int supplierid;

    public int getSupplierid(){
        return this.supplierid;
    }

    public String getContact(){
        return this.contact;
    }

    public void setSupplierid(int supplierid){
        this.supplierid=supplierid;
    }

    public void setContact(String contact){
        this.contact=contact;
    }
}
