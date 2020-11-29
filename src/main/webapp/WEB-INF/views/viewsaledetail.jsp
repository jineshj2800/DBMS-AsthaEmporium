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
<h2>SaleID: ${sale.saleid}</h2>
<h4>Customer Name: ${sale.cName}</h4>
<h4>Total Bill: ${sale.bill}</h4>
<h4>Date: ${sale.date}</h4>
<h4>PaymentID: ${sale.paymentid}</h4>
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
</div>

