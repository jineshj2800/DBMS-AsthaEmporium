package com.project.dbms.model;

public class SalaryPaid {
    
    private String employeeid;
    private int paymentid;
    private Payment payment;
    private Employee employee;

    public int getPaymentid(){
        return this.paymentid;
    }

    public String getEmployeeid(){
        return this.employeeid;
    }


    public void setPaymentid(int paymentid){
        this.paymentid=paymentid;
    }

    public void setEmployeeid(String employeeid){
        this.employeeid=employeeid;
    }


    public void setPayment(Payment payment){
        this.payment=payment;
    }

    public Payment getPayment(){
        return this.payment;
    }

    public void setEmployee(Employee employee){
        this.employee=employee;
    }

    public Employee getEmployee(){
        return this.employee;
    }

}
