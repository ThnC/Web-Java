

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ADMIN</title>

<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />

</head>
<body>
	<%
		if (session.getAttribute("user") == null) {
			response.sendRedirect("/WebBH/account.jsp");
		}
	%>
<%
	Users user = null;
	if(session.getAttribute("user")!=null){
		user = (Users) session.getAttribute("user");
		if(user.getUserEmail().equals("admin@gmail.com")){
		response.sendRedirect("/WebBH/admin/manager_category.jsp");
		}
		else{
			response.sendRedirect("/WebBH/index.jsp");
			
		}
	} 
%>

	<jsp:include page="header.jsp"></jsp:include>



	<jsp:include page="footer.jsp"></jsp:include></div>

</body>
</html>
