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

	%>
	
	<h2>주행내역 등록</h2>
	<form name ="driveFrm" action="driveProc02.jsp" method="post">
		<table>
			<tr>
				<td>
					<label for="drvDate">주행일자 : </label><input type="text" name="DRV_DATE" id="drvDate" placeholder="예)20230101">
				</td>
			</tr>
			<tr>
				<td>
					<label for="carNo">차량번호 : </label><input type="text" name="CAR_NO" id="carNo" placeholder="예)10가0001">
				</td>
			</tr>
			<tr>
				<td>
					<label for="drvStart">출발Km : </label><input type="text" name="DRV_START" id="drvStart" placeholder="숫자만 입력하시오">
				</td>
			</tr>
			<tr>
				<td>
					<label for="drvEnd">도착km : </label><input type="text" name="DRV_END" id="drvEnd" placeholder="숫자만 입력하시오">
				</td>
			</tr>
			<tr>
				<td>
					<select name="DEPT_CODE">
 						<option value="" selected="selected">부서</option>
 						<option value="10">[10]영업부</option>
 						<option value="20">[20]총무부</option>
 						<option value="30">[30]구매부</option>
 						<option value="40">[40]개발부</option>
 					</select>
				</td>
			</tr>
			<tr>
				<td>
					<label for="drvMoney">주유금액 : </label><input type="text" name="DRV_MONEY" id="drvMoney" placeholder="숫자만 입력하시오">
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="주행내역등록" onclick="chkform()">
					<input type="button" value="다시쓰기" onclick="resetform()">
				</td>
			</tr>		
		</table>
	</form>
	
	<!-- 자바스크립트를 이용해서 유효성 검사 하기  -->
	<script type="text/javascript">
		
	    function chkform() {
			
			let f = document.driveFrm;
			if(f.DRV_DATE.value ==""){
				alert("주행입력 안됨");
				/* 주행 입력에 포커스(커서이동)하는 방법 */
				f.DRV_DATE.focus();
				return;
			}
			
			if(f.CAR_NO.value ==""){
				alert("주행입력 안됨");
				/* 주행 입력에 포커스(커서이동)하는 방법 */
				f.CAR_NO.focus();
				return;
			}
			
			if(f.DRV_START.value ==""){
				alert("주행입력 안됨");
				/* 주행 입력에 포커스(커서이동)하는 방법 */
				f.DRV_START.focus();
				return;
			}
			
	        if(f.DRV_END.value ==""){
				alert("주행입력 안됨");
				/* 주행 입력에 포커스(커서이동)하는 방법 */
				f.DRV_END.focus();
				return;
	        }	
	        
			if(f.DEPT_CODE.value ==""){
				alert("주행입력 안됨");
				/* 주행 입력에 포커스(커서이동)하는 방법 */
				f.DEPT_CODE.focus();
				return;
			}
			
			if(f.DRV_MONEY.value ==""){
				alert("주행입력 안됨");
				/* 주행 입력에 포커스(커서이동)하는 방법 */
				f.DRV_MONEY.focus();
				return;
			}
			/* 아직 submit이 안돼서 submit 진행 */
			f.submit();
		}
		
		function resetform() {
			let f = document.driveFrm;
			alert("정보를 지우고 다시 입력");
			f.reset();
			f.DRV_DATE.focus();
		}
	</script>
		
</body>
</html>