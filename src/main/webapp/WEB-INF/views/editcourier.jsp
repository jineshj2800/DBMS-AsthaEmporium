<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<head>
        <title>Astha Emporium</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>

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


<jsp:include page="header.jsp" />

<div class="container" style="margin-top:92px">
	<div class="col-lg-8 col-centered well">
	<div class="panel panel-primary" >
		<div class="panel-heading">
			<div class="panel-title text-center" style="font-size: x-large;"> Edit Courier Service Details</div>
		</div>
	</div>

	<div class="row">
		<form action="../updatecourier" method="post" modelAttribute="courier">
					<div class="col-sm-12">
						<c:choose>
                            <c:when test="${ error != 'false' }"><div  id="login-alert" class="alert alert-danger" style="text-align: center;"><strong>${error}</strong></div></c:when>
                        </c:choose>
                        <input type="hidden" value="${courier.courierid}" name="courierid"/>
						<div class="form-group">
							<label>Name</label>
							<input type="text" placeholder="Enter Name" value="${courier.name}" class="form-control"  name="name" required="true">
						</div>

						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Phone Number 1</label>
								<input type="text" placeholder="Enter Phone No." value="${contact1}" class="form-control" name="contact1" required="true">
							</div>	
							<div class="col-sm-6 form-group">
								<label>Phone Number 2</label>
								<input type="text" placeholder="Enter Phone No." value="${contact2}" class="form-control" name="contact2">
							</div>		
						</div>

						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Email Address 1</label>
								<input type="email" placeholder="Enter Email" value="${email1}" class="form-control" name="email1">
							</div>	
							<div class="col-sm-6 form-group">
								<label>Email Address 2</label>
								<input type="email" placeholder="Enter Email" value="${email2}" class="form-control" name="email2">
							</div>		
						</div>

						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Shop Number</label>
								<input type="text" placeholder="Enter Shop No." value="${courier.shopNo}" class="form-control" name="shopNo">
							</div>	
							<div class="col-sm-6 form-group">
								<label>Locality</label>
								<input type="text" placeholder="Enter Locality" value="${courier.locality}" class="form-control" name="locality">
							</div>		
						</div>

							<div class="form-group">
								<label>City</label>
								<input type="text" placeholder="Enter City" value="${courier.city}" class="form-control" name="city" required>
							</div>			
						
					<p align="center">	<button type="submit" class="btn btn-primary btn-sm" style="font-size: large;"> Update </button></p>		
				</div>
					
				</form> 
			</div>
		</div>
	</div>
</div>