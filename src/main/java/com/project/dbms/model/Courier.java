package com.project.dbms.model;

import java.util.List;

public class Courier {
    
    private int courierid;
    private String name;
    private String shopNo;
    private String locality;
    private String city;

    private List<String> contact;
    private List<String> email;

    //GETTERS
    public int getCourierid(){
        return this.courierid;
    }

    public String getName(){
        return this.name;
    }

    public String getShopNo(){
        return this.shopNo;
    }

    public String getLocality(){
        return this.locality;
    }

    public String getCity(){
        return this.city;
    }

    public List<String> getContact(){
        return this.contact;
    }

    public List<String> getEmail(){
        return this.email;
    }

    
    //SETTERS
    public void setCourierid(int courierid){
        this.courierid=courierid;
    }

    public void setName(String name){
        this.name=name;
    }

    public void setShopNo(String shopNo){
        this.shopNo=shopNo;
    }

    public void setLocality(String locality){
        this.locality=locality;
    }

    public void setCity(String city){
        this.city=city;
    }

    public void setContact(List<String> contact){
        this.contact=contact;
    }

    public void setEmail(List<String> email){
        this.email=email;
    }
}
