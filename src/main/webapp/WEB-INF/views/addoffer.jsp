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
	
	  .form-group{
		  color: black;
	  }
</style>

<div class="container" style="margin-top:92px">
	<div class="col-lg-8 col-centered well">
	<div class="panel panel-primary" >
		<div class="panel-heading">
			<div class="panel-title text-center" style="font-size: x-large;">Add Offer</div>
		</div>
	</div>

	<div class="row">
		<form action="saveoffer" method="post">
					<div class="col-sm-12">
						<c:choose>
                            <c:when test="${ error != 'false' }"><div  id="login-alert" class="alert alert-danger" style="text-align: center;"><strong>${error}</strong></div></c:when>
                        </c:choose>
						
						<div class="form-group">
							<label>Coupon Code</label>
							<input type="text" placeholder="Enter Coupon Code Here.." class="form-control"  name="code" maxlength="10" required>
						</div>

						<div class="form-group">
							<label>Description</label>
							<textarea class="form-control" placeholder="Enter Description Here.." style="color: black;" rows="2" name="desc" required></textarea>
						</div>

						<div class="form-group">
							<label>Discount</label>
							<input type="number" placeholder="Enter Discount Here.." class="form-control"  name="discount" max="100" required>
						</div>

						<div class="form-group">
							<label>Maximum Discount Amount ( Rs.)</label>
							<input type="number" placeholder="Enter Max Discount Here.." class="form-control"  name="max" required>
						</div>

						<div class="form-group">
							<label>Expiry Date</label>
							<input type="date" placeholder="Enter Expiry Date Here.." class="form-control"  name="date" required>
						</div>

						<div class="form-group">
							<label>Available For</label>
							<select multiple class="form-control" name="customers" style="color: black;" required>
								<c:forEach items="${list}" var="cust">
									<option value="${cust}">${cust}</option>
								</c:forEach>
							</select>
						</div>
																	
					<p align="center">	<button type="submit" class="btn btn-primary btn-sm" style="font-size: large;">Submit</button></p>		
				</div>
					
				</form> 
			</div>
		</div>
	</div>
</div>