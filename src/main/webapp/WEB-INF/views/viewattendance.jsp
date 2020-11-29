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

<body style="margin-top:92px">
<table border="2" width="70%" cellpadding="2" >  
    <caption><h1 align="center">Attendance Record (${message})</h1></caption>
<tr><th>ID</th><th>Employee Name</th><th>Date</th><th>Attendance</th></tr>
<c:forEach items="${emplist}" var="emp">
<tr>
    <td>${emp.employeeid}</td>
    <td>${emp.employee.fName} ${emp.employee.mName}  ${emp.employee.lName} </td>
    <td>${emp.date}</td>
    <td><c:choose>
        <c:when test="${emp.attendance == 'present' }"> &#10004; </c:when>
        <c:otherwise>&#10005; </c:otherwise>
        </c:choose>
    </td>
</tr>
</c:forEach>
 </table>   

 <div class="col-sm-12" style="margin-top: 15px;">
    <div class="row" >
        <div class="col-sm-4 form-group">
		<form action="/admin/attendance/1">
                            Search By User
                        <div class="input-group">
                            <select name="employee" class="form-control" style="color: black;">
                                <c:forEach items="${list}" var="emp">
                                    <option value="${emp.employeeID}">${emp.employeeID}</option>
                                </c:forEach>
                            </select>
                            <input type="hidden" name="date" value="${date}"/>
                            <div class="input-group-btn">
                                <div class="btn-group" role="group">
                                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                </div>
                            </div>
                        </div>	
        </form>
        </div>
        <div class="col-sm-4 form-group">
        <form action="/admin/attendance/2" style="float: left;">
            Search By Date
            <div class="input-group">
                <input type="date" name="date" class="form-control" />
                <input type="hidden" name="employee" value="all"/>
                <div class="input-group-btn">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                    </div>
                </div>
            </div>	
        </form>
        </div>
        <p style="text-align: center; margin:17px; float: left;"><a href="/admin/markattendance" class="btn btn-primary btn-sm" style="font-size: large;">Mark Today's Attendance</a></p>
    </div>
</div>
</body>