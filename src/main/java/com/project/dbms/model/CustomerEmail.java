package com.project.dbms.model;

public class CustomerEmail {

    private String email;
    private String customerid;

    public String getCustomerid(){
        return this.customerid;
    }

    public String getEmail(){
        return this.email;
    }

    public void setCustomerid(String customerid){
        this.customerid=customerid;
    }

    public void setEmail(String email){
        this.email=email;
    }
}
