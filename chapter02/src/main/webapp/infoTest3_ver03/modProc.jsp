<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="db_conn.jsp"%>

	<%
		request.setCharacterEncoding("utf-8");
		System.out.println("1: ----------------------");
		
		int custno = Integer.parseInt(request.getParameter("custno"));
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		boolean msgChk = false;
		
		System.out.println("2: ----------------------");
		
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "UPDATE member_tbl_02 SET custname=?,phone=?,address=?,joindate=?,grade=?,city=? WHERE custno =?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,custname);
			pstmt.setString(2,phone);
			pstmt.setString(3,address);
			pstmt.setString(4,joindate);
			pstmt.setString(5,grade);
			pstmt.setString(6,city);
			pstmt.setInt(7,custno);					
			
			pstmt.executeUpdate();
			
			msgChk = true;		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(con !=null) con.close();
			}catch(Exception e){e.printStackTrace();}
		}
	%>
	<script type="text/javascript">
 		<%if(msgChk){%>
			alert("회원수정 완료");
			location.href = "memberForm.jsp"
		<%}else{%>
			alert("회원수정 실패");
			history.go(-1);
		<%}%>
	</script>