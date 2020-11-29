package com.project.dbms.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.project.dbms.model.Payment;
import com.project.dbms.model.PaymentMade;
import com.project.dbms.model.SalaryPaid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class Paymentdao {
    
    @Autowired
    JdbcTemplate jt;

    public void save(int amount,String mode,Date date){
        jt.update("insert into Payment(Amount,Mode_of_Payment,Date_of_Payment) values (?,?,?)",amount,mode,date);
    }

    public Integer getlastkey(){
        String sql="select max(PaymentID) from Payment";
        return jt.queryForObject(sql,Integer.class);
    }

    public void delete(int paymentid){
        jt.update("delete from Payment where PaymentID=?",paymentid);
    }

    public List<Payment> getAllPayment(){
        return jt.query("select * from Payment order by PaymentID desc", new RowMapper<Payment>(){
            public Payment mapRow(ResultSet row, int rowNum) throws SQLException {
                Payment pay = new Payment();
                pay.setPaymentid(row.getInt("PaymentID"));
                pay.setAmount(row.getInt("Amount"));
                pay.setMode(row.getString("Mode_of_Payment"));
                pay.setDate(row.getDate("Date_of_Payment"));
                return pay;
            }
        });
    }

    public Payment getPaymentbyID(int paymentid){
        return jt.queryForObject("select * from Payment where PaymentID=?",new Object[]{paymentid}, new RowMapper<Payment>(){
            public Payment mapRow(ResultSet row, int rowNum) throws SQLException {
                Payment pay = new Payment();
                pay.setPaymentid(row.getInt("PaymentID"));
                pay.setAmount(row.getInt("Amount"));
                pay.setMode(row.getString("Mode_of_Payment"));
                pay.setDate(row.getDate("Date_of_Payment"));
                return pay;
            }
        });
    }

    public void saveSalaryPaid(int paymentid,String employeeid){
        jt.update("insert into Salary_Paid values (?,?)",employeeid,paymentid);
    }

    public void saveCustomerMade(int paymentid,String customerid){
        jt.update("insert into Payment_Made values (?,?)",customerid,paymentid);
    }

    public List<SalaryPaid> getAllSalaryPaid(){
        return jt.query("select * from Salary_Paid", new RowMapper<SalaryPaid>(){
            public SalaryPaid mapRow(ResultSet row, int rowNum) throws SQLException {
                SalaryPaid paid = new SalaryPaid();
                paid.setPaymentid(row.getInt("PaymentID"));
                paid.setEmployeeid(row.getString("EmployeeID"));
                return paid;
            }
        });
    }

    public List<PaymentMade> getAllCustomerMade(){
        return jt.query("select * from Payment_Made", new RowMapper<PaymentMade>(){
            public PaymentMade mapRow(ResultSet row, int rowNum) throws SQLException {
                PaymentMade paid = new PaymentMade();
                paid.setPaymentid(row.getInt("PaymentID"));
                paid.setCustomerid(row.getString("CustomerID"));
                return paid;
            }
        });
    }
}
