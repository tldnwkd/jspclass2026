<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionName</title>
</head>
<body>
	<h2>세션 네임 페이지</h2>
	<%
		/* String sessName = request.getParameter("name"); */
		String getName = (String)session.getAttribute("seName");
	%>
	<%= getName %> 님 반갑습니다.
	<a href="SessionName02.jsp">세션 다른 페이지</a>
</body>
</html>