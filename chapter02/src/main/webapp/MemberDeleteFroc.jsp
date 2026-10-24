<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");		
		String pw = request.getParameter("pw");	
		String msg = null;
		
		// DB 연동 시작 ----------------------------------------------------		
		Connection con = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;	
		
		/* 넘겨온 아이디가 DB와 일치하는지 체크하는 체크키 */
		boolean idchk = false;
		String driver = "com.mysql.cj.jdbc.Driver";	
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root"; 
		String password = "1234";
		boolean Success = false;
		
		// 비밀번호 일치여부 판단
		if(pw == null ||pw.trim().isEmpty()){
			msg = "비밀번호를 입력하세요";
			System.out.println(pw);			
		}else{
			try{
				Class.forName(driver);
				con = DriverManager.getConnection(url, user, password);
				
				String sql = "select id, pass from member where id=? and pass=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,id);			
				pstmt.setString(2,pw);			
				rs = pstmt.executeQuery();
		        
		         
				if(rs.next()){
					pstmt.close();
					rs.close();
					
					String sql2 = "delete from member where id=?";
					pstmt = con.prepareStatement(sql2);
					pstmt.setString(1, id);
			
					int result = pstmt.executeUpdate();
					System.out.println(result);
					
					if(result >0){
						Success = true;
						msg="삭제 성공";
					}else{
						msg="삭제 실패";
					}
				}else{
					msg ="비밀번호를 확인하세요";
				}
			}catch(Exception e){
				e.printStackTrace();
				System.out.println(rs.getString(pw));
				
			}finally{
				if(rs !=null){
					try{
						rs.close();
					}catch(Exception e){
						e.printStackTrace();
					}
				}
				if(con !=null){
					try{
						con.close();
					}catch(Exception e){
						e.printStackTrace();
					}
				}
				if(pstmt !=null){
					try{
						pstmt.close();
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}
		}
	%>
	<script type="text/javascript">
        // 서버에서 처리된 메시지 띄우기
        alert("<%= msg %>");        
        <% if(Success) { %>
            // 성공 시 이동할 페이지
            location.href = "main.jsp?page=MemberList";
        <% } else { %>
            // 실패 시(비밀번호 오류, 입력 누락 등) 이동할 페이지
            history.go(-1);
        <% } %>
    </script>
</body>
</html>