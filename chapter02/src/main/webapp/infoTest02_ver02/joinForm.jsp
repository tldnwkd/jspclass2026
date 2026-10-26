<%@page import="javax.swing.text.html.parser.Parser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int nextNo= 0;
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		request.setCharacterEncoding("utf-8");
		String custno = request.getParameter("custno");	
	
		try{
		    con = Util.getConnection();
		    String sql = "SELECT custno FROM member_tbl_02 order by custno desc LIMIT 1;";
		    pstmt = con.prepareStatement(sql);
		    rs=pstmt.executeQuery(sql);
		    
		    if(rs.next()){		      
		    %>
		    	<form action="joinProc.jsp" method="post" name="jform">
		    		<h2>홈쇼핑 회원등록</h2>
		    		<table>
		    			<tr>
		    				<td>회원번호</td><td><%=rs.getInt("custno")+1%></td>
		    			</tr>
		    			<tr>
		    				<td>회원성명</td>
		    				<td>
		    					<input type="text" name="CUSTNAME">
		    				</td>
		    			</tr>
		    			<tr>
		    				<td>회원전화</td>
		    				<td>
		    					<input type="tel" name="PHONE">
		    				</td>
		    			</tr>
		    			<tr>
		    				<td>회원주소</td>
							<td>
		    					<input type="text" name="ADDRESS">
		    				</td>
		    			</tr>
		    			<tr>
		    				<td>가입일자</td>
		    				<td>
		    					<input type="text" name="JOINDATE">예)20151202
		    				</td>
		    			</tr>
		    			<tr>
		    				<td>고객등급[A:VIP,B:일반,C:직원]</td>
		    				<td>
								<select name = "GRADE">
									<option value="" selected="selected">선택</option>
									<option value="A">[A]VIP</option>
									<option value="B">[B]일반</option>
									<option value="C">[C]직원</option>
								</select>
							</td>
		    			</tr>
		    			<tr>
		    				<td>도시코드</td>
		    				<td>
		    					<input type="number" name="CITY">
		    				</td>
		    			</tr>
		    			<td>			
						    <input type="submit" value="회원등록">
						    <input type="button" value="조회" onclick="location.href='index.jsp?page=memberForm'">	
					    </td>
		    		</table>
		    	</form>
		    <% }%>
		    <%
		  }catch (Exception e) {
		    	e.printStackTrace();
		  }finally {
			    try{
			      if (rs != null) rs.close();
			      if (pstmt != null) pstmt.close();
			      if (con != null) con.close();
			    }catch (Exception e) { e.printStackTrace(); }
		  }
	%>
</body>
</html>