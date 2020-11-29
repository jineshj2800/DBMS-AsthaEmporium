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


    
<div class="image-aboutus-banner" style="margin-top:70px">
   <div class="container">
    <div class="row">
        <div class="col-md-12">
         <h1 class="lg-text">Astha Emporium</h1>
         <p class="image-aboutus-para">Clothes that will lift you, So wear better, look better !!</p>
       </div>
    </div>
    </div>
</div>

<div class="container paddingTB60">
	<div class="row">

            <!-- Blog Post Content Column -->
            <div class="col-lg-8">

                <h2 align="center"> New Clothes, New Passion </h2>

                <hr>

                <!-- Preview Image -->
                <img class="img-responsive" src="../../resources/images/home.jpg" alt="">

                <hr>

                <!-- Post Content -->
                <p class="lead">Elegant and Unique designs for unique quench of style to bloom your elegance!!</p>
                <p></p>

                <hr>

               
                <p><a href="/product" class="btn btn-primary btn-sm" style="font-size: large;"> Get Your Deal Now </a></p>

            </div>

            <!-- Blog Sidebar Widgets Column -->
            <div class="col-md-3">

                <!-- Side Widget Well -->
                <div class="well bgcolor-skyblue">
                    <h4>Welcome to Astha Emporium</h4>
                    <p>Here you get clothes that are more than just stitched fabric. Our fabric will build your trust in us. Be what you want to be and wear what you like, so keep calm and try our outfit.</p>
                </div>
                
                <!-- Blog Categories Well -->
                <div class="well">
                    <h4>Available Categories</h4>
                    <div class="row">
                        <div class="col-lg-12">
                            <ul>
                                <c:forEach items="${list}" var="cat">
                                    <li>
                                        <a href="/category/${cat.categoryid}">${cat.name}</a>
                                        <p>${cat.variety}</p>
                                    </li>

                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>

            </div>

        </div>
</div>

<jsp:include page="footer.jsp" />