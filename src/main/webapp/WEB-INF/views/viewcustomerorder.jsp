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
<div class="allButFooter">
<div class="shape" style="float: left; font-size:25px; margin-top: 92px">
    Order History
</div>

<div class="container-fluid" style="clear:both">
<c:forEach var="order" items="${list}" varStatus="status">
<h3>OrderID : ${order.orderid}</h3>
<h4>Status: ${order.status}</h4>
<h4>Delivery Date: ${order.date}</h4>
<div class="row" >
    <c:forEach var="pro" items="${itemlist[status.count-1]}">
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

<div class="panel panel-default" style="width: 20%;">
    <h5 style="text-align: start; margin-left:10px; float:left;"> Date: ${invoicelist[status.index].date}  </h5>
    <h5 style="text-align: end; margin-right:10px;float:right;"> Time: ${invoicelist[status.index].time}  </h5>
    <hr style="clear:both;"/>
    <div class="row" style="text-align: center;">
					<div class="col-sm-12">
                        <!-- <p>${error}</p> -->
                        <div class="row">
						<div class="col-sm-6 form-group">
                            Net Amount:
                        </div>	
                        <div class="col-sm-4 form-group">
                             Rs. ${invoicelist[status.index].amount}
                        </div>	
                        </div>	
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                Discount:
                            </div>	
                            <div class="col-sm-4 form-group">
                            - Rs. ${invoicelist[status.index].discount}
                            </div>	
                        </div>	
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                Tax Applied:
                            </div>	
                            <div class="col-sm-4 form-group">
                                Rs. ${invoicelist[status.index].tax}
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

<c:choose>
    <c:when test="${feedback[status.index] == 'false'}">
<div class="panel panel-default" style="width: 30%;" >
    <div class="panel-heading">  <h4 style="text-align: start;">Give Feedback</h4></div>
    <input type="hidden" value="${bill}" name="amount" />
    <input type="hidden" value="${tax}" name="tax" />
    <input type="hidden" value="${discount}" name="discount" />
    <div class="row" style="padding: 10px;">
                <form action="feedback" method="POST">
                    <input type="hidden" value="${order.orderid}" name="orderid">
                    <div class="col-sm-12">
                        <!-- <p>${error}</p> -->
                        <div class="form-group">
                            <label>Rate Order</label>
                            <select class="form-control" name="rating" style="color: black;" required>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <textarea class="form-control" placeholder="Share your experience " style="color: black;" rows="4" name="desc" maxlength="500"></textarea>
                        </div>	
                    </div>
                    <p style="margin-left: 20px;">	<button type="submit" class="btn btn-primary btn-sm" style="font-size: medium;">Submit</button></p>
                </form>
    </div>  
</div>
    </c:when>
    <c:when test="${feedback[status.index] == 'true'}">
        <h4>Thankyou for your feedback</h4>
    </c:when>
</c:choose>
<br>
<hr style="clear: both;"/>
</c:forEach>
</div>
</div>

<jsp:include page="footer.jsp" />