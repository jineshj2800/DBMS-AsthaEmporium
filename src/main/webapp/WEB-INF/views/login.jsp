<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<head>
  <title>Astha Emporium</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<style>
.input-group-addon {
   color: #fff;
   background-color: #1474c9;
}


.form-control, .input-group-addon {
   border-radius: 0px;
}
label{
  text-align: left !important;
}
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
<body>

<div class="container" style="padding-top: 150px;margin-top:92px">
      <div class="container">    
        <div class="col-lg-8 col-centered">                    
            <div class="panel panel-primary" >
                    <div class="panel-heading">
                        <div class="panel-title text-center" style="font-size: x-large;"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign In Here</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <c:choose>
                            <c:when test="${ error == 'true' }"><div  id="login-alert" class="alert alert-danger col-sm-offset-3 col-sm-7"><strong>Invalid Username or Password !!</strong></div></c:when>
                        </c:choose>
                            
                        <form id="loginform" class="form-horizontal" role="form" action="login" method="post">
                                    
                            <div style="margin-bottom: 25px" class="input-group col-sm-offset-3 col-sm-7">
                                        <span class="input-group-addon" ><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control input-lg" name="username" placeholder="username" required="true">                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group col-sm-offset-3 col-sm-7">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-password" type="password" class="form-control input-lg" name="password" placeholder="password" required="true">
                                    </div>
                                    


                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls text-center">
										<p align="center">	<button type="submit" class="btn btn-primary btn-sm" style="font-size: large;"> Login <i class="fa fa-sign-in" aria-hidden="true"></i> </button></p>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px;" >
											<p align="center">    Don't have an account! 
                                        <a href="register">
                                            Sign Up Here
                                        </a></p>
                                        </div>
                                    </div>
                                </div>    
                            </form>     
                        </div>                     
                    </div>  
        </div>

    </div>
    
</div>
</body> 

