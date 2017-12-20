
<%@page import="model.Cart"%>
<%@page import="model.Product"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>PRODUCT</title>
</head>
<!--/head-->
<body>
	<%
		ProductDAOImpl productDAO = new ProductDAOImpl();
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
		
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart == null){
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	%>

	<div class="col-sm-9 padding-right">
		<div class="features_items">
			<!--features_items-->
			<h2 class="title text-center">Features Items</h2>
			<%for (Product sp : productDAO.getListProductByCategory(Long.parseLong(request.getParameter("category_id")))) {%>
			<div class="col-sm-4">
				<div class="product-image-wrapper">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="/WebBH/img/<%=sp.getProduct_image() %>" alt="" />
							<h2><%=nf.format(sp.getProduct_price()) %>
								$
							</h2>
							<p>
								<%=sp.getProduct_name() %>
							</p>
							<a href="CartServlet?command=insert&product_id=<%=sp.getProduct_id()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"> <i
								class="fa fa-shopping-cart"></i>Add to cart
							</a>
						</div>
						<div class="product-overlay">
							<div class="overlay-content">
								<h2><%=nf.format(sp.getProduct_price()) %>
									$
								</h2>
								<p>
									<%=sp.getProduct_name() %>
								</p>
								<a href="CartServlet?command=insert&product_id=<%=sp.getProduct_id()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>
						</div>
					</div>
					<div class="choose">
						<ul class="nav nav-pills nav-justified">
							<li><a href="#" class="fa fa-plus-square"></i>Add to
									wishlist</a></li>
							<li><a
								href="product-details.jsp?product_id=<%=sp.getProduct_id() %>"><i
									class="fa fa-plus-square"></i>Details</a></li>
						</ul>
					</div>
				</div>
			</div>
			<%} %>
		</div>
		<!--features_items-->
	</div>
	

</body>
</html>
