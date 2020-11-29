package com.project.dbms.model;

public class Variety {
    
    private int categoryid;
    private String varietyName;

    public int getCategoryid(){
        return this.categoryid;
    }

    public String getVarietyName(){
        return this.varietyName;
    }

    public void setCategoryid(int categoryid){
        this.categoryid=categoryid;
    }

    public void setVarietyName(String varietyName){
        this.varietyName=varietyName;
    }
}
