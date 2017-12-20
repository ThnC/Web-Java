<%@page import="model.BillDetails"%>
<%@page import="dao.BillDetailsDAOImpl"%>
<%@page import="model.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsersDAOImpl"%>
<%@page import="dao.BillDAOImpl"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@page import="model.Category"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>ORDER DETAILS</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="Preview page of Metronic Admin Theme #5 for managed datatable samples" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN LAYOUT FIRST STYLES -->
        <link href="//fonts.googleapis.com/css?family=Oswald:400,300,700" rel="stylesheet" type="text/css" />
        <!-- END LAYOUT FIRST STYLES -->
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/admin/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/admin/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/admin/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/admin/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="<%=request.getContextPath()%>/admin/assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/admin/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="<%=request.getContextPath()%>/admin/assets/global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="<%=request.getContextPath()%>/admin/assets/global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="<%=request.getContextPath()%>/admin/assets/layouts/layout5/css/layout.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/admin/assets/layouts/layout5/css/custom.min.css" rel="stylesheet" type="text/css" />
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
           BillDetailsDAOImpl bildetlDAO = new BillDetailsDAOImpl();
           ArrayList<BillDetails> listBill = bildetlDAO.getListBilldetails();
           UsersDAOImpl usersDAO = new UsersDAOImpl();
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

								<div class="col-md-12">
                                        <!-- BEGIN EXAMPLE TABLE PORTLET-->
                            		<div class="portlet box red">
                            			<div class="portlet-title">
                            				<div class="caption">
                            					<i class="fa fa-cogs"></i>Order details</div>
                            			</div>
                                    <div class="portlet-body">
										<table class="table table-striped table-bordered table-hover table-checkable order-column dataTable no-footer" id="sample_1" role="grid" aria-describedby="sample_1_info">
                                    		<thead>
                                    			<tr role="row">
                                    				<th tabindex="0"  aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" STT : activate to sort column ascending" style="width: 70px;">STT</th>
                                        			<th class="sorting" tabindex="0"  aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Bill_ID : activate to sort column ascending" style="width: 157px;"> Bill Details ID </th>
                                        			<th class="sorting" tabindex="0"  aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" User ID : activate to sort column ascending" style="width: 237px;"> Bill ID </th>
                                        			<th class="sorting" tabindex="0"  aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Address : activate to sort column ascending" style="width: 114px;"> Product ID </th>
                                        			<th class="sorting" tabindex="0"  aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Payment : activate to sort column ascending" style="width: 114px;"> Product Quantity </th>
                                        			<th class="sorting" tabindex="0"  aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Date buy : activate to sort column ascending" style="width: 114px;"> Product Price </th>

                                        			                                        			
                                        		</tr>
                                  			</thead>
                                   		<tbody> 
										<%
											int count = 0;
                            				for(BillDetails bill : listBill) {
                            					count++;
                            	
										%>                                         
                                   			<tr class="gradeX odd" role="row">
                                 				<td  width="30px"> <%=count%></td>
                             	      			<td ><%=bill.getBill_details_id()%> </td>
                                 	 	 		<td> <%=bill.getBill_id()%></td>
                                 	 	 		<td> <%=bill.getProduct_id()%></td>
                                 	 	 		<td> <%=bill.getProduct_quantity()%></td>
                                 	 	 		<td> <%=bill.getProduct_price()%></td>
                                    		</tr>  
                                    	<%
                                    	}                           				
                                    	%>               
                                    	</tbody>
                                    	</table>                                 	
                                 	</div>
             			 			</div>
                            	</div>


                            	</div>
                            	
                            	                                      
							</div>


						
								
						</div>
					</div>
				</div>
			</div>
	</div>





        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="<%=request.getContextPath()%>/admin/assets/global/scripts/datatable.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/admin/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/admin/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->

        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="<%=request.getContextPath()%>/admin/assets/pages/scripts/table-datatables-managed.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->



</body>
</html>