<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class = "expressionLanguage.MemberVO">
	<jsp:setProperty name = "member" property = "*"/>	
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

이름 : <%=member.getName() %>
아이디 : <%=member.getUserid() %>

</body>
</html>