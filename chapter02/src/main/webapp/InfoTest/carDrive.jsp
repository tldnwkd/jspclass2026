<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ include file="db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>차량별주행조회</h2>
	<%try{
			//드라이버 로드
			Class.forName(driver);
		    con = DriverManager.getConnection(url, user, password);
		       
		    String sql = "select CAR_NO, CAR_MODEL from tbl_car";
		    pstmt = con.prepareStatement(sql);		    
		    rs = pstmt.executeQuery();
	%>
		<form>
		<table border="1" class="tbl_style">
			<tr>
				<td>
					<select name="CAR_NO">
					<%
					while(rs.next()){%>
						<option value="<%=rs.getString("CAR_NO")%>">[<%=rs.getString("CAR_NO")%>]<%=rs.getString("CAR_MODEL")%></option>
					<%}%>
 					</select>
					<input type="submit" value="조회">
				</td>			
			</tr>
		</form>
	        <tr>
	            <th>주행일자</th>
	            <th>출발Km</th>
	            <th>도착Km</th>
	            <th>운행거리</th>
	            <th>부서명</th>
	            <th>주유금액</th>
	        </tr>	     	    		
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