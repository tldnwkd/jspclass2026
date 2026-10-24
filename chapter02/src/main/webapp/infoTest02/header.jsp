<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%
		request.setCharacterEncoding("utf-8");
%>
<div>
	<header>
		<h1>쇼핑몰 회원관리 ver1.0</h1>
	</header>
	<nav>
		<ul>		
			<li><a href="index.jsp?page=joinForm">회원등록</a></li>		
			<li><a href="index.jsp?page=memberForm">회원목록조회/수정</a></li>
			<li><a href="index.jsp?page=saleForm">회원매출조회</a></li>
			<li><a href="index.jsp?page=index">홈으로</a></li>		
		</ul>
	</nav>
</div>