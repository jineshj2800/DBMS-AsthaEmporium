package com.project.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.project.dbms.model.Courier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class Courierdao {
    
    @Autowired
    JdbcTemplate jt;
    
    public void save(Courier cor){
        jt.update("insert into Courier(Name, Shop_No, Locality, City) values (?,?,?,?)",cor.getName(),cor.getShopNo(),cor.getLocality(),cor.getCity());
    }

    public void update(Courier cor){
        jt.update("update Courier set Name=?, Shop_No=?, Locality=?, City=? where CourierID=?",cor.getName(),cor.getShopNo(),cor.getLocality(),cor.getCity(),cor.getCourierid());
    }

    public void delete(int courierid){
        jt.update("delete from Courier where CourierID=?",courierid);
    }

    public void saveContact(int courierid,String contact){
        jt.update("insert into Courier_Contact values (?,?)",courierid,contact);
    }

    public void deleteContact(int courierid){
        jt.update("delete from Courier_Contact where CourierID=?",courierid);
    }    

    public void saveEmail(int courierid,String Email){
        jt.update("insert into Courier_Email values (?,?)",courierid,Email);
    }

    public void deleteEmail(int courierid){
        jt.update("delete from Courier_Email where CourierID=?",courierid);
    }    

    public Integer getlastkey(){
        String sql="select max(CourierID) from Courier";
        return jt.queryForObject(sql,Integer.class);
    }

    public List<Courier> getAllCourier(){
        return jt.query("select * from Courier", new RowMapper<Courier>(){
            public Courier mapRow(ResultSet row, int rowNum) throws SQLException {
                Courier cor = new Courier();
                cor.setCourierid(row.getInt("CourierID"));
                cor.setName(row.getString("Name"));
                cor.setShopNo(row.getString("Shop_No"));
                cor.setLocality(row.getString("Locality"));
                cor.setCity(row.getString("City"));
                return cor;
            }
        });
    }

    public Courier getCourierByID(int id){
        return jt.queryForObject("select * from Courier where CourierID=?", new Object[]{id},new RowMapper<Courier>(){
            public Courier mapRow(ResultSet row, int rowNum) throws SQLException {
                Courier cor = new Courier();
                cor.setCourierid(row.getInt("CourierID"));
                cor.setName(row.getString("Name"));
                cor.setShopNo(row.getString("Shop_No"));
                cor.setLocality(row.getString("Locality"));
                cor.setCity(row.getString("City"));
                return cor;
            }
        });
    }

    public List<String> getCourierContact(int courierid){
        String sql="select * from Courier_Contact where CourierID='" + courierid + "'";
        return jt.query(sql, new RowMapper<String>(){
            public String mapRow(ResultSet row, int rowNum) throws SQLException {
                String contact = row.getString("Contact_No");
                return contact;
            }
        });
    }   

    public List<String> getCourierEmail(int courierid){
        String sql="select * from Courier_Email where CourierID='" + courierid + "'";
        return jt.query(sql, new RowMapper<String>(){
            public String mapRow(ResultSet row, int rowNum) throws SQLException {
                String email = row.getString("Email");
                return email;
            }
        });
    }   

}
