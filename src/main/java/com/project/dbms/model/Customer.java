package com.project.dbms.model;

import java.util.List;

public class Customer {

    private String customerID;
    private String fName;
    private String mName;
    private String lName;
    private String gender;
    private String email;
    private String password;
    private String houseNo;
    private String street;
    private String city;

    private List<String> contact;
    //GETTERS
    public String getCustomerID(){
        return this.customerID;
    }

    public String getfName(){
        return this.fName;
    }

    public String getmName(){
        return this.mName;
    }

    public String getlName(){
        return this.lName;
    }

    public String getGender(){
        return this.gender;
    }

    public String getEmail(){
        return this.email;
    }

    public String getPassword(){
        return this.password;
    }

    public String getHouseNo(){
        return this.houseNo;
    }

    public String getStreet(){
        return this.street;
    }

    public String getCity(){
        return this.city;
    }

    public List<String> getContact(){
        return this.contact;
    }

    
    //SETTERS
    public void setCustomerID(String customerID){
        this.customerID=customerID;
    }

    public void setfName(String fName){
        this.fName=fName;
    }

    public void setmName(String mName){
        this.mName=mName;
    }

    public void setlName(String lName){
        this.lName=lName;
    }

    public void setGender(String gender){
        this.gender=gender;
    }

    public void setEmail(String email){
        this.email=email;
    }

    public void setPassword(String password){
        this.password=password;
    }

    public void setHouseNo(String houseNo){
        this.houseNo=houseNo;
    }

    public void setStreet(String street){
        this.street=street;
    }

    public void setCity(String city){
        this.city=city;
    }

    public void setContact(List<String> contact){
        this.contact=contact;
    }

}
