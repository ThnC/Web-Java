<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LIST</title>
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
	<%
	ProductDAOImpl spDAO = new ProductDAOImpl();
	ArrayList<Product> arr = spDAO.getList();
	int start = 0, end = 9;
	if(arr.size() < 9) {
		end = arr.size();
	}
		
	
	if (request.getParameter("start") != null) {
		start = Integer.parseInt(request.getParameter("start"));
	}
	if (request.getParameter("end") != null) {
		end = Integer.parseInt(request.getParameter("end"));
	}
	ArrayList<Product> list = spDAO.getListByPage(arr, start, end);
%>

	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="banner.jsp"></jsp:include>
	<section>
		<div class="container">
			<div class="row"><jsp:include page="category.jsp"></jsp:include>
				<div class="col-sm-9 padding-right">
					<div class="features_items">
						<!--features_items-->

						<h2 class="title text-center">Features Items</h2> 
						<%
							for(Product sp : list){
						%>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center"><img
											src="images/shop/product12.jpg" alt=""
										/>
										<h2>$56</h2>
										<p><%=sp.getProduct_name() %></p> <a href="#"
											class="btn btn-default add-to-cart"
										>
											<i class="fa fa-shopping-cart"></i>
											Add to cart
										</a></div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2><%=sp.getProduct_price() %></h2>
											<p><%=sp.getProduct_name() %>n</p> <a href="#"
												class="btn btn-default add-to-cart"
											>
												<i class="fa fa-shopping-cart"></i>
												Add to cart
											</a>
									</div>
								</div>
							</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li>
											<a href="">
												<i class="fa fa-plus-square"></i>
												Add to wishlist
											</a>
										</li>
										<li>
											<a href="">
												<i class="fa fa-plus-square"></i>
												Add to compare
											</a>
										</li>
									</ul>
							</div>
						</div>
					</div> 
					<%
						}
                    %>
						<div style="clear:both"></div>
						<ul class="pagination">
							<%
								int a, b;
								int limit = arr.size() / 9;
								if (limit * 9 < arr.size()) {
									limit += 1;
								}
								for (int i = 1; i <= limit; i++) {
									a = (i - 1) * 9;
									b = i * 9;
									if(b > arr.size()) {
										b = arr.size();
									}
								
							
							%>
							<li><a href="list.jsp?start=<%=a%>&end=<%=b%>" ><%=i %></a></li>
							<%
							}
							%>


						</ul>
				</div> <!--features_items-->
			</div></div>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>