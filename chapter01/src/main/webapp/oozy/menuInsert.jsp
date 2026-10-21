<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<h3>메뉴등록</h3>
	<form action="menuInsertProc.jsp">
    <table>
        <!-- 1. 메뉴명 -->
        <tr>
            <td><label for="menu">메뉴명</label></td>
            <td>
                <input type="text" name="menu" id="menu"> 예)콜드브루 라떼
            </td>
        </tr>

        <!-- 2. 분류 -->
        <tr>
            <td><label for="category">분류</label></td>
            <td>
                <select name="category" id="category">
                    <option selected="selected" value="">분류</option>
                    <option value="10">[10]COFFEE</option>
                    <option value="20">[20]COLD BREW</option>
                    <option value="30">[30]BEVERAGE</option>
                    <option value="40">[40]DESSERT</option>            
                </select>
            </td>
        </tr>

        <!-- 3. 가격 -->
        <tr>
            <td><label for="price">가격</label></td>
            <td>
                <input type="text" name="price" id="price"> 원
            </td>
        </tr>

        <!-- 4. 판매상태 -->
        <tr>
            <td>판매상태</td>
            <td>
                <input type="radio" name="status" id="status1" value="판매중"><label for="status1">판매중</label>
                <input type="radio" name="status" id="status2" value="SEASON OUT"><label for="status2">SEASON OUT</label>    
            </td>
        </tr>

        <!-- 5. 설명 -->
        <tr>
            <td><label for="info">설명</label></td>
            <td>
                <input type="text" name="info" id="info">
            </td>
        </tr>

        <!-- 6. 버튼 영역 -->
        <tr>
            <td colspan="2">
                <input type="submit" value="메뉴등록"><input type="reset" value="다시쓰기">
            </td>
        </tr>
    </table>
</form>
