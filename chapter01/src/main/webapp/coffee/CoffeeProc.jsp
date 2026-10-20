<%@page import="java.text.DecimalFormat"%>
<%@page import="javax.swing.text.html.HTMLEditorKit.Parser"%>
<%@page import="javax.xml.parsers.ParserConfigurationException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		/* 3자리마다 콤마 출력하는 DecimalFormat 객체를 인스턴스 한다. */
		DecimalFormat de = new DecimalFormat("#,##0");
		String coffee = request.getParameter("coffee");
		String count = request.getParameter("count");
		String price = request.getParameter("price");
		int countint = Integer.parseInt(count);
		int priceint = Integer.parseInt(price);
		int coffeeprice = 0;
		int totalprice = 0;
	%>
	<h2>주문계산 결과</h2>
	<ul>
		<li>
			커피종류 : <%=coffee %>
		</li>
		<li>
			1개 가격 : <% if(coffee.equals("아메리카노")) {
							coffeeprice= 3000;
					 }else if(coffee.equals("카페라떼")){
					 		coffeeprice= 3300;
					 }else if(coffee.equals("에스프레소")){
					 		coffeeprice= 2500;
					 }else{ 
					 		coffeeprice= 3500;
					 } 
					 	totalprice = coffeeprice *countint;
					 %>
					 <%= de.format(coffeeprice)%> 원
		</li>
		<li>
			수량 : <%= countint %>개
		</li>
		<li>
			총 금액 : <%= de.format(totalprice) %> 원
		</li>
		<li>
			입금액 : <%= de.format(priceint) %> 원
		</li>
		<li>
			거스름돈 : <% if(priceint>=totalprice){ %>
						<%= de.format(priceint-totalprice) %> 원
					<% }else{%>
						<script type="text/javascript">
							alert("주문금액이 입금액보다 큽니다 다시 주문하세요");
							history.go(-1);
						</script>
					<%} %>			
		</li>
	</ul>
</body>
</html>