<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주행내역</title>
</head>
<body>
	<form action="driveProc.jsp" method="post">
		<table>
			<tr>
				<td>
					<label for="drvDate">주행일자 : </label><input type="text" name="drvDate" id="drvDate" placeholder="예)20230101">
				</td>
			</tr>
			<tr>
				<td>
					<label for="carNo">차량번호 : </label><input type="text" name="carNo" id="carNo" placeholder="예)10가0001">
				</td>
			</tr>
			<tr>
				<td>
					<label for="drvStart">출발Km : </label><input type="text" name="drvStart" id="drvStart" placeholder="숫자만 입력하시오">
				</td>
			</tr>
			<tr>
				<td>
					<label for="drvEnd">도착km : </label><input type="text" name="drvEnd" id="drvEnd" placeholder="숫자만 입력하시오">
				</td>
			</tr>
			<tr>
				<td>
					<select name="deptCode">
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
					<label for="drvMoney">주유금액 : </label><input type="text" name="drvMoney" id="drvMoney" placeholder="숫자만 입력하시오">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="주행내역등록">
					<input type="reset" value="다시쓰기">
				</td>
			</tr>		
		</table>
	</form>
</body>
</html>