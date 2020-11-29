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
	.error {
	color: #ff0000;
	font-style: italic;
	}
</style>

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
<h1>In Store Sale</h1>
<hr style="margin: 20px;">

<form action="additem" modelAttribute="sale" id="form1" style="margin: 20px;">

    <div style="float: left; width: 20%;">
    <h4>Date: ${sale.date}</h4>
    <hr>
    <div class="form-group">
        <label>Customer Name</label>
        <input type="text" name="cName" required="true" value="${sale.cName}" class="form-control" placeholder="Enter Customer Name"/>
    </div>
    <input type="hidden" name="date" value="${sale.date}">
   
    <c:forEach items="${sale.items}" var="item" varStatus="status">
		<tr>
			<td><input type="hidden" name="items[${status.index}].productid" value="${item.productid}"/></td>
			<td><input type="hidden" name="items[${status.index}].pName" value="${item.pName}"/></td>
            <td><input type="hidden" name="items[${status.index}].brand" value="${item.brand}"/></td>
            <td><input type="hidden" name="items[${status.index}].size" value="${item.size}"/></td>
            <td><input type="hidden" name="items[${status.index}].quantity" value="${item.quantity}"/></td>
            <td><input type="hidden" name="items[${status.index}].discount" value="${item.discount}"/></td>
            <td><input type="hidden" name="items[${status.index}].sellprice" value="${item.sellprice}"/></td>
		</tr>
	</c:forEach>
    </div>
    <div class="panel panel-default" style="width: 35%; margin-left: 20px; float:right">
        <div class="panel-heading">  <h4 style="text-align: start;">Add Item</h4></div>
        <div class="row" style="padding: 10px;">
                        <div class="col-sm-12">
                            <c:choose>
                                <c:when test="${ error != 'false' }"><div  id="login-alert" class="alert alert-danger" style="text-align: center;"><strong>${error}</strong></div></c:when>
                            </c:choose>
                            <div class="row">
                                <div class="col-sm-5 form-group">
                                    <label>ProductID</label>
                                    <input type="number" name="id" class="form-control" placeholder="Enter ProductID" required="true"/>
                                </div>	
                                <div class="col-sm-5 form-group">
                                    <label>Quantity</label>
                                    <input type="number" name="n" required="true" min="1" value="1" class="form-control" placeholder="Enter Quantity"/>
                                </div>		
                                <p align="center"><input type="submit" class="btn btn-primary btn-sm" style="font-size: small; ;margin-top:25px" value="Add"/></p>
                            </div>
                        </div>
        </div>  
    </div>
</form>


<table border="2" width="70%" cellpadding="2">  
    <tr><th>Item No.</th><th>Product Name</th><th>Brand</th><th>Size</th><th>Quantity</th><th>Cost</th><th>Discount</th><th>Total Cost</th><th>GST</th></tr>  
    <c:forEach varStatus="k" var="item" items="${sale.items}"> 
    <tr>  
    <td> ${k.count}</td>
    <td> ${item.pName}</td>  
    <td> ${item.brand}</td>
    <td> ${item.size}</td>
    <td> ${item.quantity}</td>  
    <td> ${item.sellprice}</td>  
    <td> ${item.discount}%</td>
    <td>Rs. ${item.quantity*item.sellprice}</td>
    <td>
        <c:choose>
            <c:when test="${ item.sellprice <= 1000 }"> 5%</c:when>
            <c:otherwise>12%</c:otherwise>
        </c:choose>
    </td>
    </tr>  
    </c:forEach> 
</table>
<br>

<form action="savesale" method="POST" modelAttribute="sale">

    <input type="hidden" name="cName" value="${sale.cName}"/>
    <input type="hidden" name="date" value="${sale.date}">
    <input type="hidden" name="bill" value="${bill+tax-discount}">
    <c:forEach items="${sale.items}" var="item" varStatus="status">
		<tr>
			<td><input type="hidden" name="items[${status.index}].productid" value="${item.productid}"/></td>
			<td><input type="hidden" name="items[${status.index}].pName" value="${item.pName}"/></td>
            <td><input type="hidden" name="items[${status.index}].brand" value="${item.brand}"/></td>
            <td><input type="hidden" name="items[${status.index}].size" value="${item.size}"/></td>
            <td><input type="hidden" name="items[${status.index}].quantity" value="${item.quantity}"/></td>
            <td><input type="hidden" name="items[${status.index}].discount" value="${item.discount}"/></td>
            <td><input type="hidden" name="items[${status.index}].sellprice" value="${item.sellprice}"/></td>
		</tr>
    </c:forEach>

        <div class="panel panel-default" style="width: 20%; margin-left: 20px;">
            <div class="panel-heading">  <h4 style="text-align: start;">Bill</h4></div>
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
                                        Rs. ${bill+tax-discount}
                                    </div>	
                                </div>
                               
                            </div>
            </div>   
        </div>
        <br>
        <div class="form-group" style="width: 20%; margin-left: 20px">
            <label>Mode of Payment</label>
            <select class="form-control" name="mode" style="color: black;" required>
              <option value="cash">Cash</option>
              <option value="gpay">Gpay</option>
              <option value="card">Card</option>
              <option value="paytm">Paytm</option>
            </select>
        </div>

    <p align="center"><input type="submit" class="btn btn-primary btn-sm" style="font-size: large;" value="Submit"/></p>
</form>

</body>
</html>