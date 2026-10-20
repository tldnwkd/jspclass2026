<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 주행관리 프로그램</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
		<%
			request.setCharacterEncoding("utf-8");
			// nav.jsp의 a태그 main.jsp?page=carList
			String pageName = request.getParameter("page");
			
			// 메뉴를 클릭하지 않으면 기본화면인 home.jsp
			String contentPage = "home.jsp";
			if("carList".equals(pageName)){
				contentPage = "carList.jsp";
			}else if("driverInsert".equals(pageName)){
				contentPage = "driverInsert.jsp";
			}else if("driveList".equals(pageName)){
				contentPage = "driveList.jsp";
			}else if("depStat".equals(pageName)){
				contentPage = "depStat.jsp";
			}
		%>
	<div id ="wrap">
		<!-- header.jsp include(포함)하기 -->
		<%@ include file = "header.jsp" %>
		<!-- nav.jsp include(포함)하기 -->
		<%@ include file = "nav.jsp" %>
		
		<!-- section 부분의 HTML -->
		<section>
			<jsp:include page="<%=contentPage %>"></jsp:include>
		</section>
		
		<!-- footer 부분 -->
		<%@ include file = "footer.jsp" %>
	</div>
</body>
</html>