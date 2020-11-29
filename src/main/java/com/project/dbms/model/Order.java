package com.project.dbms.model;

import java.sql.Date;

public class Order {
 
    private int orderid;
    private int cost;
    private Date date;
    private String address;
    private String status;
    private int invoiceid;
    private String customerid;
    private int paymentid;
    private int courierid;

    private Payment payment;

    //GETTERS
    public int getOrderid() {
        return this.orderid;
    }

    public int getCost(){
        return this.cost;
    }

    public  Date getDate(){
        return this.date;
    }

    public String getAddress(){
        return this.address;
    }

    public String getStatus(){
        return this.status;
    }

    public int getInvoiceid() {
        return this.invoiceid;
    }

    public String getCustomerid(){
        return this.customerid;
    }

    public int getPaymentid() {
        return this.paymentid;
    }

    public int getCourierid(){
        return this.courierid;
    }

    public Payment getPayment(){
        return this.payment;
    }

    //SETTERS
    public void setOrderid(int orderid) {
        this.orderid=orderid;
    }

    public void setCost(int cost){
        this.cost=cost;
    }

    public  void setDate(Date date){
        this.date=date;
    }

    public void setAddress(String address){
        this.address=address;
    }

    public void setStatus(String status){
        this.status=status;
    }

    public void setInvoiceid(int invoiceid) {
        this.invoiceid=invoiceid;
    }

    public void setCustomerid(String customerid){
        this.customerid=customerid;
    }

    public void setPaymentid(int paymentid) {
        this.paymentid=paymentid;
    }

    public void setCourierid(int courierid){
        this.courierid=courierid;
    }

    public void setPayment(Payment payment){
        this.payment = payment;
    }
}
