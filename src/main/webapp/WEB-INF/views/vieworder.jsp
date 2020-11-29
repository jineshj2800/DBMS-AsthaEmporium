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
    <caption><h1>Under Delivery Orders</h1> </caption>
<tr><th>OrderID</th><th>CustomerID</th><th>Total Bill</th><th>Mode Of Payment</th><th>Order Date</th><th>Expected Delivery Date</th><th>Delivery Status</th><th>Delivery Address</th><th>CourierID</th><th>Details</th><th>Edit</th><c:choose><c:when test="${role == 'admin' }"><th>Delete</th></c:when></c:choose></tr>  
<c:forEach var="order" items="${list1}">   
<tr>  
<td> ${order.orderid}</td>  
<td> ${order.customerid}</td>
<td> Rs. ${order.cost}</td>
<td> ${order.payment.mode}</td>
<td> ${order.payment.date}</td>
<td> ${order.date}</td>
<td> ${order.status}</td>
<td> ${order.address}</td>
<td> ${order.courierid}</td>
<td><a href="orderdetail/${order.orderid}">See Details</a></td>
<td><a href="editorder/${order.orderid}">Edit</a></td> 
<c:choose><c:when test="${role == 'admin' }"><td><a href="deleteorder/${order.paymentid}/${order.invoiceid}">Delete</a></td> </c:when></c:choose> 
</tr>  
</c:forEach>  
</table>  
    <br>
 <hr>
<table border="2" width="70%" cellpadding="2">  
    <caption><h1>Delivered Orders</h1> </caption>
    <tr><th>OrderID</th><th>CustomerID</th><th>Total Bill</th><th>Mode Of Payment</th><th>Order Date</th><th>Delivery Date</th><th>Delivery Status</th><th>Delivery Address</th><th>CourierID</th><th>Details</th><th>Edit</th><c:choose><c:when test="${role == 'admin' }"><th>Delete</th></c:when></c:choose></tr>  
    <c:forEach var="order" items="${list2}">   
    <tr>  
    <td> ${order.orderid}</td>  
    <td> ${order.customerid}</td>
    <td> ${order.cost}</td>
    <td> ${order.payment.mode}</td>
    <td> ${order.payment.date}</td>
    <td> ${order.date}</td>
    <td> ${order.status}</td>
    <td> ${order.address}</td>
    <td> ${order.courierid}</td>
    <td><a href="orderdetail/${order.orderid}">See Details</a></td>
    <td><a href="editorder/${order.orderid}">Edit</a></td>  
    <c:choose><c:when test="${role == 'admin' }"><td><a href="deleteorder/${order.paymentid}/${order.invoiceid}">Delete</a></td> </c:when></c:choose>
    </tr>  
    </c:forEach> 
</table>
