package com.project.dbms.model;

import java.sql.Date;
import java.util.List;

public class Employee {
    
    private String employeeID;
    private String fName;
    private String mName;
    private String lName;
    private String gender;
    private Date dob;
    private String password;
    private Date joindate;
    private int salary;
    private String designation;
    private String houseNo;
    private String street;
    private String city;
    private int bankid;

    private List<String> contact;
    private List<String> email;
    private BankDetails bank;

    //GETTERS
    public String getEmployeeID(){
        return this.employeeID;
    }

    public String getfName(){
        return this.fName;
    }

    public String getmName(){
        return this.mName;
    }

    public String getlName(){
        return this.lName;
    }

    public String getGender(){
        return this.gender;
    }

    public Date getDob(){
        return this.dob;
    }

    public String getPassword(){
        return this.password;
    }

    public Date getJoindate(){
        return this.joindate;
    }

    public int getSalary(){
        return this.salary;
    }

    public String getDesignation(){
        return this.designation;
    }

    public String getHouseNo(){
        return this.houseNo;
    }

    public String getStreet(){
        return this.street;
    }

    public String getCity(){
        return this.city;
    }

    public int getBankid(){
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
    public void setEmployeeID(String employeeID){
        this.employeeID=employeeID;
    }

    public void setfName(String fName){
        this.fName=fName;
    }

    public void setmName(String mName){
        this.mName=mName;
    }

    public void setlName(String lName){
        this.lName=lName;
    }

    public void setGender(String gender){
        this.gender=gender;
    }

    public void setDob(Date dob){
        this.dob=dob;
    }

    public void setPassword(String password){
        this.password=password;
    }

    public void setJoindate(Date joindate){
        this.joindate=joindate;
    }

    public void setSalary(int salary){
        this.salary=salary;
    }

    public void setDesignation(String designation){
        this.designation=designation;
    }

    public void setHouseNo(String houseNo){
        this.houseNo=houseNo;
    }

    public void setStreet(String street){
        this.street=street;
    }

    public void setCity(String city){
        this.city=city;
    }

    public void setBankid(int bankid){
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
