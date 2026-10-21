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
	
		String drvDate = request.getParameter("DRV_DATE");
		String carNo = request.getParameter("CAR_NO");
		String drvStart = request.getParameter("DRV_START");
		String drvEnd = request.getParameter("DRV_END");
		String deptCode = request.getParameter("DEPT_CODE");
		String drvMoney = request.getParameter("DRV_MONEY");
		
		String msg = "";
		
		Connection con = null;
		PreparedStatement pstmt = null;		
		// DB 접속 정보 설정		
		String driver = "com.mysql.cj.jdbc.Driver";//JDBC 드라이버
		// DB URL(스키마 이름 : jspdb)
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root"; // DB 계정 아이디
		String password = "1234";// DB 계정 비밀번호
		ResultSet rs = null;
		boolean idChk = false;

		try{
			
			// 드라이브 로딩
			Class.forName(driver);
			// DB연결
			con = DriverManager.getConnection(url, user, password);
			String chkSql = "select * from member where DRV_DATE=? CAR_NO=?";
			pstmt = con.prepareStatement(chkSql);
			pstmt.setString(1, drvDate);
			pstmt.setString(2, carNo);
			// select문은 실행할때 반드시 ResultSet 객체에 담는다.
			rs = pstmt.executeQuery();
			if(rs.next()){
				idChk = true;
			}else{			
			String sql = "insert into tbl_drive value(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, drvDate); 
			pstmt.setString(2, carNo); 
			pstmt.setString(3, drvStart); 
			pstmt.setString(4, drvEnd); 
			pstmt.setString(5, deptCode); 
			pstmt.setString(6, drvMoney); 
			
			pstmt.executeUpdate(); //insert를 성공하면 영향받은 행의 개수(1) 반환
		}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			// 자원 해제는 반드시 작성할 것
			if(pstmt != null){
				try{
					pstmt.close();
				}catch(Exception e){}
			}if(con != null){
				try{
					con.close();
				}catch(Exception e){}
			}if(rs != null){
				try{
					rs.close();
				}catch(Exception e){}
			}
		}
		
		// DB 연동 종료 ----------------------------------------------------
		
	%>
		<%  if(drvDate ==null||drvDate.isEmpty()){
			msg = "주행일자가 입력되지 않았습니다!";
		}else if(carNo ==null||carNo.isEmpty()){
			msg = "차량번호가 입력되지 않았습니다!";
		}else if(drvStart ==null||drvStart.isEmpty()){
			msg = "출발Km가 입력되지 않았습니다!";
		}else if(drvEnd ==null||drvEnd.isEmpty()){
			msg = "도착km가 입력되지 않았습니다!";
		}else if(deptCode ==null||deptCode.isEmpty()){
			msg = "부서코드가 선택되지 않았습니다!";
		}else if(drvMoney ==null||drvMoney.isEmpty()){
			msg = "주유금액이 입력되지 않았습니다!";
		}else if(idChk){
			msg = "이미 존재하는 주행내역 입니다.";
		}
		if(msg !=""){%>		
			<script type="text/javascript">
					alert("<%= msg %>");
					history.go(-1);
			</script>
		<%}else{ %>
			<script type="text/javascript">
					alert("주행내역이 정상적으로 등록 되었습니다.");
					history.go(-2);
			</script>
		<% }%>		
</body>
</html>