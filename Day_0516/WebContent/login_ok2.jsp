<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username2 = (String)request.getAttribute("username");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${username } 님 로그인 성공<br>
<%= username2 %> 님 반갑습니다
</body>
</html>