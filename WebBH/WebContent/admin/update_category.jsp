<%@page import="dao.ProductDAOImpl"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@page import="model.Category"%>
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>UPDATE CATEGORY</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="Preview page of Metronic Admin Theme #5 for advanced bootstrap file input examples" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN LAYOUT FIRST STYLES -->
        <link href="//fonts.googleapis.com/css?family=Oswald:400,300,700" rel="stylesheet" type="text/css" />
        <!-- END LAYOUT FIRST STYLES -->
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="../admin/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="../admin/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="../admin/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../admin/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="../admin/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
       	<link href="../admin/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="../admin/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="../admin/assets/global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="../admin/assets/global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="../admin/assets/layouts/layout5/css/layout.min.css" rel="stylesheet" type="text/css" />
        <link href="../admin/assets/layouts/layout5/css/custom.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> </head>
    <!-- END HEAD -->
<body class="page-header-fixed page-sidebar-closed-hide-logo page-md">
 	<%
		if (session.getAttribute("user") == null) {
			response.sendRedirect("/WebBH/account.jsp");
		}
	%>
        <%
            String error = "";
        String cat_id = "";
        String select = "";
        Category cat = null;
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
            if(request.getParameter("category_id")!=null){
            	cat_id = (String) request.getParameter("category_id");
            cat = CategoryDAOImpl.getListCategoryAllByid(Long.parseLong(cat_id));
            }
        %>

	<!-- BEGIN CONTAINER -->
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
			<div class="container-fluid">
            	<div class="page-content">
            		<div class="page-content-container">
                        <div class="page-content-row">
            				<div class="clearfix">

							
<div class="col-md-4"></div>
<div class="col-md-4">
	<div id="rightContent">
                    <h3>Update</h3>

                    
						<div class="portlet-body">
					<form action="/WebBH/ManagerCategoryServlet" method="post">
					<div class="form-group">
						<label class="control-label">Category name</label>
						<input type="hidden" name="cat_id" value="<%= cat.getCategory_id() %>" ><%=error%>
						<input type="text"  name="tenDanhMuc" class="form-control" value="<%= cat.getCategory_name() %>" ><%=error%>
					</div>
					<div class="form-group">
                        	<label class="control-label">Category boss name:</label>                           
                            	<select id="select2-single-input-lg" name="category_cha" class="form-control input-lg select2-multiple" dir="rtl">
                            	<% 
                            	if(cat.getCategory_cha().trim().equals("")){
                        			select = "selected";
                        			%>
                                	<option value=" "  <%= select %>>---Category---</option>
                        		
                            	<% 
                            	select = "";
                            	}
                            	%>
                            	<%for(Category c : CategoryDAOImpl.getListCategoryCha() ){
                            		if(!cat.getCategory_cha().trim().equals("")){
                            		if(Long.parseLong(cat.getCategory_cha())==c.getCategory_id()){
                            			select = "selected";
                            		}
                            		else{select ="";}
                            		}
                            	%>
                            		<option value="<%= c.getCategory_id() %>" <%= select %> ><%= c.getCategory_name() %></option>
                            		<%} %>
                            	</select>


                    <div class="margin-top-30" style="float: right;">
                                	<input type="hidden" name="command" value="update">
                                	<input type="hidden" name="category_id" value="<%=request.getParameter("category_id")%>">
                               		<button type="submit" class="btn green">Save Changes </button>
                                	<a  class="btn default" href="/WebBH/admin/manager_category.jsp">Cancel </a>
                    </div>
                    </div>
                    </form>
                       	</div>

	</div>
</div>
<div class="col-md-4"></div>
                <div class="clear"></div>
		
								
</div>
						</div>
					</div>
				</div>
			</div>
	
	</div>



<!-- BEGIN CORE PLUGINS -->
        <script src="../admin/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="../admin/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../admin/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="../admin/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="../admin/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="../admin/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="../admin/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <script src="../admin/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="../admin/assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="../admin/assets/pages/scripts/components-select2.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script src="../admin/assets/layouts/layout5/scripts/layout.min.js" type="text/javascript"></script>
        <script src="../admin/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
        <script src="../admin/assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>
        <!-- END THEME LAYOUT SCRIPTS -->
    </body>


</body>
</html>