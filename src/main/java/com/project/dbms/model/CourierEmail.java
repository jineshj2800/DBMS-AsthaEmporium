package com.project.dbms.model;

public class CourierEmail {

    private String email;
    private int courierid;

    public int getCourierid(){
        return this.courierid;
    }

    public String getEmail(){
        return this.email;
    }

    public void setCourierid(int courierid){
        this.courierid=courierid;
    }

    public void setEmail(String email){
        this.email=email;
    }
}
