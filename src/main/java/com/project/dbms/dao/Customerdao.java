package com.project.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.project.dbms.model.Cart;
import com.project.dbms.model.Customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class Customerdao {
    //String customerid,String fName,String mName,String lName,String gender,String email,String password,String houseNo,
    //String street,String city,String pincode
    //customerid,fName,mName,lName,gender,email,password,houseNo,street,city,pincode
    @Autowired
    JdbcTemplate jt;

    public void save(Customer c){
        String sql="insert into Customer values (?,?,?,?,?,?,?,?,?,?)";
        jt.update(sql,c.getCustomerID(),c.getfName(),c.getmName(),c.getlName(),c.getGender(),c.getEmail(),c.getPassword(),c.getHouseNo(),c.getStreet(),c.getCity());
    }

    public void update(Customer c){
        String sql="update Customer set First_Name=?, Middle_Name=?, Last_Name=?, Gender=?, Email=?, Password=?, House_No=?, Street_Name=?, City=? where CustomerID=?";
        jt.update(sql,c.getfName(),c.getmName(),c.getlName(),c.getGender(),c.getEmail(),c.getPassword(),c.getHouseNo(),c.getStreet(),c.getCity(),c.getCustomerID());       
    }

    public void delete(String customerid){
        String sql="delete from Customer where CustomerID=?";
        jt.update(sql,customerid);
    }

    public void saveContact(String customerid,String contact){
        String sql="insert into Customer_Contact values (?,?)";
        jt.update(sql,customerid,contact);
    }
    
    public void deleteContact(String customerid){
        String sql="delete from Customer_Contact where CustomerID=?";
        jt.update(sql,customerid);
    }

    public List<String> getCustomerContact(String customerid){
        String sql="select * from Customer_Contact where CustomerID=?";
        return jt.query(sql, new Object[]{customerid},new RowMapper<String>(){
            public String mapRow(ResultSet row, int rowNum) throws SQLException {
                String contact = row.getString("Contact_No");
                return contact;
            }
        });
    }

    public void savetocart(String customerid, int productid, int quantity){
        jt.update("insert into Cart values (?,?,?)", customerid, productid, quantity);
    }

    public void updatetocart(String customerid, int productid, int quantity){
        jt.update("update Cart set Quantity=? where CustomerID=? and ProductID=?", quantity, customerid, productid);
    }

    public void deletefromcart(String customerid, int productid){
        jt.update("delete from Cart where CustomerID=? and ProductID=?",customerid,productid);
    }

    public void deleteCart(String customerid){
        jt.update("delete from Cart where CustomerID=?",customerid);
    }

    public List<Cart> getCartbyID(String customerid){
        String sql="select * from Cart where CustomerID=?";
        return jt.query(sql, new Object[]{customerid},new RowMapper<Cart>(){
            public Cart mapRow(ResultSet row, int rowNum) throws SQLException {
                Cart cart = new Cart();
                cart.setCustomerID(row.getString("CustomerID"));
                cart.setProductid(row.getInt("ProductID"));
                cart.setQuantity(row.getInt("Quantity"));
                return cart;
            }
        });
    }

    public List<Customer> getAllCustomer(){
        String sql="select * from Customer";
        return jt.query(sql, new RowMapper<Customer>(){
            public Customer mapRow(ResultSet row, int rowNum) throws SQLException {
                Customer customer = new Customer();
                customer.setCustomerID(row.getString("CustomerID"));
                customer.setfName(row.getString("First_Name"));
                customer.setmName(row.getString("Middle_Name"));
                customer.setlName(row.getString("Last_Name"));
                customer.setGender(row.getString("Gender"));
                customer.setEmail(row.getString("Email"));
                customer.setPassword(row.getString("Password"));
                customer.setHouseNo(row.getString("House_No"));
                customer.setStreet(row.getString("Street_Name"));
                customer.setCity(row.getString("City"));
                return customer;
            }
        });
    }

    public List<String> getAllCustomerID(){
        String sql="select CustomerID from Customer";
        return jt.query(sql, new RowMapper<String>(){
            public String mapRow(ResultSet row, int rowNum) throws SQLException {
                return row.getString("CustomerID");
            }
        });
    }

    public Customer getCustomer(String customerid){
        String sql="select * from Customer where CustomerID='"+customerid+"'";
        return jt.queryForObject(sql,new RowMapper<Customer>(){
            public Customer mapRow(ResultSet row, int rowNum) throws SQLException {
                Customer customer = new Customer();
                customer.setCustomerID(row.getString("CustomerID"));
                customer.setfName(row.getString("First_Name"));
                customer.setmName(row.getString("Middle_Name"));
                customer.setlName(row.getString("Last_Name"));
                customer.setGender(row.getString("Gender"));
                customer.setEmail(row.getString("Email"));
                customer.setPassword(row.getString("Password"));
                customer.setHouseNo(row.getString("House_No"));
                customer.setStreet(row.getString("Street_Name"));
                customer.setCity(row.getString("City"));
                return customer;
            }
        });
    }

}
