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
    <caption><h1>Customer Record</h1>  </caption> 
<tr><th>Username</th><th>Name</th><th>Email</th><th>Contact</th><th>Address</th><th>Delete</th></tr>  
<c:forEach var="cust" items="${list}">   
<tr>  
<td> ${cust.customerID}</td>  
<td> ${cust.fName} ${cust.lName}</td>
<td> ${cust.email}</td>  
<td> <c:forEach var="contact" items="${cust.contact}">${contact}<br/></c:forEach></td>  
<td> ${cust.houseNo} ${cust.street}<br/> ${cust.city}</td>   
<td><a href="deletecustomer/${cust.customerID}">Delete</a></td>  
</tr>  
</c:forEach>  
</table>