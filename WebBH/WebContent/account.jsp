<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ACCOUNT</title>
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
<body>
	<%
		String userName_err = "", userEmail_err = "", userPass_err = "";
	
		if (request.getAttribute("userName_err") != null) {
			userName_err = (String) request.getAttribute("userName_err");
		}
		if (request.getAttribute("userEmail_err") != null) {
			userEmail_err = (String) request.getAttribute("userEmail_err");
		}
		if (request.getAttribute("userPass_err") != null) {
			userPass_err = (String) request.getAttribute("userPass_err");
		}
		String userName = "", userEmail = "", userPass = "";
		
		if (request.getAttribute("userName") != null) {
			userName = (String) request.getAttribute("userName");
		}
		if (request.getAttribute("userEmail") != null) {
			userEmail = (String) request.getAttribute("userEmail");
		}
		if (request.getAttribute("userPass") != null) {
			userPass = (String) request.getAttribute("userPass");
		}
		String err="";
		if (request.getAttribute("err") != null) {
			err = (String) request.getAttribute("err");
		}
	%>





	<jsp:include page="header.jsp"></jsp:include>

	<section id="form">
		<!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Login to your account</h2>
						<form action="LoginServlet" method="post">
							<p style="color: red"><%=err%></p>
							<input type="text" placeholder="Email" name="userEmail" />
							<p style="color: red"><%=err%></p>
							<input type="password" placeholder="Password" name="userPass" />
							<span>
								<input type="checkbox" class="checkbox">
								Keep me signed in
							</span>
							<button type="submit" class="btn btn-default">Login</button>
						</form>
					</div>
					<!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form">
						<!--sign up form-->
						<h2>New User Signup!</h2>
						<form action="RegisterServlet" method="post">
							<p style="color: red"><%=userName_err%></p>
							<input type="text" placeholder="Name" name="userName"
								value="<%=userName%>" />
							<p style="color: red"><%=userEmail_err%></p>
							<input type="email" placeholder="Email Address" name="userEmail"
								value="<%=userEmail%>" />
							<p style="color: red"><%=userPass_err%></p>
							<input type="password" placeholder="Password" name="userPass"
								value="<%=userPass%>" />
							<button type="submit" class="btn btn-default">Signup</button>
						</form>
					</div>
					<!--/sign up form-->
				</div>
			</div>
		</div>
	</section>
	<!--/form RegisterServlet-->


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>