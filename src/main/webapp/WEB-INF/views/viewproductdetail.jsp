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

<div class="container-fluid" style="margin-top: 92px;">
<div class="row">
      <div class="col-md-3 col-sm-6" style="padding: 5px;">
          <div class="product-grid4">
              <div class="product-image4">
                  <a >
                      <img  src="../../resources/images/${pro.photo}" alt="">
                  </a>
                  <span class="product-discount-label">-${pro.discount}%</span>
                  
              </div>
          </div>
      </div>
      <div class="col-md-4 col-sm-6" style="padding: 5px;">
        <div class="product-description">
            <h4>ProductID: ${pro.productid}</h4>
        <span>${pro.brand}</span>
            <br>
            <h>${pro.pName}</h>
            <p>${pro.desc}</p>
            <h4>size: ${pro.size}</h4>
            <h4>color: ${pro.color}</h4>
            <h4>Instock: ${pro.quantity} left</h4>
        </div>
        
        <div class="price2">
            Rs. ${Math.round(pro.sellprice*(1-pro.discount/100))}
            <span>Rs. ${pro.sellprice}</span>
        </div>
        <br>
          <c:choose>
              <c:when test="${role == 'customer' && pro.incart=='false' && pro.quantity>0}"> <a class="add-cart" href="/customer/addtocart/${pro.productid}">ADD TO CART</a> </c:when>
              <c:when test="${role == 'customer' && pro.incart=='true' }"> <a class="add-cart" href="/customer/cart">GO TO CART</a> </c:when>
              <c:when test="${role == 'employee' }"> <a class="add-cart" href="/employee/editproduct/${pro.productid}"><i class="fa fa-edit"></i> Edit</a> </c:when>
              <c:when test="${role == 'admin' }"> 
                  <a class="add-cart" href="/admin/editproduct/${pro.productid}"><i class="fa fa-edit"></i> Edit</a> &nbsp; &nbsp;
                  <a class="add-cart" href="/admin/deleteproduct/${pro.productid}"><i class="fa fa-trash"></i> Delete</a> 
              </c:when>
          </c:choose>
        
    </div>
</div>
</div>

<jsp:include page="footer.jsp" />