<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String[] arr = {"aaa","bbb","ccc","ddd","eee","fff","ggg"};
	pageContext.setAttribute("arr", arr);
%>

<c:forEach var = "apb" items="${arr }" varStatus="status" >
${status.index } &nbsp ${status.count } &nbsp ${apb }<br>
</c:forEach>
<hr>
<c:forEach var = "apb" items="${arr }" varStatus="status" >
<c:if test="${status.first }">apbArr : </c:if>  ${apb } <c:if test="${!status.last }">,</c:if>
</c:forEach>

</body>
</html>