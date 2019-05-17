<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exam_01</title>
</head>
<body>

<% 
for(int i = 1; i <= 9; i ++){ 
%>
2 * <%= i%> = <%= i*2 %> <br>
<% } %>
</body>
</html>