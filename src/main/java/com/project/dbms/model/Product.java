package com.project.dbms.model;

public class Product {

    private int productid;
    private String pName;
    private String type;
    private String desc;
    private String color;
    private String size;
    private String brand;
    private String photo;
    private int cost;
    private int discount;
    private int sellprice;
    private int quantity;
    private int categoryid;
    private int supplierid;

    private boolean incart;


    //GETTERS
    public int getProductid(){
        return this.productid;
    }

    public String getpName(){
        return this.pName;
    }

    public String getType(){
        return this.type;
    }

    public String getDesc(){
        return this.desc;
    }

    public String getColor(){
        return this.color;
    }

    public String getSize(){
        return this.size;
    }

    public String getBrand(){
        return this.brand;
    }

    public String getPhoto(){
        return this.photo;
    }

    public int getCost(){
        return this.cost;
    }

    public int getDiscount(){
        return this.discount;
    }

    public int getsellprice(){
        return this.sellprice;
    }

    public int getQuantity(){
        return this.quantity;
    }

    public int getCategoryid(){
        return this.categoryid;
    }

    public int getSupplierid(){
        return this.supplierid;
    }

    public boolean getIncart(){
        return this.incart;
    }


    //SETTERS
    public void setProductid(int productid){
        this.productid=productid;
    }

    public void setpName(String pName){
        this.pName=pName;
    }

    public void setType(String type){
        this.type=type;
    }

    public void setDesc(String desc){
        this.desc=desc;
    }

    public void setColor(String color){
        this.color=color;
    }

    public void setSize(String size){
        this.size=size;
    }

    public void setBrand(String brand){
        this.brand=brand;
    }

    public void setPhoto(String photo){
        this.photo=photo;
    }

    public void setCost(int cost){
        this.cost=cost;
    }

    public void setDiscount(int discount){
        this.discount=discount;
    }

    public void setsellprice(int sellprice){
        this.sellprice=sellprice;
    }

    public void setQuantity(int quantity){
        this.quantity=quantity;
    }

    public void setCategoryid(int categoryid){
        this.categoryid=categoryid;
    }

    public void setSupplierid(int supplierid){
        this.supplierid=supplierid;
    }

    public void setIncart(boolean incart){
        this.incart=incart;
    }
}
