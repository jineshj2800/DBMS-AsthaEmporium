package com.project.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.project.dbms.model.BuyingDetail;
import com.project.dbms.model.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class Supplierdao {
    
    @Autowired
    JdbcTemplate jt;
    
    public void save(Supplier sup){
        jt.update("insert into Supplier(Name,Description,Shop_No,Locality,City,BankID) values (?,?,?,?,?,?)",sup.getName(),sup.getDesc(),sup.getShopNo(),sup.getLocality(), sup.getCity(),sup.getBankid());
    }

    public void update(Supplier sup){
        jt.update("update Supplier set Name=?, Description=?, Shop_No=?, Locality=?, City=?, BankID=? where SupplierID=?",sup.getName(),sup.getDesc(),sup.getShopNo(),sup.getLocality(), sup.getCity(),sup.getBankid(),sup.getSupplierid());
    }

    public void delete(int supplierid){
        jt.update("delete from Supplier where SupplierID = ?",supplierid);
    }

    public void saveContact(int supplierid,String contact){
        jt.update("insert into Supplier_Contact values (?,?)",supplierid,contact);
    }

    public void deleteContact(int supplierid){
        jt.update("delete from Supplier_Contact where SupplierID=?",supplierid);
    }    

    public void saveEmail(int supplierid,String Email){
        jt.update("insert into Supplier_Email values (?,?)",supplierid,Email);
    }

    public void deleteEmail(int supplierid){
        jt.update("delete from Supplier_Email where SupplierID=?",supplierid);
    }    

    public Integer getlastkey(){
        String sql="select max(SupplierID) from Supplier";
        return jt.queryForObject(sql,Integer.class);
    }

    public List<Supplier> getAllSupplier(){
        return jt.query("select * from Supplier", new RowMapper<Supplier>(){
            public Supplier mapRow(ResultSet row, int rowNum) throws SQLException {
                Supplier sup = new Supplier();
                sup.setSupplierid(row.getInt("SupplierID"));
                sup.setName(row.getString("Name"));
                sup.setDesc(row.getString("Description"));
                sup.setShopNo(row.getString("Shop_No"));
                sup.setLocality(row.getString("Locality"));
                sup.setCity(row.getString("City"));
                sup.setBankid(row.getInt("BankID"));
                return sup;
            }
        });
    }

    public Supplier getSupplierByID(int supplierid){
        return jt.queryForObject("select * from Supplier where SupplierID=?",new Object[]{supplierid}, new RowMapper<Supplier>(){
            public Supplier mapRow(ResultSet row, int rowNum) throws SQLException {
                Supplier sup = new Supplier();
                sup.setSupplierid(row.getInt("SupplierID"));
                sup.setName(row.getString("Name"));
                sup.setDesc(row.getString("Description"));
                sup.setShopNo(row.getString("Shop_No"));
                sup.setLocality(row.getString("Locality"));
                sup.setCity(row.getString("City"));
                sup.setBankid(row.getInt("BankID"));
                return sup;
            }
        });
    }

    public List<String> getSupplierContact(int supplierid){
        String sql="select * from Supplier_Contact where SupplierID='" + supplierid + "'";
        return jt.query(sql, new RowMapper<String>(){
            public String mapRow(ResultSet row, int rowNum) throws SQLException {
                String contact = row.getString("Contact_No");
                return contact;
            }
        });
    }   

    public List<String> getSupplierEmail(int supplierid){
        String sql="select * from Supplier_Email where SupplierID='" + supplierid + "'";
        return jt.query(sql, new RowMapper<String>(){
            public String mapRow(ResultSet row, int rowNum) throws SQLException {
                String email = row.getString("Email");
                return email;
            }
        });
    }   

    public void saveBuydetail(BuyingDetail buy){
        jt.update("insert into Buying_Details(Total_Bill,Description,Date,SupplierID,PaymentID) values (?,?,?,?,?)",buy.getBill(),buy.getDesc(),buy.getDate(),buy.getSupplierid(),buy.getPaymentid());
    }

    public void deteleBuydetail(int purchaseid){
        jt.update("delete from Buying_Details where PurchaseID=?",purchaseid);
    }

    public List<BuyingDetail> getAllBuyingDetail(){
        return jt.query("select * from Buying_Details", new RowMapper<BuyingDetail>(){
            public BuyingDetail mapRow(ResultSet row, int rowNum) throws SQLException {
                BuyingDetail detail = new BuyingDetail();
                detail.setPurchaseid(row.getInt("PurchaseID"));
                detail.setBill(row.getInt("Total_Bill"));
                detail.setDesc(row.getString("Description"));
                detail.setDate(row.getDate("Date"));
                detail.setSupplierid(row.getInt("SupplierID"));
                detail.setPaymentid(row.getInt("PaymentID"));
                return detail;
            }
        });
    }
}
