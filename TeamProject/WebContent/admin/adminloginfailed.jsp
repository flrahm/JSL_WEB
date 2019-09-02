<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${flag==-1 }">
	<script>
		alert("아이디가 존재하지 않습니다.");
		location.href="adminlogin.do";
	</script>
</c:if>
	<script>
		alert("비밀번호가 다릅니다.");
		location.href="adminlogin.do";
	</script>
<c:if test="${flag==0 }">

</c:if>
</body>
</html>