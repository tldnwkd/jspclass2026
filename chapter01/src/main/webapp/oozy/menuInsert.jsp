<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<h3>메뉴등록</h3>
	<form action="menuInsertProc.jsp">
		<table>
			<tr>
				<td><label for="menu">메뉴명</label><input type="text" name="menu" id="menu"> 예)콜드브루 라떼</td>
			</tr>
			<tr>
				<td>
					<label for="category">분류</label>
					<select name="category">
						<option selected="selected" value="">분류</option>
						<option value="10">[10]COFFEE</option>
						<option value="20">[20]COLD BREW</option>
						<option value="30">[30]BEVERAGE</option>
						<option value="40">[40]DESSERT</option>			
					</select>
				</td>
			</tr>
			<tr>
				<td><label for="price">가격</label><input type="text" name="price" id="price"> 원</td>
			</tr>
			<tr>
				<td>
					<label for="status">판매상태</label>
					<input type="radio" name="status" id="status" value="판매중"><label for="status">판매중</label>
					<input type="radio" name="status" id="status" value="SEASON OUT"><label for="status">SEASON OUT</label>	
				</td>
			</tr>
			<tr>
				<td><label for="info">설명</label><input type="text" name="info" id="info"></td>
			</tr>
			<tr>
				<td>
				 	<input type="submit" value="메뉴등록"><input type="reset" value="다시쓰기">
				</td>
			</tr>
		</table>
	</form>
