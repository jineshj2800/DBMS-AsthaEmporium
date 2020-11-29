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
</style>

<table border="2" width="70%" cellpadding="2" style="margin-top:92px"> 
    <caption><h1>Transaction History</h1>  </caption> 
<tr><th>ID</th><th>Amount</th><th>Mode Of Payement</th><th>Date</th></tr>  
<c:forEach var="pay" items="${list}">   
<tr style="background-color: white;">  
<c:choose>
<c:when test="${ pay.amount < 0 }">
<td style="color: red;"> ${pay.paymentid}</td>  
<td style="color: red;"> ${pay.amount}</td>
<td style="color: red;"> ${pay.mode}</td>   
<td style="color: red;"> ${pay.date}</td> 
</c:when>
<c:otherwise>
    <td style="color: rgb(1, 168, 65);"> ${pay.paymentid}</td>  
    <td style="color: rgb(1, 168, 65);"> ${pay.amount}</td>
    <td style="color: rgb(1, 168, 65);"> ${pay.mode}</td>   
    <td style="color: rgb(1, 168, 65);"> ${pay.date}</td> 
</c:otherwise>
</c:choose>
</tr>  
</c:forEach>  
</table>  
