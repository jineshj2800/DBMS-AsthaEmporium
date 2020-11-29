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

<div class="container-fluid" style="margin-top:92px">
<h2>OrderID: ${order.orderid}</h2>
<h4>CustomerID: ${order.customerid}</h4>
<h4>Delivery Address: ${order.address}</h4>
<h4>Status: ${order.status}</h4>
<h4>Delivery Date: ${order.date}</h4>
<h4>CourierID: ${order.courierid}</h4>
<div class="row" >
    <c:forEach var="pro" items="${list}">
      <div class="col-md-2 col-sm-6">
          <div class="product-grid4">
              <div class="product-image4">
                  <a href="/productdetail/${pro.productid}">
                      <img  src="../../resources/images/${pro.photo}" alt="">
                  </a>
                  
              </div>
              <div class="product-content">
                  <h3 class="title"><a>${pro.pName}</a></h3>
                  <h3 class="title"><a>${pro.brand}</a></h3>
                  <h3 class="title"><a>Quantity: ${pro.quantity} &nbsp;&nbsp; Size: ${pro.size}</a></h3>
                  <div class="price">
                    Rs. ${Math.round(pro.sellprice*(1-pro.discount/100))}
                      <span>Rs. ${pro.sellprice}</span>
                  </div>
              </div>
          </div>
      </div>
    </c:forEach>
</div>
<br>
<h4>PaymentID: ${order.paymentid}</h4>
<div class="panel panel-default" style="width: 20%;">
    <h5 style="text-align: start; margin-left:10px; float:left;"> Date: ${invoice.date}  </h5>
    <h5 style="text-align: end; margin-right:10px;float:right;"> Time: ${invoice.time}  </h5>
    <hr style="clear:both;"/>
    <div class="row" style="text-align: center;">
					<div class="col-sm-12">
                        <!-- <p>${error}</p> -->
                        <div class="row">
						<div class="col-sm-6 form-group">
                            Net Amount:
                        </div>	
                        <div class="col-sm-4 form-group">
                             Rs. ${invoice.amount}
                        </div>	
                        </div>	
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                Discount:
                            </div>	
                            <div class="col-sm-4 form-group">
                            - Rs. ${invoice.discount}
                            </div>	
                        </div>	
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                Tax Applied:
                            </div>	
                            <div class="col-sm-4 form-group">
                                Rs. ${invoice.tax}
                            </div>	
                        </div>	
                        <hr style="margin:0px 30px 7px 30px;">
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                Total Bill:
                            </div>	
                            <div class="col-sm-4 form-group">
                                Rs.${order.cost}
                            </div>	
                        </div>
				    </div>
	</div>
</div>
</div>

