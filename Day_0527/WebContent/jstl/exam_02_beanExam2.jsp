<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<c:set var = "member" value = "<%= new expressionLanguage.MemberVO() %>" />
<c:set target ="${member }" property = "name" value = "${param.name }" />
<c:set target ="${member }" property = "userid" value = "${param.userid }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

이름 : ${member.name } <br>
아이디 : ${member.userid }

</body>
</html>