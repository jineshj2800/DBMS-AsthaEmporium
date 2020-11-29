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
			<div class="panel-title text-center" style="font-size: x-large;">Edit Order Details</div>
		</div>
	</div>

	<div class="row">
		<form action="../saveorder" method="post" modelAttribute="order">
					<div class="col-sm-12">
						<c:choose>
                            <c:when test="${ error != 'false' }"><div  id="login-alert" class="alert alert-danger" style="text-align: center;"><strong>${error}</strong></div></c:when>
                        </c:choose>
						<div class="form-group">
							<label>OrderID</label>
							<input type="text" name="orderid" class="form-control" value="${order.orderid}" disabled/>
							<input type="hidden" name="orderid" value="${order.orderid}"/>
                        </div>
                        
						<div class="form-group">
							<label>CustomerID</label>
							<input type="text" name="customerid" class="form-control" value="${order.customerid}" disabled/>
						</div>

						<div class="form-group">
							<label>Delivery Address</label>
							<input type="text" name="address" value="${order.address}" class="form-control" disabled>
						</div>

						<div class="form-group">
							<label>Delivery Status</label>
							<input type="text" name="status" value="${order.status}" class="form-control" required>
                        </div>
                        
                        <div class="form-group">
							<label>Delivery Date</label>
							<input type="date" name="date" value="${order.date}" class="form-control" required>
						</div>

						<div class="form-group">
							<label>Courier Service</label>
							<select class="form-control" name="courierid" style="color: black;" required>
                                <option value="0">-- select --</option>
								<c:forEach items="${list}" var="courier">
									<option value="${courier.courierid}">${courier.name}</option>
								</c:forEach>
							</select>
						</div>

																	
					<p align="center">	<button type="submit" class="btn btn-primary btn-sm" style="font-size: large;"> Update </button></p>		
				</div>
					
				</form> 
			</div>
		</div>
	</div>
</div>
