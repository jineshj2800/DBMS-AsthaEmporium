package com.project.dbms.model;

public class CourierContact {
    
    private String contact;
    private int courierid;

    public int getCourierid(){
        return this.courierid;
    }

    public String getContact(){
        return this.contact;
    }

    public void setCourierid(int courierid){
        this.courierid=courierid;
    }

    public void setContact(String contact){
        this.contact=contact;
    }
}
