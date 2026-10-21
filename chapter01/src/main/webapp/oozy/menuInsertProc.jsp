<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 등록 확인</title>
<link rel="stylesheet" href="css/oozy.css">
</head>
<body>

	<%  
		request.setCharacterEncoding("utf-8");
	
		String menu = request.getParameter("menu");
		String price = request.getParameter("price");
		String status = request.getParameter("status");
		String info = request.getParameter("info");
		String category = request.getParameter("category");
		String msg = "";
		if(menu==null||menu.isEmpty()){
			msg= "메뉴명을 입력하세요";
		}else if(category==null||menu.isEmpty()){
			msg= "분류를 선택하세요";
		}else if(price==null||price.isEmpty()){
			msg= "가격을 입력하세요.";
		}else if(status==null||status.isEmpty()){
			msg= "판매 상태를 선택하세요.";
		}else if(info==null||info.isEmpty()){
			msg= "설명을 입력하세요.";
		}
		if(!msg.equals("")){%>
			<script type="text/javascript">
				alert("<%= msg %>");
				history.go(-1);
			</script>
		<%}else{%>
		
	<div class="header-wrapper">
	    <%@ include file="header.jsp" %>
	    <%@ include file="nav.jsp" %>
	</div>

    <!-- div 대신 section 태그로 변경합니다 -->
	<section>
		<div class="procwrap">
			<h2>메뉴 등록 확인</h2>
			<table>
				<tr>
					<td>메뉴명</td><td><%=menu %></td>
				</tr>
				<tr>
					<td>분류</td><td><%=category %></td>
				</tr>
				<tr>
					<td>가격</td><td><%=price %>원 </td>
				</tr>
				<tr>
					<td>판매상태</td><td><%=status %></td>
				</tr>
				<tr>
					<td>설명</td><td><%=info %></td>
				</tr>		
			</table>
		</div>
	</section>

	<%}%>
	<%@ include file="footer.jsp" %>
</body>
</html>