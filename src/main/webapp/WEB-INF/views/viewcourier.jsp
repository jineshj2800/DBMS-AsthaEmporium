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
    <caption><h1>Courier Service Record</h1></caption>
<tr><th>ID</th><th>Name</th><th>Contact</th><th>Email</th><th>Address</th><th>Edit Details</th><c:choose><c:when test="${ role == 'admin' }"><th>Delete</th></c:when></c:choose></tr>  
<c:forEach var="cour" items="${list}">   
<tr>  
<td> ${cour.courierid}</td>  
<td> ${cour.name}</td> 
<td><c:forEach var="contact" items="${cour.contact}">${contact}<br/></c:forEach></td>  
<td><c:forEach var="email" items="${cour.email}">${email}<br/></c:forEach></td>  
<td> ${cour.shopNo} ${cour.locality}<br/> ${cour.city}</td>   
<td><a href="editcourier/${cour.courierid}">Edit</a>
<c:choose><c:when test="${role == 'admin' }"><td><a href="deletecourier/${cour.courierid}">Delete</a></td> </c:when></c:choose>   
</tr>  
</c:forEach>  
</table>  

<c:choose><c:when test="${role == 'admin' }">
<p style="text-align: center; margin-top:15px"><a href="/admin/addcourier" class="btn btn-primary btn-sm" style="font-size: large;">Add Courier Service</a></p>
</c:when></c:choose>