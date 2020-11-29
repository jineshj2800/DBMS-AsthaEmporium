package com.project.dbms.model;

public class EmployeeContact {
    
    private String contact;
    private String employeeid;

    public String getEmployeeid(){
        return this.employeeid;
    }

    public String getContact(){
        return this.contact;
    }

    public void setEmployeeid(String employeeid){
        this.employeeid=employeeid;
    }

    public void setContact(String contact){
        this.contact=contact;
    }
}
