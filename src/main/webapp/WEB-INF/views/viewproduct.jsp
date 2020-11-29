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
    <div class="col-sm-12"style="padding-left: 0px; margin-top: 92px">
        <div class="row" style="float:left">
            <div class="col-sm-2 " style="float: left; font-size:25px; margin-left:0;">
                <div class="shape">
                    ${message}
                </div>
            </div>
        <c:choose>
            <c:when test="${ message != 'Out Of Stock' }">
            <div class="col-sm-4 form-group">
            <form action="/product/1" >
                Filter By Category
                            <div class="input-group">
                                <select name="category" class="form-control" style="color: black;">
                                    <option value="-1">-- select -- </option>
                                    <c:forEach items="${categorylist}" var="cat">
                                        <option value="${cat.categoryid}">${cat.name}</option>
                                    </c:forEach>
                                </select>
                                <input type="hidden" name="type" value="all"/>
                                <div class="input-group-btn">
                                    <div class="btn-group" role="group">
                                        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                    </div>
                                </div>
                            </div>	
            </form>
            </div>
            <div class="col-sm-4 form-group">
            <form action="/product/2" style="float: left;">
                Filter By Product Type
                <div class="input-group">
                    <select name="type" class="form-control" style="color: black;">
                        <option value="none">-- select --</option>
                        <c:forEach items="${types}" var="type">
                            <option value="${type}">${type}</option>
                        </c:forEach>
                    </select>
                    <input type="hidden" name="category" value="0"/>
                    <div class="input-group-btn">
                        <div class="btn-group" role="group">
                            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                        </div>
                    </div>
                </div>	
            </form>
            </div>

            <p style="text-align: start; margin-top:15px">
                <c:choose>
                    <c:when test="${role == 'employee' }"> 
                        <a href="/employee/addproduct" class="btn btn-primary btn-sm" style="font-size: medium; margin-top:4px;">Add Product</a>
                        <a href="/employee/outofstock" class="btn btn-primary btn-sm" style="font-size: medium; margin-top:4px;">Out of Stock Items</a>
                     </c:when>
                    <c:when test="${role == 'admin' }"> 
                        <a href="/admin/addproduct" class="btn btn-primary btn-sm" style="font-size: medium; margin-top:4px; ">Add Product</a> 
                        <a href="/admin/outofstock" class="btn btn-primary btn-sm" style="font-size: medium; margin-top:4px;">Out of Stock Items</a>
                    </c:when>
                </c:choose>
            </p>
            </c:when>
        </c:choose>
        </div>
    </div>

<div class="container-fluid" style="clear: both;">
<div class="row">
    <c:forEach var="pro" items="${list}">
      <div class="col-md-3 col-sm-6" style="padding: 5px;">
          <div class="product-grid4" >

              <div class="product-image4">
                  <a href="/productdetail/${pro.productid}">
                      <img  src="../../resources/images/${pro.photo}" alt="">
                  </a>
                  <span class="product-discount-label">-${pro.discount}%</span>
              </div>

              <div class="product-content">
                  <h3 class="title"><a>${pro.pName}</a></h3>
                  <h3 class="title"><a>${pro.brand}</a></h3>
                  <div class="price">
                    Rs. ${Math.round(pro.sellprice*(1-pro.discount/100))}
                      <span>Rs. ${pro.sellprice}</span>
                  </div>

                <c:choose>
                    <c:when test="${role == 'customer' && pro.incart=='false' }"> <a class="add-to-cart" href="/customer/addtocart/${pro.productid}">ADD TO CART</a> </c:when>
                    <c:when test="${role == 'customer' && pro.incart=='true' }"> <a class="add-to-cart" href="/customer/cart">GO TO CART</a> </c:when>
                    <c:when test="${role == 'employee' }"> <a class="add-to-cart" href="/employee/editproduct/${pro.productid}"><i class="fa fa-edit"></i> Edit</a> </c:when>
                    <c:when test="${role == 'admin' }"> 
                        <a class="add-to-cart" href="/admin/editproduct/${pro.productid}"><i class="fa fa-edit"></i> Edit</a> &nbsp; &nbsp;
                        <a class="add-to-cart" href="/admin/deleteproduct/${pro.productid}"><i class="fa fa-trash"></i> Delete</a> 
                    </c:when>
                </c:choose>
                
              </div>
          </div>
      </div>
    </c:forEach>
</div>
</div>
</div>

<jsp:include page="footer.jsp" />