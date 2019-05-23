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
	if(session.getAttribute("loginUser") == null){
		response.sendRedirect("loginForm.jsp?status=1");
	}
	else{
%>
	<%= session.getAttribute("loginUser") %> 님 로그인 성공<br>
	<form method = "post" action = "logout.jsp">
		<input type = "submit" value = "logout">
	</form>
<%} %>
</body>
</html>