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
        <title>UPDATE PRODUCT</title>
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
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
            String product_id = "";
            Product p = null;
            if(request.getParameter("product_id")!=null){
            	product_id = request.getParameter("product_id");
                ProductDAOImpl pd = new ProductDAOImpl();
            	p = pd.getProduct_detail(product_id);
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
                    <h3>Add product</h3>

                    
						<div class="portlet-body">
                        	<form role="form" action="/WebBH/ManagerProductServlet" method="post" enctype="multipart/form-data">
                            	<div class="form-group">
                               		<label class="control-label">Product name</label>
                                    <input type="text" value="<%= p.getProduct_name() %>" placeholder="A Can of Tuna" class="form-control" name="product_name"><%=error%>
                                </div>
                               	
                                <div class="form-group mt-repeater">
                                	<div data-repeater-list="group-c">
                                    	<div data-repeater-item="" class="mt-repeater-item">
                                        	<div class="row">		
                                            	<div class="col-md-4">
                                                	<div class="fileinput fileinput-new" data-provides="fileinput">
                    									<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                        									<img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt=""> 
                        								</div>
                       									<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 10px;">
                       									</div>
	                        							<div>
                            								<span class="btn default btn-file">
                                							<span class="fileinput-new"> Select image </span>
                                							<span class="fileinput-exists"> Change </span>
                            								<input type="hidden" >
                            								<input type="file"  value=""> </span>
                               						 		<a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput" style=""> Remove </a>
                            							</div>
                    								</div>	
                                                </div>
                                        	</div>
                                  		</div>
                               		</div>

                              	</div>
                              	<div class="form-group">
                              		
                                		<label for="select2-single-input-lg" class="control-label">Category</label>
                                    	<select id="select2-single-input-lg" name="category_id" class="form-control input-lg select2-multiple" dir="rtl">
                                    	<% for(Category c : CategoryDAOImpl.getListCategoryCha()){ %>
                                	<optgroup label="<%=c.getCategory_name() %>" >
                                	<%for(Category cc : CategoryDAOImpl.getListCategoryCon(c.getCategory_id())){ 
                                		if(cc.getCategory_id()==Long.parseLong(p.getCategory_id())){
                                	%>
                                		<option value="<%=cc.getCategory_id()%>" selected><%= cc.getCategory_name() %></option>
                                		<%}else{ %>
                                		<option value="<%=cc.getCategory_id()%>"><%= cc.getCategory_name() %></option>
                                		<%} %>
                                		<%} %>
                                    </optgroup>                
	                                <%} %>                         
                                  		</select>
                               	
                                </div>
                              	
                              	<div class="form-group">
                                    	<label class="control-label" >Qty</label>
                                        <input type="text" value="<%= p.getProduct_quantity() %>"  class="form-control" style="width: 100dx;" name="product_quantity"><%=error%>
                                </div>
                                                
                              	<div class="form-group">
                                	<label class="control-label">Product Description</label>
                                    	<textarea class="form-control" row="3"  value="<%= p.getProduct_description() %>"  name="product_description"><%=error%></textarea>
                                </div>
                                <div class="form-group">
                                	<label class="control-label">Price</label>
                                	<input type="text"  value="<%= p.getProduct_price() %>" class="form-control" name="pro_price"><%=error%>
                                </div>
                                <div class="margin-top-10" style="float: right;">
                                	<input type="hidden" name="command" value="update">
                                	<input type="hidden" name="product_id" value="<%= product_id %>">
                               		<button type="submit" class="btn green">Save Changes </button>
                                	<a  class="btn default" href="/WebBH/admin/manager_product.jsp">Cancel </a>
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