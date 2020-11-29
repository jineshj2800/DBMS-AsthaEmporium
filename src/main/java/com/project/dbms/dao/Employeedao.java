package com.project.dbms.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.project.dbms.model.Employee;
import com.project.dbms.model.EmployeeAttendance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class Employeedao {
    
    @Autowired
    JdbcTemplate jt;

    public void save(Employee emp){
        String sql="insert into Employee values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        jt.update(sql,emp.getEmployeeID(),emp.getfName(),emp.getmName(),emp.getlName(),emp.getGender(),emp.getDob(),emp.getPassword(),
            emp.getJoindate(),emp.getSalary(),emp.getDesignation(),emp.getHouseNo(),emp.getStreet(),emp.getCity(),null);
    }

    public void update(Employee emp){
        String sql="update Employee set Salary=?, Designation=?, Joining_Date=? where EmployeeID=?";
        jt.update(sql,emp.getSalary(),emp.getDesignation(),emp.getJoindate(),emp.getEmployeeID());
    }

    public void updateByEmp(Employee emp){
        String sql="update Employee set First_Name=?, Middle_Name=?, Last_Name=?, Gender=?, Date_of_Birth=?, Password=?, House_No=?, Street_Name=?, City=?, BankID=? where EmployeeID=?";
        jt.update(sql,emp.getfName(),emp.getmName(),emp.getlName(),emp.getGender(),emp.getDob(),emp.getPassword(),
                    emp.getHouseNo(),emp.getStreet(),emp.getCity(),emp.getBankid(),emp.getEmployeeID());
    }

    public void delete(String employeeid){
        String sql="delete from Employee where EmployeeID=?";
        jt.update(sql,employeeid);
    }

    public void saveContact(String employeeid,String contact){
        String sql="insert into Employee_Contact values (?,?)";
        jt.update(sql,employeeid,contact);
    }

    public void saveEmail(String employeeid,String email){
        String sql="insert into Employee_Email values (?,?)";
        jt.update(sql,employeeid,email);   
    }

    public void saveAttendance(String employeeid,Date date,String attendance){
        String sql="insert into Employee_Attendance values (?,?,?)";
        jt.update(sql,employeeid,date,attendance);
    }
    
    public void updateAttendance(String employeeid,Date date,String attendance){
        String sql="update Employee_Attendance set Attendance=? where EmployeeID=? and Date=?";
        jt.update(sql,attendance,employeeid,date);
    }
    

    public void deleteContact(String employeeid){
        String sql="delete from Employee_Contact where EmployeeID=?";
        jt.update(sql,employeeid);
    }

    public void deleteEmail(String employeeid){
        String sql="delete from Employee_Email where EmployeeID=?";
        jt.update(sql,employeeid);
    }

    public List<String> getEmployeeContact(String employeeid){
        String sql="select * from Employee_Contact where EmployeeID='" + employeeid + "'";
        return jt.query(sql, new RowMapper<String>(){
            public String mapRow(ResultSet row, int rowNum) throws SQLException {
                String contact = row.getString("Contact_No");
                return contact;
            }
        });
    }

    public List<String> getEmployeeEmail(String employeeid){
        String sql="select * from Employee_Email where EmployeeID='" + employeeid + "'";
        return jt.query(sql, new RowMapper<String>(){
            public String mapRow(ResultSet row, int rowNum) throws SQLException {
                String email = row.getString("Email");
                return email;
            }
        });
    }

    public String getLastDate(){
        String sql="select count(Date) from Employee_Attendance";
        int k=jt.queryForObject(sql,Integer.class);
        if(k==0) return null;

        sql="select Date from Employee_Attendance order by Date desc limit 1";
        return jt.queryForObject(sql, new RowMapper<String>(){
            public String mapRow(ResultSet row, int rowNum) throws SQLException {
                String date = row.getDate("Date").toString();
                return date;
            }
        });
    }


    public List<EmployeeAttendance> getAttendanceByID(String employeeid){
        String sql="select * from Employee_Attendance where EmployeeID='" + employeeid + "'";
        return jt.query(sql, new RowMapper<EmployeeAttendance>(){
            public EmployeeAttendance mapRow(ResultSet row, int rowNum) throws SQLException {
                EmployeeAttendance emp = new EmployeeAttendance();
                emp.setEmployeeid(row.getString("employeeid"));
                emp.setAttendance(row.getString("attendance"));
                emp.setDate(row.getDate("Date"));

                return emp;
            }
        });
    }

    public List<EmployeeAttendance> getAttendanceByDate(Date date){
        String sql="select * from Employee_Attendance where Date=? ";
        return jt.query(sql, new Object[]{date}, new RowMapper<EmployeeAttendance>(){
            public EmployeeAttendance mapRow(ResultSet row, int rowNum) throws SQLException {
                EmployeeAttendance emp = new EmployeeAttendance();
                emp.setEmployeeid(row.getString("employeeid"));
                emp.setAttendance(row.getString("attendance"));
                emp.setDate(row.getDate("Date"));

                return emp;
            }
        });
    }

    public List<Employee> getAllEmployees(){
        String sql="select * from Employee";
        return jt.query(sql, new RowMapper<Employee>(){
            public Employee mapRow(ResultSet row, int rowNum) throws SQLException {
                Employee emp = new Employee();
                emp.setEmployeeID(row.getString("EmployeeID"));
                emp.setfName(row.getString("First_Name"));
                emp.setmName(row.getString("Middle_Name"));
                emp.setlName(row.getString("Last_Name"));
                emp.setGender(row.getString("Gender"));
                emp.setDob(row.getDate("Date_of_Birth"));
                emp.setPassword(row.getString("Password"));
                emp.setSalary(row.getInt("Salary"));
                emp.setJoindate(row.getDate("Joining_Date"));
                emp.setDesignation(row.getString("Designation"));
                emp.setHouseNo(row.getString("House_No"));
                emp.setStreet(row.getString("Street_Name"));
                emp.setCity(row.getString("City"));
                emp.setBankid(row.getInt("BankID"));
                return emp;
            }
        });
    }    

    public Employee getEmployeebyID(String employeeid)
    {
        String sql="select * from Employee where EmployeeID='"+employeeid+"'";
        return jt.queryForObject(sql, new RowMapper<Employee>(){
            public Employee mapRow(ResultSet row, int rowNum) throws SQLException {
                Employee emp = new Employee();
                emp.setEmployeeID(row.getString("EmployeeID"));
                emp.setfName(row.getString("First_Name"));
                emp.setmName(row.getString("Middle_Name"));
                emp.setlName(row.getString("Last_Name"));
                emp.setGender(row.getString("Gender"));
                emp.setDob(row.getDate("Date_of_Birth"));
                emp.setPassword(row.getString("Password"));
                emp.setSalary(row.getInt("Salary"));
                emp.setDesignation(row.getString("Designation"));
                emp.setJoindate(row.getDate("Joining_Date"));
                emp.setHouseNo(row.getString("House_No"));
                emp.setStreet(row.getString("Street_Name"));
                emp.setCity(row.getString("City"));
                emp.setBankid(row.getInt("BankID"));
                return emp;
            }
        });
    }

}
