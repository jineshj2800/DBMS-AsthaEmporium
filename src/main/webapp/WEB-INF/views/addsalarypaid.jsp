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
			<div class="panel-title text-center" style="font-size: x-large;">Add Salary Payment</div>
		</div>
	</div>

	<div class="row">
				<form action="savepay" method="post" modelAttribute="pay">
					<div class="col-sm-12">
						<!-- <p>${error}</p> -->

						<div class="form-group">
							<label>Employee</label>
							<select class="form-control" name="employee" style="color: black;" required>
								<c:forEach items="${list}" var="emp">
									<option value="${emp.employeeID}">${emp.employeeID}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="form-group">
							<label>Amount</label>
							<input type="number" placeholder="Enter Amount Here.." class="form-control"  name="amount" required>
						</div>

						<div class="form-group">
							<label>Date</label>
							<input type="date" placeholder="Enter Date Here.." class="form-control"  name="date" required>
						</div>
										
						<div class="form-group">
							<label>Mode</label>
							<select class="form-control" name="mode" style="color: black;" required>
							  <option value="cash">Cash</option>
							  <option value="check">Check</option>
							  <option value="net banking">Net Banking</option>
							  <option value="UPI">UPI</option>
							</select>
						</div>
								
											
					<p align="center">	<button type="submit" class="btn btn-primary btn-sm" style="font-size: large;">Submit</button></p>		
				</div>
					
				</form> 
			</div>
		</div>
	</div>
</div>
