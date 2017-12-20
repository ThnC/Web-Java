			
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>CATEGORY</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->
<body>
	<div class="col-sm-3">
		<div class="left-sidebar">
			<h2>Category</h2>
			<div class="panel-group category-products" id="accordian">
				<%
					for (Category category_cha : CategoryDAOImpl.getListCategoryCha()) {
				%>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordian" href="#<%=category_cha.getCategory_name()%>" class="collapsed">
								<span class="badge pull-right"><i class="fa fa-plus"></i></span>
							 	<%=category_cha.getCategory_name()%>	
							</a>
						</h4>
					</div>
					
				<div id="<%=category_cha.getCategory_name()%>" class="panel-collapse collapse" style="height: 0px;">
					<div class="panel-body">
						<ul>
							<%
								for (Category category_con : CategoryDAOImpl.getListCategoryCon(category_cha.getCategory_id())) {
							%>
							<li><a href="index.jsp?category_id=<%=category_con.getCategory_id()%>"><%=category_con.getCategory_name()%>
							</a></li>
							<%
								}
							%>

						</ul>
					</div>
					</div>
				</div>
				<%
					}
				%>


			</div>
			<!--/category-products-->


		</div>
	</div>
	
	
	
	
	
	
	
	
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>