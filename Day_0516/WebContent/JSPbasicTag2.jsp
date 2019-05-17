<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "test.Exam_01" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Exam_01 ex1 = new Exam_01();
	int sum = ex1.test();
%>
<%@ include file = "../include/topmenu.jsp" %>	
<%= sum %>
</body>
</html>