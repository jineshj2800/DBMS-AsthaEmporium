<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<head>
        <title>Astha Emporium</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="../../resources/css/main.css" type="text/css">
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
        text-align: center;
      }
    label {
    text-align: right;
    clear: both;
    float:left;
    margin-right:15px;
    }
</style>

<body>
<div class="container" style="margin-top:92px">
<div class="col-centered ">
<div class="panel panel-default">
    <div class="panel-heading">  <h4 style="text-align: start;">Employee User Profile</h4></div>
    <div class="panel-body">
    <div class="col-centered ">
    <img src="../../resources/images/faceicon1.png" alt="" class="img img-rounded img-fluid"/>
    <h2>${employee.employeeID}</h2>
    </div>

    <hr style="margin:5px 0 5px 0;">
    <br>
            <div id="view">
                    <div class="row">            
                        <div class="col-sm-12">
                        <c:choose>
                            <c:when test="${ error != 'false' }"><div  id="login-alert" class="alert alert-danger" style="text-align: center;"><strong>${error}</strong></div></c:when>
                        </c:choose>
                            <div class="row">
                                <div class="col-sm-4 form-group">
                                    <label>Salary</label>
                                    <input type="text" value="${employee.salary}" class="form-control" disabled>    
                                </div>
                                <div class="col-sm-4 form-group">
                                    <label>Designation</label>
                                    <input type="text" value="${employee.designation}" class="form-control" disabled>
                                </div>
                                <div class="col-sm-4 form-group">
                                    <label>Joining Date</label>
                                    <input type="text" value="${employee.joindate}" class="form-control"  disabled>
                                </div>
                            </div>
                            <hr>
                            <h3 style="text-align: start;">Personal Details</h3>
                            <div class="row">
                                <div class="col-sm-4 form-group">
                                    <label>First Name</label>
                                    <input type="text" value="${employee.fName}" class="form-control" disabled>
                                </div>
                                <div class="col-sm-4 form-group">
                                    <label>Middle Name</label>
                                    <input type="text" value="${employee.mName}" class="form-control" disabled>
                                </div>
                                <div class="col-sm-4 form-group">
                                    <label>Last Name</label>
                                    <input type="text" value="${employee.lName}" class="form-control"  disabled>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Gender</label>
                                    <input type="text" value="${employee.gender}" class="form-control" disabled>    
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label>DOB</label>
                                    <input type="text" value="${employee.dob}" class="form-control" disabled>
                                </div>
                            </div>
								
						<div class="form-group">
							<label>Password</label>
								<input type="text" value="${employee.password}" class="form-control" disabled>
                        </div>
                        
                        <div class="row">
							<div class="col-sm-6 form-group">
								<label>Email Address 1</label>
								<input type="text" value="${email1}" class="form-control"  disabled>
							</div>	
							<div class="col-sm-6 form-group">
								<label>Email Address 2</label>
								<input type="text" value="${email2}" class="form-control"  disabled>
							</div>		
						</div>	

						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Phone Number 1</label>
								<input type="text" value="${contact1}" class="form-control"  disabled>
							</div>	
							<div class="col-sm-6 form-group">
								<label>Phone Number 2</label>
								<input type="text" value="${contact2}" class="form-control"  disabled>
							</div>		
						</div>	
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>House Number</label>
								<input type="text" value="${employee.houseNo}" class="form-control"  disabled>
							</div>	
							<div class="col-sm-6 form-group">
								<label>Street</label>
								<input type="text" value="${employee.street}" class="form-control"  disabled>
							</div>		
						</div>
						
							<div class="form-group">
								<label>City</label>
								<input type="text" value="${employee.city}" class="form-control"  disabled>
							</div>		
                        
                        <hr>
                        <h3 style="text-align: start;">Bank Details</h3>
                        <div class="row">
                            <div class="col-sm-4 form-group">
                                <label>Bank Name</label>
                                <input type="text" value="${bank.bName}" class="form-control" disabled>    
                            </div>
                            <div class="col-sm-4 form-group">
                                <label>Account Number</label>
                                <input type="text" value="${bank.accountNo}" class="form-control" disabled>
                            </div>
                            <div class="col-sm-4 form-group">
                                <label>IFSC Code</label>
                                <input type="text" value="${bank.ifscCode}" class="form-control"  disabled>
                            </div>
                        </div>
                    </div>
                    <p align="center"><button onclick="Edit()" class="btn btn-primary btn-md" style="font-size: large;"><i class="fa fa-edit"></i> Edit </button></p>	
                    </div>
            </div>
            <div id="form" style="display: none;">
                <form action="employee/editemployee" method="post" modelAttribute="employee">
                <div class="row">            
                    <div class="col-sm-12">
                        <!-- <p>${error}</p> -->
                        <div class="row">
                            <div class="col-sm-4 form-group">
                                <label>Salary</label>
                                <input type="text" value="${employee.salary}" class="form-control" disabled>    
                            </div>
                            <div class="col-sm-4 form-group">
                                <label>Designation</label>
                                <input type="text" value="${employee.designation}" class="form-control" disabled>
                            </div>
                            <div class="col-sm-4 form-group">
                                <label>Joining Date</label>
                                <input type="text" value="${employee.joindate}" class="form-control"  disabled>
                            </div>
                        </div>
                        <hr>
                        <h3 style="text-align: start;">Personal Details</h3>
                        <div class="row">
                            <div class="col-sm-4 form-group">
                                <label>First Name</label>
                                <input type="text" value="${employee.fName}" class="form-control" name="fName" required="true">
                            </div>
                            <div class="col-sm-4 form-group">
                                <label>Middle Name</label>
                                <input type="text" value="${employee.mName}" class="form-control" name="mName">
                            </div>
                            <div class="col-sm-4 form-group">
                                <label>Last Name</label>
                                <input type="text" value="${employee.lName}" class="form-control" name="lName">
                            </div>
                        </div>

                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label>Gender</label>
                            <select class="form-control" name="gender" style="color: black;" required>
                                <option value="none">-- select --</option>
                                <option value="male">male</option>
                                <option value="female">female</option>
                                <option value="others">others</option>
                            </select>      
                        </div>

                        <div class="col-sm-6 form-group">
                            <label>DOB</label>
                            <input type="date" value="${employee.dob}" class="form-control" name="dob" required>
                        </div>		
                    </div>
                            
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label>New Password</label>
                            <input type="password" value="${employee.password}" class="form-control" name="password" required="true" minlength="8" maxlength="20">
                        </div>	
                        <div class="col-sm-6 form-group">
                            <label>Confirm Password</label>
                            <input type="password" value="${employee.password}" class="form-control" name="mpassword">
                        </div>		
                    </div>

                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label>Email Address 1</label>
                            <input type="text" value="${email1}" class="form-control" name="email1">
                        </div>	
                        <div class="col-sm-6 form-group">
                            <label>Email Address 2</label>
                            <input type="text" value="${email2}" class="form-control" name="email2" >
                        </div>		
                    </div>	

                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label>Phone Number 1</label>
                            <input type="text" value="${contact1}" class="form-control" minlength="10" maxlength="10" name="contact1" required="true" >
                        </div>	
                        <div class="col-sm-6 form-group">
                            <label>Phone Number 2</label>
                            <input type="text" value="${contact2}" class="form-control" minlength="10" maxlength="10" name="contact2" >
                        </div>		
                    </div>	

                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label>House Number</label>
                            <input type="text" value="${employee.houseNo}" class="form-control" name="houseNo" >
                        </div>	
                        <div class="col-sm-6 form-group">
                            <label>Street</label>
                            <input type="text" value="${employee.street}" class="form-control" name="street">
                        </div>		
                    </div>
                    
                        <div class="form-group">
                            <label>City</label>
                            <input type="text" value="${employee.city}" class="form-control" name="city" required="true" >
                        </div>			
                    
                    <hr>
                        <h3 style="text-align: start;">Bank Details</h3>
                        <div class="row">
                            <div class="col-sm-4 form-group">
                                <label>Bank Name</label>
                                <input type="text" value="${bank.bName}" class="form-control" name="bname">    
                            </div>
                            <div class="col-sm-4 form-group">
                                <label>Account Number</label>
                                <input type="text" value="${bank.accountNo}" class="form-control" name="account">
                            </div>
                            <div class="col-sm-4 form-group">
                                <label>IFSC Code</label>
                                <input type="text" value="${bank.ifscCode}" class="form-control"  name="ifsc">
                            </div>
                        </div>
                    </div>
                    <p align="center">	<button type="submit" class="btn btn-primary btn-sm" style="font-size: large;"> Update </button></p>		
                    </div>    
                </div>
                </form>
            </div> 
            
    </div>
</div>
</div>
</div>
</body>

<script>
    function Edit() {
      var y = document.getElementById("form");
      var x = document.getElementById("view");
        y.style.display = "flex";
        x.style.display = "none";
    }
</script>