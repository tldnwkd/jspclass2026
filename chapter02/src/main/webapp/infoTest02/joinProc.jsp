<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
	<%
		request.setCharacterEncoding("utf-8");
		
		String custname = request.getParameter("CUSTNAME");
		String phone = request.getParameter("PHONE");
		String address = request.getParameter("ADDRESS");
		String joindate = request.getParameter("JOINDATE");
		String grade = request.getParameter("GRADE");
		String city = request.getParameter("CITY");
		
		String msg = "";
		
		if(custname==null || custname.trim().isEmpty()){
			msg ="회원성명을 입력하세요";
		}else if(phone==null || phone.trim().isEmpty()){
			msg ="회원전화을 입력하세요";
		}else if(address==null || address.isEmpty()){
			msg ="회원주소를 입력하세요";
		}else if(joindate==null || joindate.trim().isEmpty()){
			msg ="가입일자를 입력하세요";
		}else if(grade==null || grade.trim().isEmpty()){
			msg ="고객등급 선택하세요";
		}else if(city==null || city.trim().isEmpty()){
			msg ="도시코드를 입력하세요";
		}
		
	%>
	
		<%if(msg !=""){%>
			<script type="text/javascript">
				  alert("<%= msg %>");
				  history.go(-1);
			</script>
		  <%}else{		  
		  try {
			  Class.forName(driver);
			  con=DriverManager.getConnection(url, user, password);
			  String sql = "INSERT INTO member_tbl_02 VALUES (null,?,?,?,?,?,?)";
			  pstmt = con.prepareStatement(sql);
	 
			  pstmt.setString(1,custname);
			  pstmt.setString(2,phone);
			  pstmt.setString(3,address);
			  pstmt.setString(4,joindate);
			  pstmt.setString(5,grade);
			  pstmt.setString(6,city);
			  
			  int result =  pstmt.executeUpdate();
			  if(result>0){%>
				  <script type="text/javascript">
					alert("회원등록이 완료되었습니다.");
					location.href='index.jsp?page=joinForm';
				  </script>
			 <% }else{%>
			 	<script type="text/javascript">
					alert("회원등록 실패.");
					history.go(-1);
				  </script>
			 <%} %>			 	 
		 <% }catch (Exception e) {
		    e.printStackTrace();
		  } finally {
		    try {
		      if (rs != null) rs.close();
		      if (pstmt != null) pstmt.close();
		      if (con != null) con.close();
		    } catch (Exception e) { e.printStackTrace(); }
		  }	  
		  %>
			  	
		  <%}%>		
</body>
</html>