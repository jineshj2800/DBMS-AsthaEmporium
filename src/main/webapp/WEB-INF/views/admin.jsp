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

<body>
<div class="shape" style="float: left; font-size:25px; margin-top:92px">
    Admin Section
</div>

<div class="container-fluid " >
    <div class="col-lg-4 col-centered well" style="clear:both; text-align:center">
        <h3>Store Management</h3>
    <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/admin/sale">In Stote Sale Record</a></p>    <br>
    <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/admin/emp">Employee Record</a></p>    <br>
    <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/admin/attendance">Attendance Record</a></p>    <br>
    <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/admin/salarypaid">Salary Paid Record</a></p>    <br>
    <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/admin/category">Category Record</a></p>    <br>
    <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/admin/supplier">Supplier Record</a></p>    <br>
    <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/admin/buydetails">Buying Details Record</a></p> <br>
    <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/admin/payments">Transaction History</a></p>
    </div>
    <div class="col-lg-4 col-centered well" style="clear:both; text-align:center">
        <h3>Online Sale Management</h3>
    <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/admin/customer">Customer Record</a></p>    <br>
    <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/admin/order">Order Record</a></p>    <br>
    <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/admin/feedback">Feedback Record</a></p>    <br>
    <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/admin/offer">Offer Record</a></p> <br>
    <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/admin/courier">Courier Service Record</a></p>
    </div>
</div>
</body>