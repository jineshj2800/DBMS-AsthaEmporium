package com.project.dbms.model;

import java.util.List;

public class Supplier {
    
    private int supplierid;
    private String name;
    private String desc;
    private String shopNo;
    private String locality;
    private String city;
    private Integer bankid;

    private List<String> contact;
    private List<String> email;
    private BankDetails bank;

    //GETTERS
    public int getSupplierid(){
        return this.supplierid;
    }

    public String getName(){
        return this.name;
    }

    public String getDesc(){
        return this.desc;
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

    public Integer getBankid(){
        return this.bankid;
    }

    public List<String> getContact(){
        return this.contact;
    }

    public List<String> getEmail(){
        return this.email;
    }

    public BankDetails getBank(){
        return this.bank;
    }

    
    //SETTERS
    public void setSupplierid(int supplierid){
        this.supplierid=supplierid;
    }

    public void setName(String name){
        this.name=name;
    }

    public void setDesc(String desc){
        this.desc=desc;
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

    public void setBankid(Integer bankid){
        this.bankid=bankid;
    }

    public void setContact(List<String> contact){
        this.contact=contact;
    }

    public void setEmail(List<String> email){
        this.email=email;
    }

    public void setBank(BankDetails bank){
        this.bank = bank;
    }
}
