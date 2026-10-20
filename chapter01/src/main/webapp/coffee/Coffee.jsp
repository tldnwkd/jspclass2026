<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피메뉴</title>
<style>
	
</style>
</head>
<body>
	<h2>커피메뉴</h2>
	<form action="CoffeeProc.jsp" method="get">
		<table>
			<tr>
				<td>
					<input type="radio" name="coffee" value="아메리카노" id="ame">
		 					<label for="ame">아메리카노(3000원)</label>&nbsp;&nbsp;
		 		</td>
		 	</tr>
		 	<tr>
		 		<td>
					<input type="radio" name="coffee" value="카페라떼" id="latte">
		 					<label for="latte">카페라떼(3300원)</label>&nbsp;&nbsp;
		 		</td>
		 	</tr>
		 	<tr>
		 		<td>
					<input type="radio" name="coffee" value="에스프레소" id="asf">
		 					<label for="asf">에스프레소(2500원)</label>&nbsp;&nbsp;
		 		</td>
		 	</tr>
		 	<tr>
		 		<td>
					<input type="radio" name="coffee" value="얼그레이티" id="alg">
		 					<label for="alg">얼그레이티(3500원)</label>&nbsp;&nbsp;
		 		</td>
		 	</tr>
		 	<tr>
	 			<td>
	 				<label for="count">수량 : </label><input type ="number" name="count">	
	 			</td>
	 		</tr>				
		 	<tr>
	 			<td>
	 				<label for="price">입금액 : </label><input type ="number" name="price">
	 				<input type="submit" value="주문처리">
	 			</td>
	 		</tr>				
		</table>
	</form>
</body>
</html>