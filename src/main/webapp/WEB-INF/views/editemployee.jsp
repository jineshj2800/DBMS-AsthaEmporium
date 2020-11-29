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
	.error {
	color: #ff0000;
	font-style: italic;
	}
	.col-centered {
		float: none;
		margin-right: auto;
		margin-left: auto;
	  }
</style>

<div class="container" style="margin-top:92px">
	<div class="col-lg-8 col-centered well">
	<div class="panel panel-primary" >
		<div class="panel-heading">
			<div class="panel-title text-center" style="font-size: x-large;">Edit Employee</div>
		</div>
	</div>

	<div class="row">
		<form action="saveemp" method="post" modelAttribute="emp">
					<div class="col-sm-12">
						<c:choose>
                            <c:when test="${ error != 'false' }"><div  id="login-alert" class="alert alert-danger" style="text-align: center;"><strong>${error}</strong></div></c:when>
                        </c:choose>
						<div class="form-group">
							<label>EmployeeID</label>
							<input type="text" name="employeeID" class="form-control" value="${emp.employeeID}" disabled/>
							<input type="hidden" name="employeeID" value="${emp.employeeID}"/>
						</div>
						<div class="form-group">
							<label>Employee Name</label>
							<input type="text" name="name" class="form-control" required="true" value="${emp.fName} ${emp.mName} ${emp.lName}" disabled/>
						</div>

						<div class="form-group">
							<label>Salary</label>
							<input type="number" name="salary" value="${emp.salary}" class="form-control" required>
						</div>

						<div class="form-group">
							<label>Designation</label>
							<input type="text" name="designation" value="${emp.designation}" class="form-control" required>
						</div>

						<div class="form-group">
							<label>Joining Date</label>
							<input type="date" name="joindate" value="${emp.joindate}" class="form-control" required>
						</div>
																	
					<p align="center">	<button type="submit" class="btn btn-primary btn-sm" style="font-size: large;"> Update </button></p>		
				</div>
					
				</form> 
			</div>
		</div>
	</div>
</div>
