<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전체 목록보기</title>
</head>
<body>
	<div id="listwrap">
		<h2 align="center">회원 전체 목록보기</h2>
		<table class="listtable">
			<tr height="40">
				<td align="center" width="200">아이디</td>
				<td align="center" width="200">이메일</td>
				<td align="center" width="150">전화번호</td>
				<td align="center" width="150">취미</td>
				<td align="center" width="150">직업</td>
				<td align="center" width="100">나이</td>
			</tr>
			<c:forEach var="mdto" items="${alist }">
				<tr height="40">
					<td align="center" width="200">${mdto.id }</td>
					<td align="center" width="200"><a>${mdto.email }</a></td>
					<td align="center" width="150">${mdto.tel }</td>
					<td align="center" width="150">${mdto.hobby }</td>
					<td align="center" width="150">${mdto.job }</td>
					<td align="center" width="100">${mdto.age }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>