<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	int num1 = 10;
	int num2 = 20;
	String apb = "abcdefghi";
	String str = "a,b,c,d,e,f,g";
	pageContext.setAttribute("num1", num1);
	pageContext.setAttribute("num2", num2);
	pageContext.setAttribute("apb", apb);
	pageContext.setAttribute("str", str);

%>

${fn:length(apb) }<hr>
${fn:contains(apb,'bcd') }<hr>


<c:set var = "apbStr" value="${fn:split(str, ',') }"></c:set>
<c:forEach var="a" items="${apbStr }">
${a }<br>
</c:forEach>


</body>
</html>