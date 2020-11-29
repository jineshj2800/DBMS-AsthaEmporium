package com.project.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.project.dbms.model.OfflineSale;
import com.project.dbms.model.SoldOffline;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class OfflineSaledao {
    
    @Autowired
    JdbcTemplate jt;

    public void save(OfflineSale sale){
        String sql="insert into Offline_Sale(Customer_Name,Total_Bill,Date,PaymentID) values (?,?,?,?)";
        jt.update(sql,sale.getcName(),sale.getBill(),sale.getDate(),sale.getPaymentid());
    }

    public void update(OfflineSale sale){
        String sql="upadte Offline_Sale set Customer_Name=?, Total_Bill=?, PaymentID=? where SaleID=?";
        jt.update(sql,sale.getcName(),sale.getBill(),sale.getPaymentid(),sale.getSaleid());
    }

    public void delete(int saleid){
        String sql="delete from Offline_Sale where SaleID=?";
        jt.update(sql, saleid);
    }

    public List<OfflineSale> getAllSale(){
        String sql="select * from Offline_Sale";
        return jt.query(sql, new RowMapper<OfflineSale>(){
            public OfflineSale mapRow(ResultSet row, int rowNum) throws SQLException {
                OfflineSale sale = new OfflineSale();
                sale.setSaleid(row.getInt("SaleID"));
                sale.setcName(row.getString("Customer_Name"));
                sale.setBill(row.getInt("Total_Bill"));
                sale.setDate(row.getDate("Date"));
                sale.setPaymentid(row.getInt("PaymentID"));
                return sale;
            }
        });
    }

    public OfflineSale getSaleById(int saleid){
        String sql="select * from Offline_Sale where SaleID=?";
        return jt.queryForObject(sql, new Object[]{saleid},new RowMapper<OfflineSale>(){
            public OfflineSale mapRow(ResultSet row, int rowNum) throws SQLException {
                OfflineSale sale = new OfflineSale();
                sale.setSaleid(row.getInt("SaleID"));
                sale.setcName(row.getString("Customer_Name"));
                sale.setBill(row.getInt("Total_Bill"));
                sale.setDate(row.getDate("Date"));
                sale.setPaymentid(row.getInt("PaymentID"));
                return sale;
            }
        });
    }

    public Integer getlastkey(){
        String sql="select max(SaleID) from Offline_Sale";
        return jt.queryForObject(sql,Integer.class);
    }

    public void saveProduct(int productid,int saleid,int quantity){
        String sql="insert into Sold_Offline values (?,?,?)";
        jt.update(sql,productid,saleid,quantity);
    }

    public void deleteProduct(int productid,int saleid){
        String sql="delete from Sold_Offline where ProductID=? and SaleID=?";
        jt.update(sql,productid,saleid);
    }

    public List<SoldOffline> getAllItembySale(int saleid){
        String sql="select * from Sold_Offline where SaleID=?";
        return jt.query(sql,new Object[]{saleid}, new RowMapper<SoldOffline>(){
            public SoldOffline mapRow(ResultSet row, int rowNum) throws SQLException {
                SoldOffline sale = new SoldOffline();
                sale.setSaleid(row.getInt("SaleID"));
                sale.setProductid(row.getInt("ProductID"));
                sale.setQuantity(row.getInt("Quantity"));
                return sale;
            }
        });
    }

}
