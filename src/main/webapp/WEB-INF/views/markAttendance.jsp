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

<form action="saveattendance" method="POST" modelAttribute="list"> 

<table border="2" width="70%" cellpadding="2" style="margin-top:92px">  
    <caption><h1>Mark Today's Attendance</h1></caption>
<tr><th>ID</th><th>Employee Name</th><th>Attendance</th></tr>

 <c:forEach items="${list.mark}" varStatus="status" var="m">   
 <tr>  
 <td> ${list.emp[status.index].employeeID}</td>  
 <td> ${list.emp[status.index].fName} ${list.emp[status.index].mName} ${list.emp[status.index].lName}</td> 
 <td> 
    <c:choose>
        <c:when test="${ m == 'present' }">
            <input type="radio" name="mark[${status.index}]" value="present" checked="true"> Present &nbsp;&nbsp; <input type="radio" name="mark[${status.index}]" value="absent"> Absent
        </c:when>
        <c:otherwise>
            <input type="radio" name="mark[${status.index}]" value="present"> Present &nbsp;&nbsp; <input type="radio" name="mark[${status.index}]" value="absent" checked="true"> Absent
        </c:otherwise>
    </c:choose>
</td>   
 </tr>  
 </c:forEach>  
 </table>
 <br>
 <input type="hidden" value="${id}" name="id" />
 <p align="center">	<button type="submit" class="btn btn-primary btn-sm" style="font-size: large;"> Save Attendance </button></p> 
</form>