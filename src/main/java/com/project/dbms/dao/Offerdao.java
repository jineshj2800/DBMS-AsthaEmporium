package com.project.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.project.dbms.model.Offer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class Offerdao {
    
    @Autowired
    JdbcTemplate jt;

    public void save(Offer offer){
        String sql="insert into Offer values (?,?,?,?)";
        jt.update(sql,offer.getOfferid(),offer.getDesc(),offer.getDiscount(),offer.getExpiryDate());
    }

    public void delete(String offerid){
        String sql="delete from Offer where OfferID=?";
        jt.update(sql, offerid);
    }

    public void saveCustomer(String offerid, String customerid){
        jt.update("insert into Getting_Offer values (?,?)", offerid,customerid);
    }

    public void deleteCustomer(String customerid, String offerid){
        jt.update("delete from Getting_Offer where CustomerID=? and OfferID=?",customerid,offerid);
    }

    public boolean isCode(String offerid){
        String sql="select count(*) from Offer where OfferID=?";
        int k=jt.queryForObject(sql,Integer.class,offerid);
        if(k==0) return false;
        else return true;
    }

    public List<String> getCustomers(String id){
        String sql="select * from Getting_Offer where OfferID=?";
        return jt.query(sql, new Object[]{id},new RowMapper<String>(){
            public String mapRow(ResultSet row, int rowNum) throws SQLException {
                return row.getString("CustomerID");
            }
        });
    }

    public List<Offer> getAllOffer(){
        String sql="select * from Offer";
        return jt.query(sql,new RowMapper<Offer>(){
            public Offer mapRow(ResultSet row, int rowNum) throws SQLException {
                Offer offer = new Offer();
                offer.setOfferid(row.getString("OfferID"));
                offer.setDesc(row.getString("Description"));
                offer.setExpiryDate(row.getDate("Expiry_Date"));
                offer.setDiscount(row.getString("Discount"));
                return offer;
            }
        });
    }

    public List<Offer> getOfferForcustomer(String id){
        String sql="select * from Offer where OfferID in (select OfferID from Getting_Offer where CustomerID=?)";
        return jt.query(sql, new Object[]{id},new RowMapper<Offer>(){
            public Offer mapRow(ResultSet row, int rowNum) throws SQLException {
                Offer offer = new Offer();
                offer.setOfferid(row.getString("OfferID"));
                offer.setDesc(row.getString("Description"));
                offer.setExpiryDate(row.getDate("Expiry_Date"));
                offer.setDiscount(row.getString("Discount"));
                return offer;
            }
        });
    }
}
