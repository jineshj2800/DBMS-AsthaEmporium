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


<body>
<div class="allButFooter">
  <div class="shape" style="float: left; font-size:25px; margin-top:92px">
    Available Offers
</div>

<br style="clear:both">
<c:forEach varStatus="k" var="offer" items="${list}"> 
        <div class="coupon" style="float: left; margin-left:20px">
            <div class="container-1" style="background-color:white">
              <h2><b>${offer.discount}</b></h2> 
              <p>${offer.desc}</p>
            </div>
            <div class="container-1">
              <h4>Use Promo Code: <span class="promo">${offer.offerid}</span></h4>
              <h4 class="expire">Expires: ${offer.expiryDate}</h4>
            </div>
          </div>
          <br style="clear: both;">
          <br>
</c:forEach>
</div>
</body>


<jsp:include page="footer.jsp" />