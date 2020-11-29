package com.project.dbms.model;

public class SupplierEmail {

    private String email;
    private int supplierid;

    public int getSupplierid(){
        return this.supplierid;
    }

    public String getEmail(){
        return this.email;
    }

    public void setSupplierid(int supplierid){
        this.supplierid=supplierid;
    }

    public void setEmail(String email){
        this.email=email;
    }

}
