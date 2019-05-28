<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("name", "page name");
	request.setAttribute("name", "request name");
	session.setAttribute("name", "session name");
	application.setAttribute("name", "application name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>name : ${name } 
<br>page 속성 : ${pageScope.name } 
<br>request 속성 : ${requestScope.name }
<br>session 속성 : ${sessionScope.name }
<br>application 속성 : ${applicationScope.name }
</body>
</html>