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
			<div class="panel-title text-center" style="font-size: x-large;">Sign Up Here  <i class="fa fa-user-plus"></i></div>
		</div>
	</div>

	<div class="row">
				<form action="register" method="post" modelAttribute="customer">
					<div class="col-sm-12">
						<c:choose>
                            <c:when test="${ error != 'false' }"><div  id="login-alert" class="alert alert-danger" style="text-align: center;"><strong>${error}</strong></div></c:when>
                        </c:choose>
                            
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>First Name</label>
								<input type="text" placeholder="Enter First Name Here.." class="form-control" name="fName" required="true">
							</div>
							<div class="col-sm-4 form-group">
								<label>Middle Name</label>
								<input type="text" placeholder="Enter Middle Name Here.." class="form-control" name="mName" >
							</div>
								<div class="col-sm-4 form-group">
								<label>Last Name</label>
								<input type="text" placeholder="Enter Last Name Here.." class="form-control" name="lName" >
							</div>
						</div>
						<div class="form-group">
							<label>Username</label>
							<input type="text" placeholder="Enter Username Here.." class="form-control"  name="customerID" required="true">
						</div>
						
						<div class="form-group">
							<label>Gender</label>
							<select class="form-control" name="gender" style="color: black;">
							  <option value="none">select</option>
							  <option value="male">male</option>
							  <option value="female">female</option>
							  <option value="others">others</option>
							</select>
						</div>
								
						<div class="form-group">
							<label>Email Address</label>
							<input type="email" placeholder="Enter Email Address Here.." class="form-control" name="email" required="true">
						</div>
						<div class="form-group">
							<label>Password</label>
								<input type="password" placeholder="Enter Password Here.." class="form-control" name="password" required="true" minlength="8" maxlength="20">
						</div>			
						<div class="form-group">
							<label>Confirm Password</label>
							<input type="password" placeholder="Re-Enter Password Here.." class="form-control" name="mpassword">
						</div>		
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Phone Number 1</label>
								<input type="text" placeholder="Enter Phone No. Here.." class="form-control" minlength="10" maxlength="10" name="contact1"  required="true">
							</div>	
							<div class="col-sm-6 form-group">
								<label>Phone Number 2</label>
								<input type="text" placeholder="Enter Phone No. Here.." class="form-control" minlength="10" maxlength="10" name="contact2">
							</div>		
						</div>	
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>House Number</label>
								<input type="text" placeholder="Enter House No. Here.." class="form-control" name="houseNo">
							</div>	
							<div class="col-sm-6 form-group">
								<label>Street</label>
								<input type="text" placeholder="Enter Street Name Here.." class="form-control" name="street">
							</div>		
						</div>

							<div class="form-group">
								<label>City</label>
								<input type="text" placeholder="Enter City Here.." class="form-control" name="city" required="true">
							</div>		
					
					<p align="center">	<button type="submit" class="btn btn-primary btn-sm" style="font-size: large;">Sign Up <i class="fa fa-user-plus"></i></button></p>		
					<p align="center">
						Already have an account ?<a href="login"> Log in</a>
					</p>
				</div>
					
				</form> 
			</div>
		</div>
	</div>
</div>
