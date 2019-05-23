<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	if(request.getParameter("status") != null)
		if(request.getParameter("status").equals("1"))
			out.print("아이디 또는 비밀번호가 일치하지 않습니다<br>");
	
%>
<form method = "post" action = "loginSession.jsp">
<label for = "userid">아이디:</label>
<input type = "text" name = "id" id = "userid"><br>

<label for = "passwd">비밀번호:</label>
<input type = "password" name = "pw" id = "userpw"><br>

<input type = "submit" value = "로그인">
</form>


</body>
</html>