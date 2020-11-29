package com.project.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.project.dbms.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class Userdao {
    
    @Autowired
    JdbcTemplate jt;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public void save(String username,String password,String role){
        password=bCryptPasswordEncoder.encode(password);
        String sql="insert into User values (?,?,?)";
        jt.update(sql,username,password,role);
    }

    public void update(String username,String password, String role){
        password=bCryptPasswordEncoder.encode(password);
        String sql="update User set password=?, role=? where username=?";
        jt.update(sql,password,role,username);
    }

    public void delete(String username){
        String sql="delete from User where username=?";
        jt.update(sql,username);
    }

    public boolean isUser(String username){
        String sql="select count(*) from User where username=?";
        int k=jt.queryForObject(sql,Integer.class,username);
        if(k==0) return false;
        else return true;
    }

    public User findUser(String username){
        String sql = "select * from User where username='" + username + "'";
        return jt.queryForObject(sql, new RowMapper<User>() {

            public User mapRow(ResultSet row, int rowNum) throws SQLException {
                User user = new User();
                user.setUsername(row.getString("username"));
                user.setPassword(row.getString("password"));
                user.setRole(row.getString("role"));
                return user;
            }
        });
    }
    
    public List<User> getAllusers() {
        String sql = "select * from User";
        return jt.query(sql, new RowMapper<User>() {

            public User mapRow(ResultSet row, int rowNum) throws SQLException {
                User user = new User();
                user.setUsername(row.getString("username"));
                user.setPassword(row.getString("password"));
                user.setRole(row.getString("role"));
                return user;
            }
        });
    }

}
