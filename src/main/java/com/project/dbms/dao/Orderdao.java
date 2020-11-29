package com.project.dbms.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;

import com.project.dbms.model.Feedback;
import com.project.dbms.model.Invoice;
import com.project.dbms.model.Order;
import com.project.dbms.model.OrderItem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class Orderdao {
 
    @Autowired
    JdbcTemplate jt;
    
    public void save(int cost,String address,String Status,int invoiceid,String customerid,int paymentid ){
        jt.update("insert into `Order`(Total_Cost,Delivery_Address,Delivery_Status,InvoiceID,CustomerID,PaymentID) values (?,?,?,?,?,?)",cost,address,Status,invoiceid,customerid,paymentid);
    }
 
    public void delete(int orderid){
        jt.update("delete from  `Order` where OrderID=?",orderid);
    } 

    public void update(Order order){
        jt.update("update `Order` set Delivery_Date=?, Delivery_Status=?, CourierID=? where OrderID=?",order.getDate(),order.getStatus(),order.getCourierid(),order.getOrderid());
    }

    public Integer getlastkey(){
        String sql="select max(OrderID) from `Order`";
        return jt.queryForObject(sql,Integer.class);
    }

    public List<Order> getAllOrder(){
        return jt.query("select * from `Order` order by OrderID desc",new RowMapper<Order>(){
            public Order mapRow(ResultSet row, int rowNum) throws SQLException {
                Order order = new Order();
                order.setOrderid(row.getInt("OrderID"));
                order.setCost(row.getInt("Total_Cost"));
                order.setDate(row.getDate("Delivery_Date"));
                order.setAddress(row.getString("Delivery_Address"));
                order.setStatus(row.getString("Delivery_Status"));
                order.setInvoiceid(row.getInt("InvoiceID"));
                order.setCustomerid(row.getString("CustomerID"));
                order.setPaymentid(row.getInt("PaymentID"));
                order.setCourierid(row.getInt("CourierID"));
                return order;
            }
        });
    }

    public Order getOrderByID(int orderid){
        return jt.queryForObject("select * from `Order` where OrderID=?", new Object[]{orderid},new RowMapper<Order>(){
            public Order mapRow(ResultSet row, int rowNum) throws SQLException {
                Order order = new Order();
                order.setOrderid(row.getInt("OrderID"));
                order.setCost(row.getInt("Total_Cost"));
                order.setDate(row.getDate("Delivery_Date"));
                order.setAddress(row.getString("Delivery_Address"));
                order.setStatus(row.getString("Delivery_Status"));
                order.setInvoiceid(row.getInt("InvoiceID"));
                order.setCustomerid(row.getString("CustomerID"));
                order.setPaymentid(row.getInt("PaymentID"));
                order.setCourierid(row.getInt("CourierID"));
                return order;
            }
        });
    }

    public List<Order> getDeliveredOrder(){
        return jt.query("select * from `Order` where Delivery_Status = 'Delivered' order by OrderID desc",new RowMapper<Order>(){
            public Order mapRow(ResultSet row, int rowNum) throws SQLException {
                Order order = new Order();
                order.setOrderid(row.getInt("OrderID"));
                order.setCost(row.getInt("Total_Cost"));
                order.setDate(row.getDate("Delivery_Date"));
                order.setAddress(row.getString("Delivery_Address"));
                order.setStatus(row.getString("Delivery_Status"));
                order.setInvoiceid(row.getInt("InvoiceID"));
                order.setCustomerid(row.getString("CustomerID"));
                order.setPaymentid(row.getInt("PaymentID"));
                order.setCourierid(row.getInt("CourierID"));
                return order;
            }
        });
    }

    public List<Order> getPendingOrder(){
        return jt.query("select * from `Order` where Delivery_Status <> 'Delivered' order by OrderID desc",new RowMapper<Order>(){
            public Order mapRow(ResultSet row, int rowNum) throws SQLException {
                Order order = new Order();
                order.setOrderid(row.getInt("OrderID"));
                order.setCost(row.getInt("Total_Cost"));
                order.setDate(row.getDate("Delivery_Date"));
                order.setAddress(row.getString("Delivery_Address"));
                order.setStatus(row.getString("Delivery_Status"));
                order.setInvoiceid(row.getInt("InvoiceID"));
                order.setCustomerid(row.getString("CustomerID"));
                order.setPaymentid(row.getInt("PaymentID"));
                order.setCourierid(row.getInt("CourierID"));
                return order;
            }
        });
    }

    public List<Order> getOrderByCustomer(String customerid){
        return jt.query("select * from `Order` where CustomerID='"+customerid+"' order by OrderID desc",new RowMapper<Order>(){
            public Order mapRow(ResultSet row, int rowNum) throws SQLException {
                Order order = new Order();
                order.setOrderid(row.getInt("OrderID"));
                order.setCost(row.getInt("Total_Cost"));
                order.setDate(row.getDate("Delivery_Date"));
                order.setAddress(row.getString("Delivery_Address"));
                order.setStatus(row.getString("Delivery_Status"));
                order.setInvoiceid(row.getInt("InvoiceID"));
                order.setCustomerid(row.getString("CustomerID"));
                order.setPaymentid(row.getInt("PaymentID"));
                order.setCourierid(row.getInt("CourierID"));
                return order;
            }
        });
    }

    public void saveItem(int orderid,int quantity,int productid){
        jt.update("insert into Order_Item(OrderID,Quantity,ProductID) values (?,?,?)",orderid,quantity,productid);
    }

    public void deleteItem(int itemid,int orderid){
        jt.update("delete from Order_Item where ItemID=? and OrderID=?",itemid,orderid);
    }

    public List<OrderItem> getItemByOrder(int orderid){
        return jt.query("select * from Order_Item where OrderID=?",new Object[]{orderid},new RowMapper<OrderItem>(){
            public OrderItem mapRow(ResultSet row, int rowNum) throws SQLException {
                OrderItem item = new OrderItem();
                item.setOrderid(row.getInt("OrderID"));
                item.setItemid(row.getInt("ItemID"));
                item.setQuantity(row.getInt("Quantity"));
                item.setProductid(row.getInt("ProductID"));
                return item;
            }
        });
    }

    public void saveInvoice(int amount,int tax,int discount,Date date,Time time,String customerid){
        jt.update("insert into Invoice(Net_Amount,Taxes_Applied,Discount,Issue_Date,Issue_Time,CustomerID) values (?,?,?,?,?,?)",amount,tax,discount,date,time,customerid);
    }

    public void deleteInvoice(int invoiceid){
        jt.update("delete from Invoice where InvoiceID=?",invoiceid);
    }

    public Integer getlastInvoiceID(){
        String sql="select max(InvoiceID) from Invoice";
        return jt.queryForObject(sql,Integer.class);
    }

    public Invoice getInvoicebyID(int invoiceid){
        return jt.queryForObject("select * from Invoice where InvoiceID=?",new Object[]{invoiceid},new RowMapper<Invoice>(){
            public Invoice mapRow(ResultSet row, int rowNum) throws SQLException {
                Invoice in = new Invoice();
                in.setInvoiceid(row.getInt("InvoiceID"));
                in.setAmount(row.getInt("Net_Amount"));
                in.setDiscount(row.getInt("Discount"));
                in.setTax(row.getInt("Taxes_Applied"));
                in.setDate(row.getDate("Issue_Date"));
                in.setTime(row.getTime("Issue_Time"));
                in.setCustomerid(row.getString("CustomerID"));
                return in;
            }
        });
    }

    public void saveFeedback(String desc,int rating, Date date, int orderid,String customerid){
        jt.update("insert into Feedback(Description,Feedback_Date,Rating,CustomerID,OrderID) values (?,?,?,?,?)",desc,date,rating,customerid,orderid);
    }

    public void deleteFeedback(int feedbackid){
        jt.update("delete from Feedback where FeedbackID=?",feedbackid);
    }

    public List<Feedback> getAllFeedbacks(){
        return jt.query("select * from Feedback", new RowMapper<Feedback>(){
            public Feedback mapRow(ResultSet row, int rowNum) throws SQLException {
                Feedback fb = new Feedback();
                fb.setFeedbackid(row.getInt("FeedbackID"));
                fb.setDesc(row.getString("Description"));
                fb.setRating(row.getInt("Rating"));
                fb.setOrderid(row.getInt("OrderID"));
                fb.setDate(row.getDate("Feedback_Date"));
                fb.setCustomerid(row.getString("CustomerID"));
                return fb;
            }
        });
    }

    public Feedback getFeedbackbyID(int orderid){
        return jt.queryForObject("select * from Feedback where OrderID=?", new Object[]{orderid}, new RowMapper<Feedback>(){
            public Feedback mapRow(ResultSet row, int rowNum) throws SQLException {
                Feedback fb = new Feedback();
                fb.setFeedbackid(row.getInt("FeedbackID"));
                fb.setDesc(row.getString("Description"));
                fb.setRating(row.getInt("Rating"));
                fb.setOrderid(row.getInt("OrderID"));
                fb.setDate(row.getDate("Feedback_Date"));
                fb.setCustomerid(row.getString("CustomerID"));
                return fb;
            }
        });
    }

    public List<Integer> getAllFeedbackByID(String customerid){
        return jt.query("select * from Feedback where CustomerID=?", new Object[]{customerid},new RowMapper<Integer>(){
            public Integer mapRow(ResultSet row, int rowNum) throws SQLException {
                Integer id = row.getInt("OrderID");
                return id;
            }
        });
    }
}
