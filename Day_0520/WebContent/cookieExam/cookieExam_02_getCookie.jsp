<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 모든 쿠키를 가져오므로 배열을 가져옴
	Cookie[] cookies = request.getCookies();
	for(Cookie c : cookies){
		out.print(c.getName() + " : " + c.getValue() + "<br>");
	}

%>
</body>
</html>