<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="../../resources/css/main.css" type="text/css">
<!------ Include the above in your HEAD tag ---------->
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<style>
  p.name{
    font-family: Arial, Helvetica, sans-serif;
    font-variant: small-caps;
    font-style: italic;
    font-weight: bold;
    font-size: 30px;
    color: white;
  }
</style>

 <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <p class="name">Astha Emporium 	&nbsp;</p>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">

         <li><a href="/"><i class="glyphicon glyphicon-home"></i> Home</a></li>

         <li><a href="/product" ><span class="glyphicon glyphicon-th" aria-hidden="true"></span>Products</a>
         

      <security:authorize access="isAuthenticated()">
        </li>
         <li class="dropdown">
          <security:authorize access="hasAuthority('employee')">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 
              <security:authentication property="principal.username" /> 
              <span class="caret"></span>
              </a>
          <ul class="dropdown-menu">
            <li><a href="/employee"><i class="fa fa-user"></i> Your Profile</a></li>
            <li><a href="/employee/work"><i class="glyphicon glyphicon-briefcase"></i> Employee Section</a></li>
          </ul>
          </security:authorize>
          <security:authorize access="hasAuthority('customer')">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 
              <security:authentication property="principal.username" /> 
              <span class="caret"></span>
            </a>
          <ul class="dropdown-menu">
            <li><a href="/customer"><i class="fa fa-user"></i> Your Profile</a></li>
            <li><a href="/customer/order"><i class="fa fa-shopping-bag"></i> Your Orders</a></li>
            <li><a href="/customer/cart"><i class="fa fa-shopping-cart"></i> Your Cart</a></li>
            <li><a href="/customer/offer"><i class="fa fa-tags"></i> Available Offers</a></li>
          </ul>
          </security:authorize>
          <security:authorize access="hasAuthority('admin')">
            <li><a href="/admin"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Admin Section</a></li>
          </security:authorize>
        </li>
        <li><a style="font-size: x-large;" style="color: white;">|</a></li>
        <li><a href="/logout"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Logout</a></li>
      </security:authorize>

      <security:authorize access="isAnonymous()">
        <li><a href="/login"> Login <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></a></li>
        <li><a style="font-size: x-large;" style="color: white;">|</a></li>
        <li><a href="/register">Sign Up <i class="fa fa-user-plus"></i></a></li>
      </security:authorize>

      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<style>
  table {
      font-family: arial, sans-serif;
      border-collapse: collapse;
      width: 100%;  
  }
  td, th {
      border: 1px solid #dddddd;
      text-align: left;
      padding: 8px;
  }
  tr:nth-child(even) {
      background-color: #dddddd;
  }

  body{
    color: black;
  }

  h1 {
      color: black;
      font-weight: bold;
      text-align: center;
  }

  input[type="text"],input[type="date"],input[type="number"],input[type="email"],input[type="password"] {
		color: black;
    }
   
   select {
     color: black;
   } 

</style>