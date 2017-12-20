<%@page import="model.Product"%>
<%@page import="model.Cart"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MAIN</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</head>
<!--/head-->
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<jsp:include page="banner.jsp"></jsp:include>
	<section>
		<div class="container">

			<div class="row">
			<jsp:include page="category.jsp"></jsp:include>
				<%
					if (request.getParameter("category_id") != null) {
				%> 
			<jsp:include page="product.jsp" ></jsp:include> 
				<%
 					}
 				%>

				<div class="col-sm-9 padding-right">
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">Features Items</h2> 
						<%
 							if (request.getParameter("category_id") == null) {
 						%>
 						<div class="col-sm-12">
							<div class="col-md-4"><img alt="" src="/WebBH/img/CLEVELAND_CAVALIERS_NIKE_THERMA_FLEX_SHOWTIME.jpg" width="250px" /></div>
							<div class="col-md-4"><img alt="" src="/WebBH/img/TIRO 17 TRAINING PANTSx.jpg" width="250px" /></div>
							<div class="col-md-4"><img alt="" src="/WebBH/img/NIKE_SPORTSWEAR_TECH_FLEECE.jpg" width="250px" /></div>
							 
						</div>
						 
							<div class="col-md-12" >
								<img alt="" src="/WebBH/img/NIKELAB_ACG_ALPINE_4.jpg" style="padding:20px 0 20px 0; max-width: 100%;height: auto;" />
							</div>
						
						 <div class="col-sm-12">
							<div class="col-md-4"><img alt="" src="/WebBH/img/SPEEDBREAKER HYPE SPEED-PRINT SHORTS.jpg" width="250px" /></div>
							<div class="col-md-4"><img alt="" src="/WebBH/img/TIRO 17 TRAINING PANTS.jpg" width="250px" /></div>
							<div class="col-md-4"><img alt="" src="/WebBH/img/NIKE_SPORTSWEAR_TECH_AEROLOFT_3-IN-1_praka.jpg" width="250px" /></div> 
						</div>
						<%
 							}
 						%>

					</div>
				</div>
			</div>



		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
