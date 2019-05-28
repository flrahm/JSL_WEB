<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value = "UTF-8"/>
<jsp:useBean id="now" class = "java.util.Date"></jsp:useBean>
<pre>

default : <c:out value="${now }"></c:out> <hr>
<fmt:timeZone value="GMT">
Swiss GMT : 	<fmt:formatDate value="${now }" type = "both" dateStyle="full" timeStyle="full"/>
</fmt:timeZone> 
<hr>

톰캣 서버의 기본 로케일 : <%=response.getLocale() %><br>

<fmt:setLocale value="ko_kr"/>
한국 로케일 : <%=response.getLocale() %>
통화 : <fmt:formatNumber value = "10000" type="currency"></fmt:formatNumber><br>
날짜 : <fmt:formatDate value="${now }"/>

<fmt:setLocale value="ja_jp"/>
일본 로케일 : <%=response.getLocale() %>
통화 : <fmt:formatNumber value = "10000" type="currency"></fmt:formatNumber><br>
날짜 : <fmt:formatDate value="${now }"/>


</pre>
</body>
</html>