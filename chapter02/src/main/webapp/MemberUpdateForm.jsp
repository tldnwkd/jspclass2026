<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	// DB 연동 시작 ----------------------------------------------------		
	Connection con = null;
	PreparedStatement pstmt = null;		
	ResultSet rs = null;	
	String id = request.getParameter("id");	
	String email = "";
	String tel = "";
	
	/* 넘겨온 아이디가 DB와 일치하는지 체크하는 체크키 */
	boolean idchk = false;
	String driver = "com.mysql.cj.jdbc.Driver";	
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root"; 
	String password = "1234";
	
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		
		String sql = "select id,email,tel from member where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,id);
		
		rs = pstmt.executeQuery();
		if(rs.next()){
			idchk = true;
			email = rs.getString("email");
			tel = rs.getString("tel");
		} 
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs !=null){
			try{
				rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(con !=null){
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(pstmt !=null){
			try{
				pstmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
%>
	<h3>개인 회원정보 수정</h3>
	<form action="MemberUpdateFroc.jsp" method="post">
		<input type="hidden" name ="id" value = "<%=id%>">
		<table width="400" border="1">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<!-- 넘겨받은 id는 수정대상이 아니다. -->
				<td width="250"><%=id %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">이메일</td>
				<td width="250">
					<input type="email" name="email" value="<%= email %>">
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="150">전화번호</td>
				<td width="250">
					<input type="tel" name="tel" value="<%= tel %>">
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="150">패스워드</td>
				<td width="250">
					<input type="password" name="pass2" placeholder="본인 비밀번호 입력">
				</td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="submit" value="수정하기">&nbsp;
					<input type="button" value="회원전체보기" onclick="location.href='main.jsp?page=MemberList'">&nbsp;
				</td>
			</tr>
		</table>
	</form>
</body>
</html>