<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<fmt:requestEncoding value="utf-8"/>
<c:if test="${param.usertype == 1 }">
<c:url var="goUrl" value="selfTest01_user.jsp?username=${param.username }" />
<c:redirect url="${goUrl }"> </c:redirect>
</c:if>

<c:if test="${param.usertype == 2 }">
<c:url var="goUrl" value="selfTest01_admin.jsp?username=${param.username }" />
<c:redirect url="${goUrl }"></c:redirect>
</c:if>


</body>
</html>