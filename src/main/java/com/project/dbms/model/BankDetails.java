package com.project.dbms.model;

public class BankDetails {
    
    private int bankid;
    private String bName;
    private String accountNo;
    private String ifscCode;

    public int getBankid(){
        return this.bankid;
    }

    public String getbName(){
        return this.bName;
    }

    public String getAccountNo(){
        return this.accountNo;
    }

    public String getIfscCode(){
        return this.ifscCode;
    }

    public void setBankid(int bankid){
        this.bankid=bankid;
    }

    public void setbName(String bName){
        this.bName=bName;
    }

    public void setAccountNo(String accountNo){
        this.accountNo=accountNo;
    }

    public void setIfscCode(String ifscCode){
        this.ifscCode=ifscCode;
    }
}
