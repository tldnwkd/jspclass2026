<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>carList</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String driver = "com.mysql.cj.jdbc.Driver";//JDBC 드라이버
		// DB URL(스키마 이름 : jspdb)
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root"; // DB 계정 아이디
		String password = "1234";// DB 계정 비밀번호
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sf02 = new SimpleDateFormat("yyyy년MM월dd일");
		
		try{
			//드라이버 로드
			Class.forName(driver);
			// DB연결
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select * from tbl_car";
			pstmt = con.prepareStatement(sql);
			rs= pstmt.executeQuery();
	%>
			<h2>차량조회</h2>
	        <table border="1" class="tbl_style">
	           <tr>
	              <th>차량번호</th>
	              <th>모델</th>
	              <th>제조사</th>
	              <th>구매일</th>
	           </tr>
	<%			
			while(rs.next()){%>
					<tr>
	                    <td><%= rs.getString("CAR_NO") %></td>	              
	                    <td><%= rs.getString("CAR_MODEL") %></td>	                
	                    <td><%= rs.getString("CAR_COMPANY") %></td>
	                    <!-- 
	                    	format()은 Date형식이고, DB는 char(String)이기 때문에
	                    	parse() : String -> Date => "20230101" => Date객체
	                    	format() : Date -> String => Date객체 => "2023년01월01일"
	                     -->              
	                    <td><%= sf02.format(sf.parse(rs.getString("CAR_DATE"))) %></td>
                	</tr>
			<%}%>
		
		<%}catch(Exception e){
			e.getStackTrace();
			//오류 떴을때 체크용 프린트문
			out.println("DB fail");
		}finally{
			if(con != null){
				try{
					con.close();
				}catch(Exception e){}
			}if(pstmt != null){
				try{
					pstmt.close();
				}catch(Exception e){}
			}if(rs != null){
				try{
					rs.close();
				}catch(Exception e){}
			}
		}%>
		</table>	
</body>
</html>
