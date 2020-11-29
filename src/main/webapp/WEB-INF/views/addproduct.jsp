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
			<div class="panel-title text-center" style="font-size: x-large;">Add Product</div>
		</div>
	</div>

	<div class="row">
		<form action="saveproduct" method="post" modelAttribute="product" enctype="multipart/form-data">
					<div class="col-sm-12">
						<!-- <p>${error}</p> -->
						
						<div class="form-group">
							<label>Product Name</label>
							<input type="text" placeholder="Enter Name Here.." class="form-control"  name="pName" required>
						</div>

						<div class="form-group">
							<label>Product Type</label>
							<input type="text" placeholder="Enter Type Here.." class="form-control"  name="type" required>
                        </div>
                        
                        <div class="form-group">
                            <label>Description</label>
                            <textarea class="form-control" placeholder="Enter Description Here.." style="color: black;" rows="3" name="desc"></textarea>
                        </div>
                        
                        <div class="form-group">
							<label>Photo</label>
							<input type="file" name="file"  required>
                        </div>

                        <div class="form-group">
							<label>Color</label>
							<input type="text" placeholder="Enter Color Here.." class="form-control"  name="color" required>
                        </div>

                        <div class="form-group">
							<label>Size</label>
							<input type="text" placeholder="Enter Size Here.." class="form-control"  name="size" required>
                        </div>

                        <div class="form-group">
							<label>Brand</label>
							<input type="text" placeholder="Enter Brand Here.." class="form-control"  name="brand">
                        </div>

                        <div class="form-group">
							<label>Cost Price</label>
							<input type="number" placeholder="Enter Cost Here.." class="form-control"  name="cost" >
                        </div>

                        <div class="form-group">
							<label>Discount</label>
							<input type="number" placeholder="Enter Discount Here.." class="form-control"  name="discount">
                        </div>

                        <div class="form-group">
							<label>Sell Price</label>
							<input type="number" placeholder="Enter Sell Price Here.." class="form-control"  name="sellprice" required>
                        </div>

                        <div class="form-group">
							<label>Available Quantity</label>
							<input type="number" placeholder="Enter Quantity Here.." class="form-control"  name="quantity" required>
                        </div>

                        <div class="form-group">
							<label>Category</label>
							<select class="form-control" name="categoryid" style="color: black;" required>
								<c:forEach items="${categorylist}" var="cat">
                                    <option value="${cat.categoryid}">${cat.name}</option>
                                </c:forEach>
							</select>
                        </div>
                        
                        <div class="form-group">
							<label>Supplier</label>
							<select class="form-control" style="color: black;" name="supplierid">
								<c:forEach items="${supplierlist}" var="sup">
                                    <option value="${sup.supplierid}">${sup.name}</option>
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
