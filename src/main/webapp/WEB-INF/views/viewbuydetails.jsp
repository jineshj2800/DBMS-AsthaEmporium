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
    <caption><h1>Buying Details Record</h1>  </caption> 
<tr><th>ID</th><th>Supplier Name</th><th>Amount</th><th>Date</th><th>Mode Of Payement</th><th>Delete</th></tr>  
<c:forEach var="buy" items="${list}">   
<tr>  
<td> ${buy.purchaseid}</td>  
<td> ${buy.supplier.name}</td>
<td> ${buy.bill}</td>  
<td> ${buy.date}</td> 
<td> ${buy.payment.mode}</td> 
<td><a href="deletebuy/${buy.paymentid}">Delete</a></td>  
</tr>  
</c:forEach>  
</table>  

<p style="text-align: center; margin-top:15px"><a href="/admin/addbuy" class="btn btn-primary btn-sm" style="font-size: large;">Add Buy</a></p>
