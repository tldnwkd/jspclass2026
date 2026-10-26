<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="db_conn.jsp"%>

<%
		request.setCharacterEncoding("utf-8");
		String custno = request.getParameter("custno");
		
		String custname = "";
		String phone = "";
		String address = "";
		String joindate = "";
		String grade = "";
		String city = "";
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select * from member_tbl_02 where custno=?";
			pstmt =con.prepareStatement(sql);
			/* custno는 DB의 데이터 타입이 int이기 때문에 파싱을 하는게 원칙이다. */
			pstmt.setInt(1,Integer.parseInt(custno));
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				custname = rs.getString("custname");
				phone = rs.getString("phone");
				address = rs.getString("address");
				joindate = rs.getString("joindate");
				grade = rs.getString("grade");
				city = rs.getString("city");
				/* custno = rs.getString("custno"); */
			}	
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e){e.printStackTrace();}
		}
		%>
<jsp:include page="header.jsp" />
<section>
	<h2>회원등록조회/수정</h2>
	<form action="modProc.jsp" method="post" name ="mform">
			<table class="form">
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="custno" value="<%=custno%>"
						readonly></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" value="<%=custname%>"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="tel" name="phone" value="<%=phone%>"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" value="<%=address%>"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" value="<%=joindate%>">예)20151202</td>
				</tr>
				<tr>
					<td>고객등급[A:VIP,B:일반,C:직원]</td>
					<td><select name="grade">
							<option value="">선택</option>
							<option value="A" <%="A".equals(grade)?"selected":"" %>>[A]VIP</option>
							<option value="B" <%="B".equals(grade)?"selected":"" %>>[B]일반</option>
							<option value="C" <%="C".equals(grade)?"selected":"" %>>[C]직원</option>
					</select></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" value="<%=city%>"></td>
				</tr>
				<td><input type="button" value="수정" onclick="checkform()">
					<input type="button" value="조회"
					onclick="location.href='index.jsp?page=memberForm'"></td>
			</table>
			</form>
			</section>
			<script type="text/javascript">
				function checkform() {
					let f = document.mform;
					if(f.custname.value ==""){
						alert("회원성명 입력안됨");
						f.custname.focus();
						return;
					}
					if(f.phone.value ==""){
						alert("회원전화 입력안됨");
						f.phone.focus();
						return;
					}
					if(f.address.value ==""){
						alert("회원주소 입력안됨");
						f.address.focus();
						return;
					}
					if(f.joindate.value ==""){
						alert("가입일자 입력안됨");
						f.joindate.focus();
						return;
					}
					if(f.grade.value ==""){
						alert("고객등급 입력안됨");
						f.grade.focus();
						return;
					}
					if(f.city.value ==""){
						alert("도시코드 입력안됨");
						f.city.focus();
						return;
					}
					
					f.submit();
				}
			</script>
			<jsp:include page="footer.jsp" />
