<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	String str = "a,b.c;d?e,f!g";
	pageContext.setAttribute("str", str);
%>

	<c:forTokens var = "apb" items="${str }" delims=",.;?!">
	${apb }<br>
	</c:forTokens>


</body>
</html>