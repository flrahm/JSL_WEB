<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name = login method = get action = "login_pro.jsp">
	<label for = userid>아이디 : </label>
	<input type = text name = userid ><br>
	
	<label for = passwd>비밀번호 : </label>
	<input type = password name = passwd ><br>
	
	<input type = submit value = "전송">
</form>
</body>
</html>