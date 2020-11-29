package com.project.dbms.model;

public class EmployeeEmail {

    private String email;
    private String employeeid;

    public String getEmployeeid(){
        return this.employeeid;
    }

    public String getEmail(){
        return this.email;
    }

    public void setEmployeeid(String employeeid){
        this.employeeid=employeeid;
    }

    public void setEmail(String email){
        this.email=email;
    }
}
