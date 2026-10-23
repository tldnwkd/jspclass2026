<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");	
	String id = request.getParameter("id");	
%>
	<h3>회원 탈퇴</h3>
	<form action="MemberDeleteFroc.jsp" method="post">
		<input type="hidden" name ="id" value = "<%=id%>">
		<table width="400" border="1">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<!-- 넘겨받은 id는 수정대상이 아니다. -->
				<td width="250"><%=id %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">패스워드</td>
				<td width="250">
					<input type="password" name="pw" placeholder="본인 비밀번호 입력">
				</td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="submit" value="회원 삭제하기">&nbsp;
					<input type="button" value="회원전체보기" onclick="location.href='main.jsp?page=MemberList'">&nbsp;
				</td>
			</tr>
		</table>
	</form>
</body>
</html>