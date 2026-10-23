<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전체 목록보기</title>
</head>
<body>
	<h2>회원 전체 목록보기</h2>
<%
	request.setCharacterEncoding("utf-8");
	
	// DB 연동 시작 ----------------------------------------------------		
	Connection con = null;
	PreparedStatement pstmt = null;		
	ResultSet rs = null;
	// DB 접속 정보 설정		
	String driver = "com.mysql.cj.jdbc.Driver";//JDBC 드라이버
	// DB URL(스키마 이름 : jspdb)
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root"; // DB 계정 아이디
	String password = "1234";// DB 계정 비밀번호
	//회원수 세는 변수
	int count =0;
	/* DB는 네트워크의 톰캣서버를 통해 데이터가 전달되므로 개발자가 오류를 찾기 어렵다,
	따라서 try{}catch(){};문을 이용해 작성함이 원칙이다. */
%>
	<!-- 테이블 태그 -->
		<table width="700" border="1">
			<tr height="50" align="center">
				<td>번호</td>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이메일</td>
				<td>전화번호</td>
				<td>관심분야</td>
				<td>직업</td>
				<td>연령</td>
				<td>남기는말</td>
				<td>상세보기</td>
			</tr>
		
	<%try{
		// 드라이브 로딩
		Class.forName(driver);
		// DB연결
		con = DriverManager.getConnection(url, user, password);
		// 가입한 회원 모든 정보 검색 select문 이용
		String sql ="select * from member";
		pstmt = con.prepareStatement(sql);
		// resultSet 객체에 담기 => sql문의 실행 결과를 담는다.
		rs= pstmt.executeQuery();
		// rs의 데이터가 1개 이상임로 반복문이 필요
		while(rs.next()){
			count++;
	%>
		<!-- select문으로 검색한 정보가 출력되는 <tr></tr>이 필요  -->
		<tr height="50" align ="center">
			<td><%= count %></td>
			<td><%= rs.getString("id") %></td>
			<td><%= rs.getString("pass") %></td>
			<td><%= rs.getString("email") %></td>
			<td><%= rs.getString("tel") %></td>
			<td><%= rs.getString("hobby") %></td>
			<td><%= rs.getString("job") %></td>
			<td><%= rs.getString("age") %></td>
			<td><%= rs.getString("info") %></td>
			<td><a href="main.jsp?page=MemberDetail&id=<%=rs.getString("id")%>">상세보기</a></td>
		</tr>
	<%}%>
	<%	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null){
			try{
				rs.close();
			}catch(Exception e){}
			}
		if(con != null){
			try{
				con.close();
			}catch(Exception e){}
			}
		if(pstmt != null){
			try{
				pstmt.close();
			}catch(Exception e){}
			}
	}
		
	%>
		</table>
		<a href="main.jsp?page=MemberJoin">회원가입으로 가기</a>
</body>
</html>