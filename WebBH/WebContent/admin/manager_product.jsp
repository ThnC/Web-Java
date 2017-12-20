<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Product"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@page import="model.Category"%>
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>MANAGER PRODUCT</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="Preview page of Metronic Admin Theme #5 for managed datatable samples" name="description" />
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
        <link href="../admin/assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
        <link href="../admin/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
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
	<!-- BEGIN CONTAINER -->
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
			<div class="container-fluid">
            	<div class="page-content">
            		<div class="page-content-container">
                        <div class="page-content-row">
            				<div class="clearfix">

								
								<div class="col-md-12">
                                        <!-- BEGIN EXAMPLE TABLE PORTLET-->
                            		<div class="portlet box red">
                            			<div class="portlet-title">
                            				<div class="caption">
                            					<i class="fa fa-cogs"></i>Table </div>
                            				<div class="actions">
                           						<a href="/WebBH/admin/insert_product.jsp" class="btn btn-default btn-sm">
                            					<i class="fa fa-plus"></i> Add new product </a>	
                           					</div>
                            			</div>
                                    <div class="portlet-body">
										<table class="table table-striped table-bordered table-hover table-checkable order-column dataTable no-footer" id="sample_1" role="grid" aria-describedby="sample_1_info">
                                    		<thead>
                                    			<tr role="row">
                                    				<th tabindex="0"  aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" STT : activate to sort column ascending" style="width: 70px;">STT</th>
                                        			<th class="sorting" tabindex="0"  aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Name : activate to sort column ascending" style="width: 157px;"> Product name </th>
                                        			<th class="sorting" tabindex="0"  aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Img : activate to sort column ascending" style="width: 237px;"> Product image</th>
                                        			<th class="sorting" tabindex="0"  aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Quan : activate to sort column ascending" style="width: 114px;"> Product quantity </th>
                                        			<th class="sorting" tabindex="0"  aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Des : activate to sort column ascending" style="width: 114px;"> Product description</th>
                                        			<th class="sorting" tabindex="0"  aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Price : activate to sort column ascending" style="width: 114px;"> Product price</th>
                                        			<th class="sorting" tabindex="0"  aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Status : activate to sort column ascending" style="width: 114px;"> Status</th>
                                        		</tr>
                                  			</thead>
                                   		<tbody> 
										<%
											int count = 0;
										for(Product pro : ProductDAOImpl.getListProductAll()){
                            					count++;
                            	
										%>                                         
                                   			<tr class="gradeX odd" role="row">
                                 				<td  width="30px"> <%=count%></td>
                             	      			<td ><%=pro.getProduct_name()%> </td>
                                 	 	 		<td><img width="70" height="70" src="/WebBH/img/<%=pro.getProduct_image()%>" ></td>
                                 	 	 		<td><%=pro.getProduct_quantity()%></td>
                                 	 	 		<td><%=pro.getProduct_description()%></td>
                                 	 	 		<td><%=pro.getProduct_price()%></td>

                          	         			<td>
												<div class="btn-group">
                                               		<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
                                             			<i class="fa fa-angle-down"></i>
                                             		</button>
                        							<ul class="dropdown-menu" role="menu">
                                                		<li>	
                                                    		<a href="/WebBH/admin/update_product.jsp?product_id=<%=pro.getProduct_id()%>">
                                           	        		<i class="icon-user"></i> Update </a>
                                            	        </li>
                                            	        <li>
                                                    		<a href="/WebBH/ManagerProductServlet?command=delete&product_id=<%=pro.getProduct_id()%>">
                                           	        		<i class="icon-user"></i> Delete </a>
                                            	        </li>

                                                  	</ul>
                                                  </div>

                                   		 		</td>
                                    		</tr>  
                                    	<%
                                    	}                           				
                                    	%>               
                                    	</tbody>
                                    	</table>                                 	
                                 	</div>
             			 			</div>
                            	</div>
                                        <!-- END EXAMPLE TABLE PORTLET-->
      
							</div>


						
								
						</div>
					</div>
				</div>
			</div>
	</div>





        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="../admin/assets/global/scripts/datatable.js" type="text/javascript"></script>
        <script src="../admin/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
        <script src="../admin/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->

        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="../admin/assets/pages/scripts/table-datatables-managed.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->

        


</body>
</html>