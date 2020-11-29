package com.project.dbms.model;

import java.sql.Date;
import java.util.List;


public class EmployeeAttendance {
    
    private String employeeid;
    private Date date;
    private String attendance;

    private List<Employee> emp;
    private List<String> mark;
    private Employee employee;

    public String getEmployeeid(){
        return this.employeeid;
    }

    public Date getDate(){
        return this.date;
    }

    public String getAttendance(){
        return this.attendance;
    }

    public void setEmployeeid(String employeeid){
        this.employeeid=employeeid;
    }

    public void setDate(Date date){
        this.date=date;
    }

    public void setAttendance(String attendance){
        this.attendance=attendance;
    }




    public List<String> getMark(){
        return this.mark;
    }

    public List<Employee> getEmp(){
        return this.emp;
    }
    
    public Employee getEmployee(){
        return this.employee;
    }

    public void setMark(List<String> mark){
        this.mark=mark;
    }

    public void setEmp(List<Employee> emp){
        this.emp=emp;
    }

    public void setEmployee(Employee employee){
        this.employee=employee;
    }

}
