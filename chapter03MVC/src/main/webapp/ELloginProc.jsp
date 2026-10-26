<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 로그인 Proc</title>
</head>
<body>
   <%-- EL => ${} : 자바의 변수를 그대로 호출하여 사용할 수 없다
		request.setAttribute("변수이름 작명","value");
		${param.input태그의 name값을 가져올 수 있다}
		String 변수작명 = request.getPafameter("input태그의 name값"); 는 EL표현식의
		${param.input태그의 name값}과 같은 값이다. --%>
	
	<p>아이디: ${param.id}</p>
	<p>비밀번호 : ${param.pass}</p>
</body>
</html>