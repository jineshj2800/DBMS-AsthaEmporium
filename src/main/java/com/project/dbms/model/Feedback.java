package com.project.dbms.model;

import java.sql.Date;

public class Feedback {
    
    private int feedbackid;
    private String desc;
    private int rating;
    private Date date;
    private String customerid;
    private int orderid;

    //GETTERS
    public int getFeedbackid(){
        return this.feedbackid;
    }

    public String getDesc(){
        return this.desc;
    }

    public int getRating(){
        return this.rating;
    }

    public Date getDate(){
        return this.date;
    }

    public String getCustomerid(){
        return this.customerid;
    }

    public int getOrderid(){
        return this.orderid;
    }

    //SETTERS
    public void setFeedbackid(int feedbackid){
        this.feedbackid=feedbackid;
    }

    public void setDesc(String desc){
        this.desc=desc;
    }

    public void setRating(int rating){
        this.rating=rating;
    }

    public void setDate(Date date){
        this.date=date;
    }

    public void setCustomerid(String customerid){
        this.customerid=customerid;
    }

    public void setOrderid(int orderid){
        this.orderid=orderid;
    }    

}
