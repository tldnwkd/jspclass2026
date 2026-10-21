<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String driver = "com.mysql.cj.jdbc.Driver";//JDBC 드라이버
		// DB URL(스키마 이름 : jspdb)
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root"; // DB 계정 아이디
		String password = "1234";// DB 계정 비밀번호
		ResultSet rs = null;
		
		String carNo = request.getParameter("CAR_NO");
        String carModel = request.getParameter("CAR_MODEL");
        String carCompany = request.getParameter("CAR_COMPANY");
        String carDate = request.getParameter("CAR_DATE");
		
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select * from tbl_car";
			pstmt = con.prepareStatement(sql);
			rs= pstmt.executeQuery();
	%>
			<h2>차량조회</h2>
	        <table border="1">
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
	                    <td><%= rs.getString("CAR_DATE") %></td>
                	</tr>
			<%}%>
		</table>
		<%}catch(Exception e){
			e.getStackTrace();
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
		}	
	%>
	
</body>
</html>
