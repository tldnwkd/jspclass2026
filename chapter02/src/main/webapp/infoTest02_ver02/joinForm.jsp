<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="db_conn.jsp"%>

<%
	int nextNo=0;
	try{
		Class.forName(driver);
		con =DriverManager.getConnection(url, user, password);
		
		//sql문을 작성하여 sql문자 변수에 담는다. sql은 혼자선 아무것도 못함
		String sql = "select ifnull(max(custno),100000)+1 as cust from member_tbl_02";
		pstmt = con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			nextNo=rs.getInt("cust");	
		}
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

<jsp:include page="header.jsp" />
<section>
	<h2>홈쇼핑 회원등록</h2>
	<form action="joinProc.jsp" method="post" name="jform">
		<table class="form">
			<tr>
				<td>회원번호(자동생성)</td>
				<td><input type ="text" name="custno" value="<%=nextNo %>" readonly></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" name="CUSTNAME"></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td><input type="tel" name="PHONE"></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" name="ADDRESS"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" name="JOINDATE">예)20151202</td>
			</tr>
			<tr>
				<td>고객등급[A:VIP,B:일반,C:직원]</td>
				<td><select name="GRADE">
						<option value="" selected="selected">선택</option>
						<option value="A">[A]VIP</option>
						<option value="B">[B]일반</option>
						<option value="C">[C]직원</option>
				</select></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" name="CITY"></td>
			</tr>
			<td>
				<input type="button" value="회원등록" onclick="checkform()"> 
				<input type="button" value="조회" onclick="location.href='index.jsp?page=memberForm'">
			</td>
		</table>
	</form>
</section>
<script type="text/javascript">
	function checkform() {
		let f = document.jform;
		if(f.CUSTNAME.value ==""){
			alert("회원성명 입력안됨");
			f.CUSTNAME.focus();
			return
		}if(f.PHONE.value ==""){
			alert("회원전화 입력안됨");
			f.PHONE.focus();
			return
		}if(f.ADDRESS.value ==""){
			alert("회원주소 입력안됨");
			f.ADDRESS.focus();
			return
		}if(f.JOINDATE.value ==""){
			alert("가입일자 입력안됨");
			f.JOINDATE.focus();
			return
		}if(f.GRADE.value ==""){
			alert("고객등급 입력안됨");
			f.GRADE.focus();
			return
		}if(f.CITY.value ==""){
			alert("도시코드 입력안됨");
			f.CITY.focus();
			return
		}
		f.submit();
	}
</script>
<jsp:include page="footer.jsp" />
