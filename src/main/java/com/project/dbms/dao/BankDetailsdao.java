package com.project.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.project.dbms.model.BankDetails;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class BankDetailsdao {

    @Autowired
    JdbcTemplate jt;

    public void save(String bName, String AccountNo, String ifscCode){
        String sql="insert into Bank_Details(Bank_Name, Account_Number, IFSC_Code) values (?,?,?)";
        jt.update(sql,bName,AccountNo,ifscCode);
    }

    public void delete(int bankid){
        String sql="delete from Bank_Details where BankID=?";
        jt.update(sql, bankid);
    }

    public Integer getlastkey(){
        String sql="select max(BankID) from Bank_Details";
        return jt.queryForObject(sql,Integer.class);
    }

    public BankDetails getBankDetailByID(int bankid){
        String sql="select * from Bank_Details where BankID=?";
        List<BankDetails> list = jt.query(sql, new Object[]{bankid}, new RowMapper<BankDetails>(){
            public BankDetails mapRow(ResultSet row, int rowNum) throws SQLException {
                BankDetails detail = new BankDetails();
                detail.setBankid(row.getInt("BankID"));
                detail.setAccountNo(row.getString("Account_Number"));
                detail.setbName(row.getString("Bank_Name"));
                detail.setIfscCode(row.getString("IFSC_Code"));
                return detail;
            }
        });

        if(list.size()==0){
            BankDetails detail = new BankDetails();
                return detail;
        }
        else return list.get(0);
    }
}
