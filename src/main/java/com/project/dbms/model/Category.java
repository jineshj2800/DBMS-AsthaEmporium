package com.project.dbms.model;

public class Category {
    
    private int categoryid;
    private String name;
    private String variety;

    //GETTERS
    public int getCategoryid(){
        return this.categoryid;
    }

    public String getName(){
        return this.name;
    }

    public String getVariety(){
        return this.variety;
    }

    //SETTERS
    public void setCategoryid(int categoryid){
        this.categoryid=categoryid;
    }

    public void setName(String name){
        this.name=name;
    }

    public void setVariety(String variety){
        this.variety=variety;
    }
}
