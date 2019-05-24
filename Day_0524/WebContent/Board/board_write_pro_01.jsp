<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String contents = request.getParameter("contents");
	String pass = request.getParameter("pass");
	String indate = request.getParameter("indate");
%>
<!DOCTYPE html>
<!-- 기본 방식 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<br> 작성자 :	<%= name %>
<br> 이메일 : 	<%= email%>
<br> 제목 :	<%= subject%>
<br> 내용 : <textarea rows="5" cols="35"><%=contents %></textarea>
<br> 비밀번호 : <%=pass %>
<br> 등록일자 : <%=indate %>

</body>
</html>