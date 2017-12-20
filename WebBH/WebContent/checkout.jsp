<%@page import="java.util.Map"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Product"%>
<%@page import="java.util.TreeMap"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CHECKOUT</title>
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
		if (session.getAttribute("user") == null) {
			response.sendRedirect("/WebBH/account.jsp");
		} else {
			Cart cart = (Cart) session.getAttribute("cart");
			if (cart == null) {
				cart = new Cart();
				session.setAttribute("cart", cart);
			}
			TreeMap<Product, Integer> list = cart.getList();
			NumberFormat nf = NumberFormat.getInstance();
			nf.setMinimumIntegerDigits(0);
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<section id="cart_items">
		<div class="container">

			<div class="review-payment">
				<h2>Review & Payment</h2>
		</div>

			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<%
							for (Map.Entry<Product, Integer> ds : list.entrySet()) {
						%>
						<tr>
							<td class="cart_product">
								<a href="">
									<img src="images/cart/two.png" alt="">
								</a>
							</td>
							<td class="cart_description">
								<h4>
									<a href=""><%=ds.getKey().getProduct_name()%></a>
								</h4>
								<p>
									Product ID:
									<%=ds.getKey().getProduct_id()%></p>
							</td>
							<td class="cart_price">
								<p>
									&<%=nf.format(ds.getKey().getProduct_price())%>
								</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button"><a
										class="cart_quantity_up"
										href="CartServlet?command=plus&product_id=<%=ds.getKey().getProduct_id()%>&cartID=<%=System.currentTimeMillis()%>"
									> + </a> <input class="cart_quantity_input" type="text"
										value="<%=ds.getValue()%>" autocomplete="off" size="2"
										disabled=""
									> <a class="cart_quantity_down"
										href="CartServlet?command=sub&product_id=<%=ds.getKey().getProduct_id()%>&cartID=<%=System.currentTimeMillis()%>"
									> - </a></div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price"><%=nf.format(ds.getValue() * ds.getKey().getProduct_price())%></p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete"
									href="CartServlet?command=remove&product_id=<%=ds.getKey().getProduct_id()%>&cartID=<%=System.currentTimeMillis()%>"
								>
									<i class="fa fa-times"></i>
								</a>
							</td>
						</tr>
						<%
							}
						%>

						<tr>
							<td colspan="4">&nbsp;</td>
							<td colspan="2">
									<%
										for (Map.Entry<Product, Integer> ds : list.entrySet()) {
									%>
								<table class="table table-condensed total-result">

									<tr class="shipping-cost">
										<td>Shipping Cost</td>
										<td>Free</td>
									</tr>
									<tr>
										<td>Total</td>
										<td>
											<span><%=nf.format(ds.getValue() * ds.getKey().getProduct_price())%></span>
										</td>
									</tr>
								</table>
									<%
										}
									%>
							</td>

						</tr>
					</tbody>
				</table>
		</div>


			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-3">
						<div class="shopper-info">
							<p>Shopper Information</p>
							<form action="PaymentServlet" method="post">
								<p>Delivery address:</p>
								<textarea name="address" placeholder="Your address" rows="5"></textarea>
								<p>Payment methods:</p>
								<select name="payment">
									<option value="Payment upon delivery">Payment upon
										delivery</option>
									<option value="Bank transfer">Bank transfer</option>
								</select>
								<input type="hidden"
									value="<%=session.getAttribute("user") %>"
								>
								<input type="submit" value="Confirm" class="btn btn-primary">
							</form>
					</div>
				</div>

			</div>
		</div>



		</div>
	</section>
	<!--/#cart_items-->

	<jsp:include page="footer.jsp"></jsp:include>

	<%
		}
	%>
</body>
</html>