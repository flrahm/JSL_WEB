<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello JSP</title>
</head>
<body>
	<%
	int num1 = 10;
	int num2 = 20;
	int sum = num1 + num2;
	%>
	num1 = <%= num1 %><br>
	num2 = <%= num2 %><br>
	sum = <%= sum %> <br>
	
</body>
</html>