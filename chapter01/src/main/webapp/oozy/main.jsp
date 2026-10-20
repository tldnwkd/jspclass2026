<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/oozy.css">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String pageName = request.getParameter("page");
		String contentPage = "home.jsp";
		
		if("menuList".equals(pageName)){
			contentPage = "menuList.jsp";
		}else if("menuInsert".equals(pageName)){
			contentPage = "menuInsert.jsp";
		}		
	%>
	<div class="header-wrapper">
	    <%@ include file="header.jsp" %>
	    <%@ include file="nav.jsp" %>
	</div>
	<section>
		<jsp:include page="<%=contentPage %>"></jsp:include>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>