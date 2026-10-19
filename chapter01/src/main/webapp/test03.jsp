<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		Date today = new Date();
		int year = today.getYear()+1900;
		int month = today.getMonth()+1;
		int day = today.getDate();
		int hours = today.getHours();
		int minutes = today.getMinutes();
		int seconds = today.getSeconds();
	%>
	오늘날짜 : <%=year+"년 "+month+"월 "+day+"일"%><br/>
	현재시간 : <%=hours+"시 "+minutes+"분 "+seconds+"초"%>
</body>
</html>