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
</style>

<body style="margin-top:92px">
<div class="allButFooter">
    <table border="2" width="70%" cellpadding="2">  
        <caption><h1>Payment Section</h1></caption>
        <tr><th>Item No.</th><th>Product Name</th><th>Brand</th><th>Size</th><th>Quantity</th><th>Cost</th><th>Discount</th><th>Total Cost</th><th>GST</th></tr>  
        <c:forEach varStatus="k" var="item" items="${list}">   
        <tr>  
        <td> ${k.count}</td>
        <td> ${item.product.pName}</td>  
        <td> ${item.product.brand}</td>
        <td> ${item.product.size}</td>
        <td> ${item.quantity}</td>  
        <td> ${item.product.sellprice}</td>  
        <td> ${item.product.discount}%</td>
        <td>Rs. ${item.quantity*item.product.sellprice}</td>
        <td>
            <c:choose>
                <c:when test="${ item.product.sellprice <= 1000 }"> 5%</c:when>
                <c:otherwise>12%</c:otherwise>
            </c:choose>
        </td>
        </tr>  
        </c:forEach> 
    </table>
    <form action="/customer/apply" >
    <div class="form-group" style="width: 20%; margin-left: 20px; float:left; clear:both">
        <label>Apply Coupon</label>
        <input class="form-control" name="code" type="text" value="${code}" placeholder="Enter Promo Code (if available)"/>
    </div>
    <input type="submit" class="btn btn-primary btn-sm" style="font-size: medium; float:left; margin-top:23px" value="Apply"/></p>
    </form>

    <form action="/customer/placeorder" method="POST" modelAttribute="customer">
    <div class="panel panel-default" style="width: 30%; margin-left: 20px; float:left; clear:both">
        <div class="panel-heading">  <h4 style="text-align: start;">Delivery Address</h4></div>

        <div class="row" style="padding: 10px;">
                        <div class="col-sm-12">
                        <c:choose>
                            <c:when test="${ error != 'false' }"><div  id="login-alert" class="alert alert-danger" style="text-align: center;"><strong>${error}</strong></div></c:when>
                        </c:choose>
                            <div class="row">
                                <input type="hidden" name="customerID" value="${customer.customerID}" />
                                <div class="col-sm-6 form-group">
                                    <label>House Number</label>
                                    <input type="text" value="${customer.houseNo}" class="form-control" name="houseNo" required>
                                </div>	
                                <div class="col-sm-6 form-group">
                                    <label>Street</label>
                                    <input type="text" value="${customer.street}" class="form-control" name="street" required>
                                </div>		
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>City</label>
                                    <input type="text" value="${customer.city}" class="form-control" name="city" required="true">
                                </div>		
                                <div class="col-sm-6 form-group">
                                    <label>Pincode</label>
                                    <input type="text" class="form-control" name="pincode" minlength="6" maxlength="6" required="true">
                                </div>	
                            </div>			
                        </div>
        </div>  
    </div>

    <div class="panel panel-default" style="width: 20%; margin-left: 20px; float:left;">
        <div class="panel-heading">  <h4 style="text-align: start;">Invoice</h4></div>
        <input type="hidden" value="${bill}" name="amount" />
        <input type="hidden" value="${tax}" name="tax" />
        <input type="hidden" value="${offerid}" name="offerid">
        <input type="hidden" value="${discount+offer}" name="discount" />
        <br>
        <div class="row" style="text-align: center;">
                        <div class="col-sm-12">
                            <!-- <p>${error}</p> -->
                            <div class="row">
                            <div class="col-sm-6 form-group">
                                Net Amount:
                            </div>	
                            <div class="col-sm-4 form-group">
                                Rs. ${bill}
                            </div>	
                            </div>	
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    Discount:
                                </div>	
                                <div class="col-sm-4 form-group">
                                    - Rs. ${discount}
                                </div>	
                            </div>	
                            <c:choose>
                                <c:when test="${ offer > 0 }">
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    Extra Discount:
                                </div>	
                                <div class="col-sm-4 form-group">
                                    - Rs. ${offer}
                                </div>	
                            </div>
                                </c:when>
                            </c:choose>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    Tax Applied:
                                </div>	
                                <div class="col-sm-4 form-group">
                                    Rs. ${tax}
                                </div>	
                            </div>	
                            <hr style="margin:0px 30px 7px 30px;">
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    Total Bill:
                                </div>	
                                <div class="col-sm-4 form-group">
                                    Rs. ${bill+tax-discount-offer}
                                </div>	
                            </div>
                           
                        </div>
        </div>   
    </div>

        <br>
        <div class="form-group" style="width: 20%; margin-left: 20px; clear:both">
            <label>Mode of Payment</label>
            <select class="form-control" name="mode" style="color: black;" required>
              <option value="cash">Cash</option>
              <option value="gpay">Gpay</option>
              <option value="card">Card</option>
              <option value="paytm">Paytm</option>
            </select>
        </div>

    <p align="center"><input type="submit" class="btn btn-primary btn-sm" style="font-size: large;" value="Place Order"/></p>
    
    </form>
</div>
</body>

<jsp:include page="footer.jsp" />