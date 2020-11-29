<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<head>
        <title>Astha Emporium</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>

<jsp:include page="header.jsp" />

<style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }
    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }
    tr:nth-child(even) {
        background-color: #dddddd;
    }
</style>

  
<table border="2" width="70%" cellpadding="2" style="margin-top:92px">  
    <caption><h1>Employee Record</h1></caption>
<tr><th>ID</th><th>Name</th><th>Salary</th><th>Designation</th><th>Joining Date</th><th>DOB</th><th>Gender</th><th>Contact</th><th>Email</th><th>Bank Details</th><th>Address</th><th>Edit</th><th>Delete</th></tr>  
<c:forEach var="emp" items="${list}">   
<tr>  
<td> ${emp.employeeID}</td>  
<td> ${emp.fName} ${emp.mName} ${emp.lName}</td>
<td> Rs. ${emp.salary}</td>   
<td> ${emp.designation}</td>  
<td> ${emp.joindate}</td> 
<td> ${emp.dob}</td> 
<td> ${emp.gender}</td>
<td><c:forEach var="contact" items="${emp.contact}">${contact}<br/></c:forEach></td>  
<td><c:forEach var="email" items="${emp.email}">${email}<br/></c:forEach></td>  
<td> ${emp.bank.bName} - ${emp.bank.ifscCode}<br/> ${emp.bank.accountNo}</td> 
<td> ${emp.houseNo} ${emp.street}<br/> ${emp.city}</td>   
<td><a href="editemp/${emp.employeeID}">Edit</a></td>
<td><a href="deleteemp/${emp.employeeID}/${emp.bank.bankid}">Delete</a></td>  
</tr>  
</c:forEach>  
</table>  

<p style="text-align: center; margin-top:15px"><a href="/admin/addemp" class="btn btn-primary btn-sm" style="font-size: large;">Add Employee</a></p>
