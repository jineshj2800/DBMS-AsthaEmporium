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
    <div class="shape" style="float: left; font-size:25px; width:250px; margin-top:92px">
        Employee Section
    </div>
    <div class="container-fluid " >
        <div class="col-lg-4 col-centered well" style="clear:both; text-align:center">
            <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/employee/order">Orders Record</a></p> <br>
            <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/employee/feedback">Feedback Record</a></p><br>
            <p><a class="btn btn-primary btn-sm" style="font-size: large; width: 500px;" href="/employee/courier">Courier Service Record</a></p>
        </div>
    </div>
</body>