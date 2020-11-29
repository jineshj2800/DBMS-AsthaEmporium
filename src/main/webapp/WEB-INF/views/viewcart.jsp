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
<div class="shape" style="float: left; font-size:25px; margin-top:92px" >
    Cart Items
</div>

<div class="container-fluid" style="clear:both ;">
<div class="row">
    <c:forEach var="item" items="${list}">
      <div class="col-md-3 mx-auto" style="padding: 5px;">
          <div class="product-grid4">

              <div class="product-image4">
                  <a href="/productdetail/${item.product.productid}">
                      <img  src="../../resources/images/${item.product.photo}" alt="">
                  </a>
                  <span class="product-discount-label">-${item.product.discount}%</span>
              </div>

              <div class="product-content">
                  <h3 class="title"><a>${item.product.pName}</a></h3>
                  <h3 class="title"><a>${item.product.brand}</a></h3>
                  <h3 class="title"><a>Instock: ${item.product.quantity} left &nbsp;&nbsp; Size: ${item.product.size}</a></h3>
                  Quantity: 
                <div class="count">
                    <form action="increase/${item.product.productid}">
                        <input type="hidden" name="maxvalue" value="${item.product.quantity}">
                        <input type="hidden" name="n" value="${item.quantity}">
                        <input type="submit" style="font-size : 13px; font-weight:bolder; color:black" value="+">
                    </form>
                </div>
                ${item.quantity}
                <div class="count">
                    <form action="decrease/${item.product.productid}">
                        <input type="hidden" name="n" value="${item.quantity}">
                        <input type="submit" style="font-size : 13px; font-weight:bolder; color:black" value="-">
                    </form>
                </div>
            
                  <div class="price">
                    Rs. ${Math.round(item.product.sellprice*(1-item.product.discount/100))}
                      <span>${item.product.sellprice}</span>
                  </div>
                
                  <a href="/customer/deletecart/${item.product.productid}" class="add-to-cart"><i class="fa fa-trash"></i> Delete</a> 
              </div>
          </div>
      </div>
    </c:forEach>
</div>
<hr>
<br>
<c:choose>
    <c:when test="${list.size() > 0}">
        <p style="margin-left: 142px;"><a href="/customer/payment" class="btn btn-primary btn-sm" style="font-size: large; text-align:center">Proceed To Pay</a></p>
    </c:when>
    <c:otherwise>
        <h2 style="text-align:center; margin-top:100px">Empty Cart</h2>
    </c:otherwise>
</c:choose>
</div>
</div>
<jsp:include page="footer.jsp" />