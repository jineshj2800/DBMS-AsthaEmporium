package com.project.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.project.dbms.model.Category;
import com.project.dbms.model.Product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class Productdao {
 
    @Autowired
    JdbcTemplate jt;

    public void save(Product product){
        String sql="insert into Product(Product_Name, Product_Type, Description, Photo, Color, Size, Brand, Cost_Price, Discount, Selling_Price, Available_Quantity,CategoryID, SupplierID) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        jt.update(sql,product.getpName(),product.getType(),product.getDesc(),product.getPhoto(),product.getColor(),product.getSize(),product.getBrand(),product.getCost(),product.getDiscount(),product.getsellprice(),product.getQuantity(),product.getCategoryid(),product.getSupplierid());
    }

    public void update(Product product){
        String sql="update Product set Product_Name=?, Product_Type=?, Description=?, Color=?, Size=?, Brand=?, Cost_Price=?, Discount=?, Selling_Price=?, Available_Quantity=?  where ProductID=?";
        jt.update(sql,product.getpName(),product.getType(),product.getDesc(),product.getColor(),product.getSize(),product.getBrand(),product.getCost(),product.getDiscount(),product.getsellprice(),product.getQuantity(),product.getProductid());
    }

    public void delete(int productid){
        String sql="delete from Product where ProductID=?";
        jt.update(sql,productid);
    }

    public void updateQuantity(int productid, int quantity){
        String sql="update Product set Available_Quantity=? where ProductID=?";
        jt.update(sql,quantity,productid);
    }

    public Integer getQuantitybyid(int proid){
        String sql="select Available_Quantity from Product where ProductID=?";
        return jt.queryForObject(sql, new Object[]{proid}, new RowMapper<Integer>() {
            public Integer mapRow(ResultSet row, int rowNum) throws SQLException {
                return row.getInt("Available_Quantity");
            }
        });
    }

    public boolean isProduct(int id){
        String sql="select count(*) from Product where ProductID=?";
        int k=jt.queryForObject(sql,Integer.class,id);
        if(k==0) return false;
        else return true;
    }

    public List<Product> getAllProducts(){
        String sql="select * from Product where Available_Quantity>0 order by Selling_Price";
        return jt.query(sql, new RowMapper<Product>() {

            public Product mapRow(ResultSet row, int rowNum) throws SQLException {
                Product product = new Product();
                product.setProductid(row.getInt("ProductID"));
                product.setpName(row.getString("Product_Name"));
                product.setType(row.getString("Product_Type"));
                product.setDesc(row.getString("Description"));
                product.setColor(row.getString("Color"));
                product.setSize(row.getString("Size"));
                product.setBrand(row.getString("Brand"));
                product.setPhoto(row.getString("Photo"));
                product.setCost(row.getInt("Cost_Price"));
                product.setDiscount(row.getInt("Discount"));
                product.setsellprice(row.getInt("Selling_Price"));
                product.setQuantity(row.getInt("Available_Quantity"));
                product.setCategoryid(row.getInt("CategoryID"));
                product.setSupplierid(row.getInt("SupplierID"));
                return product;
            }
        });
    }

    public List<Product> getOutofStock(){
        String sql="select * from Product where Available_Quantity<=0 order by Selling_Price";
        return jt.query(sql, new RowMapper<Product>() {

            public Product mapRow(ResultSet row, int rowNum) throws SQLException {
                Product product = new Product();
                product.setProductid(row.getInt("ProductID"));
                product.setpName(row.getString("Product_Name"));
                product.setType(row.getString("Product_Type"));
                product.setDesc(row.getString("Description"));
                product.setColor(row.getString("Color"));
                product.setSize(row.getString("Size"));
                product.setBrand(row.getString("Brand"));
                product.setPhoto(row.getString("Photo"));
                product.setCost(row.getInt("Cost_Price"));
                product.setDiscount(row.getInt("Discount"));
                product.setsellprice(row.getInt("Selling_Price"));
                product.setQuantity(row.getInt("Available_Quantity"));
                product.setCategoryid(row.getInt("CategoryID"));
                product.setSupplierid(row.getInt("SupplierID"));
                return product;
            }
        });
    }

    public List<Product> getProductbyCategory(int categoryid){
        String sql="select * from Product where CategoryID=? and Available_Quantity>0 order by Selling_Price";
        return jt.query(sql, new Object[]{categoryid}, new RowMapper<Product>() {

            public Product mapRow(ResultSet row, int rowNum) throws SQLException {
                Product product = new Product();
                product.setProductid(row.getInt("ProductID"));
                product.setpName(row.getString("Product_Name"));
                product.setType(row.getString("Product_Type"));
                product.setDesc(row.getString("Description"));
                product.setColor(row.getString("Color"));
                product.setSize(row.getString("Size"));
                product.setBrand(row.getString("Brand"));
                product.setPhoto(row.getString("Photo"));
                product.setCost(row.getInt("Cost_Price"));
                product.setDiscount(row.getInt("Discount"));
                product.setsellprice(row.getInt("Selling_Price"));
                product.setQuantity(row.getInt("Available_Quantity"));
                product.setCategoryid(row.getInt("CategoryID"));
                product.setSupplierid(row.getInt("SupplierID"));
                return product;
            }
        });
    }

    public List<String> getAlltype(){
        String sql="select Distinct Product_Type from Product where Available_Quantity>0 ";
        return jt.query(sql, new RowMapper<String>() {

            public String mapRow(ResultSet row, int rowNum) throws SQLException {
                return row.getString("Product_Type");
            }
        });
    }

    public List<Product> getProductBytype(String type){
        String sql="select * from Product where Product_Type=? and Available_Quantity>0 order by Selling_Price";
        return jt.query(sql, new Object[]{type}, new RowMapper<Product>() {

            public Product mapRow(ResultSet row, int rowNum) throws SQLException {
                Product product = new Product();
                product.setProductid(row.getInt("ProductID"));
                product.setpName(row.getString("Product_Name"));
                product.setType(row.getString("Product_Type"));
                product.setDesc(row.getString("Description"));
                product.setColor(row.getString("Color"));
                product.setSize(row.getString("Size"));
                product.setBrand(row.getString("Brand"));
                product.setPhoto(row.getString("Photo"));
                product.setCost(row.getInt("Cost_Price"));
                product.setDiscount(row.getInt("Discount"));
                product.setsellprice(row.getInt("Selling_Price"));
                product.setQuantity(row.getInt("Available_Quantity"));
                product.setCategoryid(row.getInt("CategoryID"));
                product.setSupplierid(row.getInt("SupplierID"));
                return product;
            }
        });
    }

    public Product getProductbyid(int proid){
        String sql="select * from Product where ProductID=?";
        return jt.queryForObject(sql, new Object[]{proid}, new RowMapper<Product>() {

            public Product mapRow(ResultSet row, int rowNum) throws SQLException {
                Product product = new Product();
                product.setProductid(row.getInt("ProductID"));
                product.setpName(row.getString("Product_Name"));
                product.setType(row.getString("Product_Type"));
                product.setDesc(row.getString("Description"));
                product.setColor(row.getString("Color"));
                product.setSize(row.getString("Size"));
                product.setBrand(row.getString("Brand"));
                product.setPhoto(row.getString("Photo"));
                product.setCost(row.getInt("Cost_Price"));
                product.setDiscount(row.getInt("Discount"));
                product.setsellprice(row.getInt("Selling_Price"));
                product.setQuantity(row.getInt("Available_Quantity"));
                product.setCategoryid(row.getInt("CategoryID"));
                product.setSupplierid(row.getInt("SupplierID"));
                return product;
            }
        });
    }

    public void saveCategory(Category category){
        String sql="insert into Category(Category_Name,Variety) values (?,?)";
        jt.update(sql,category.getName(),category.getVariety());
    }

    public void updateCategory(Category category){
        String sql="update Category set Category_Name=?, Variety=? where CategoryID=?";
        jt.update(sql, category.getName(),category.getVariety(), category.getCategoryid());
    }

    public void deleteCategory(int categoryid){
        String sql="delete from Category where CategoryID=?";
        jt.update(sql, categoryid);
    }

    public List<Category> getAllCategory(){
        String sql="select * from Category";
        return jt.query(sql, new RowMapper<Category>(){
            public Category mapRow(ResultSet row, int rowNum) throws SQLException {
                Category category = new Category();
                category.setName(row.getString("Category_Name"));
                category.setCategoryid(row.getInt("CategoryID"));
                category.setVariety(row.getString("Variety"));
                return category;
            }
        });
    }

    public Category getCategory(int categoryid){
        String sql="select * from Category where CategoryID=?";
        return jt.queryForObject(sql, new Object[]{categoryid},new RowMapper<Category>(){
            public Category mapRow(ResultSet row, int rowNum) throws SQLException {
                Category category = new Category();
                category.setName(row.getString("Category_Name"));
                category.setCategoryid(row.getInt("CategoryID"));
                category.setVariety(row.getString("Variety"));
                return category;
            }
        });
    }

}
