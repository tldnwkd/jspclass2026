<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
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
		
		String msg = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;		
		// DB 접속 정보 설정		
		String driver = "com.mysql.cj.jdbc.Driver";//JDBC 드라이버
		// DB URL(스키마 이름 : jspdb)
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root"; // DB 계정 아이디
		String password = "1234";// DB 계정 비밀번호
		ResultSet rs = null;
		
		try{		
			// 드라이브 로딩
			Class.forName(driver);
			// DB연결
			con = DriverManager.getConnection(url, user, password);
		
			String sql = "insert into tbl_drive value(?,?,?,?,?,?)";
			//pstmt 객체에 입력받은 값을 저장하여 sql의 insert문이 실행되도록한다.
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, drvDate); 
			pstmt.setString(2, carNo); 
			pstmt.setInt(3,Integer.parseInt(drvStart));
			pstmt.setInt(4,Integer.parseInt(drvEnd)); 
			pstmt.setString(5, deptCode); 
			pstmt.setInt(6,Integer.parseInt(drvMoney)); 
			
			pstmt.executeUpdate(); //insert를 성공하면 영향받은 행의 개수(1) 반환
		%>
			<script type="text/javascript">
					alert("주행내역이 정상적으로 등록 되었습니다.");
					location.href = "index.jsp";
			</script>	
		<%
		}catch(Exception e){
			e.printStackTrace();
			%>
			<script type="text/javascript">
					alert("등록 실패");
					history.go(-1);
			</script>	
			<%
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
</body>
</html>