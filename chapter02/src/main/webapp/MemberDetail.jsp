<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
</head>
<body>
	<h2>회원 상세 정보</h2>
	
	<%
		request.setCharacterEncoding("utf-8");
		
		// DB 연동 시작 ----------------------------------------------------	
		//드라이버 연결
		Connection con = null;
		//PreparedStatement클래스 인스턴스 초기값 null로 설정
		PreparedStatement pstmt = null;		
		// DB 접속 정보 설정		
		String driver = "com.mysql.cj.jdbc.Driver";//JDBC 드라이버
		// DB URL(스키마 이름 : jspdb)
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root"; // DB 계정 아이디
		String password = "1234";// DB 계정 비밀번호
		ResultSet rs = null;
		String getid = request.getParameter("id");
		//회원수 세는 변수
		/* DB는 네트워크의 톰캣서버를 통해 데이터가 전달되므로 개발자가 오류를 찾기 어렵다,
		따라서 try{}catch(){};문을 이용해 작성함이 원칙이다. */
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			// 가입한 회원 모든 정보 검색 select문 이용
			String sql ="select * from member where id =?";
			pstmt = con.prepareStatement(sql);
			// resultSet 객체에 담기 => sql문의 실행 결과를 담는다.
			pstmt.setString(1, getid);
			rs= pstmt.executeQuery();
			if(rs.next()){%>
				<table border="1">
				<tr>
					<td>아이디 : <%= getid%></td>
				</tr>
				<tr>
					<td>이메일 : <%= rs.getString("email")%></td>
				</tr>
				<tr>
					<td>전화번호 : <%= rs.getString("tel") %></td>
				</tr>
				<tr>
					<td>관심분야 : <%= rs.getString("hobby") %></td>
				</tr>
				<tr>
					<td>직업 : <%= rs.getString("job")%></td>
				</tr>
				<tr>
					<td>연령 : <%=rs.getString("age")%></td>
				</tr>
				<tr>
					<td>남기는 말 : <%= rs.getString("info")%></td>
				</tr>
				<tr>
					<td><a href="MemberList.jsp">회원 목록으로 이동</a></td>
				</tr>
			</table> 
		<%}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs !=null){
				try{
					rs.close();
				}catch(Exception e){}
			}if(con !=null){
				try{
					con.close();
				}catch(Exception e){}
			}if(pstmt !=null){
				try{
					pstmt.close();
				}catch(Exception e){}
			}
		}
	%>
	
	


</body>
</html>