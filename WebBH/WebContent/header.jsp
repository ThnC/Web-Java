
<%@page import="model.Users"%>
<%@page import="model.Cart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<!--/head-->
<body>
<%
	Cart cart = (Cart) session.getAttribute("cart");
Users user = null;
	if (cart == null) {
		cart = new Cart();
		session.setAttribute("cart", cart);
	}
	if(session.getAttribute("user")!=null){
		user = (Users) session.getAttribute("user");
	}
%>

	<header id="header"><!--header-->


	<div class="header-middle">
		<!--header-middle-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="logo pull-left">
						<a href="index.jsp"><img src="img/logo1.jpg" alt="" /></a>
					</div>
				</div>
				<div class="col-sm-8" style="margin-top: 20px;">
					<div class="shop-menu pull-right">
						<ul class="nav navbar-nav">
													<% if(session.getAttribute("user")==null){ %>
							<li  ><a href="account.jsp">  Login, please!!</a></li>
							<%}else{ %>
							<li  ><a href="/WebBH/admin/index.jsp">  Admin</a></li>
							<%} %>
							<li><a href="account.jsp"><i class="fa fa-user"></i>
							<%
								if(user!=null){
									out.print(user.getUserEmail());
								}
							%>
							</a></li>
                            <li><a href="#"><i class="fa fa-star"></i> Wishlist</a></li>
							<li><a href="checkout.jsp"><i class="fa fa-crosshairs"></i>Checkout</a></li>
							<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i>Cart
							<span>(<%=cart.CountProduct() %>)</span>
							
							</a></li>
							<li><a href="LoginServlet?command=logout"><i class="fa fa-lock"></i> 
<%
if( session.getAttribute("user") == null){
	out.print("Login");

}else{
	
	out.print("Logout");  
}
%>

							</a></li>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-middle-->

	<div class="header-bottom">
		<!--header-bottom-->
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="mainmenu pull-left">
						<ul class="nav navbar-nav collapse navbar-collapse">
							<li><a href="index.jsp" class="active">Home</a></li>
							<li class="dropdown"><a href="#">Shop<i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="product.jsp">Products</a></li>
									<li><a href="product-details.jsp">Product Details</a></li>
									<li><a href="checkout.jsp">Checkout</a></li>
									<li><a href="cart.jsp">Cart</a></li>
									<li><a href="account.jsp">Login</a></li>
								</ul></li>
							<li><a href="contact-us.jsp">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-3">
				</div>
			</div>
		</div>
	</div>
	<!--/header-bottom--> </header>
	<!--/header-->

</body>
</html>