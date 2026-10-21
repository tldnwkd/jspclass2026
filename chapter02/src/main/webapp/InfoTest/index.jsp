<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		//header.jsp파일의 nav 부분의 a태그의 페이지 클릭 page 값 url에 담아 떠넘긴 값 받아오기
		String indexPage = request.getParameter("page");
		
		// section부분 home.jsp페이지로 기본설정
		String contentPage = "home.jsp";
		// page값 달라질때마다 section 페이지 값 변경되는 조건문
		if("carList".equals(indexPage)){
			contentPage = "carList.jsp";
		}else if("driveForm".equals(indexPage)){
			contentPage = "driveForm.jsp";
		}else if("driveList".equals(indexPage)){
			contentPage = "driveList.jsp";
		}else if("deptStat".equals(indexPage)){
			contentPage = "deptStat.jsp";
		}
	%>
	<div id ="wrap">
		<%@ include file="header.jsp" %>
		<%@ include file="nav.jsp" %>
		<section>
			<jsp:include page="<%= contentPage %>"></jsp:include>
		</section>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>