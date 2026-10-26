<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ include file="db_conn.jsp" %>

	<%
		request.setCharacterEncoding("utf-8");
		boolean msgChk = false;
		
		try{
			Class.forName(driver);
			con =DriverManager.getConnection(url, user, password);
			
			//sql문을 작성하여 sql문자 변수에 담는다. sql은 혼자선 아무것도 못함
			String sql = "INSERT INTO member_tbl_02 VALUES (null,?,?,?,?,?,?)";
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setString(1,request.getParameter("CUSTNAME"));
			 pstmt.setString(2,request.getParameter("PHONE"));
			 pstmt.setString(3,request.getParameter("ADDRESS"));
			 pstmt.setString(4,request.getParameter("JOINDATE"));
			 pstmt.setString(5,request.getParameter("GRADE"));
			 pstmt.setString(6,request.getParameter("CITY"));
			 
			 msgChk = pstmt.executeUpdate() > 0;			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(con!=null) con.close();
				if(pstmt!=null) pstmt.close();
			}catch(Exception e){e.printStackTrace();};
		}
	%>	
 	<script type="text/javascript">
 		<%if(msgChk){%>
			alert("회원등록이 완료됨");
			location.href = "memberForm.jsp"
		<%}else{%>
			alert("회원등록이 실패");
			history.go(-1);
		<%}%>
	</script>