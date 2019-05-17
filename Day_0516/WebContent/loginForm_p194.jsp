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
	String flagStr = request.getParameter("flag");
	int flag = 10;
	if(flagStr != null)
		flag = Integer.parseInt(flagStr);
	
	if(flag == 0)
		out.print("아이디가 틀렸습니다<br>");
	else if(flag == 1)
		out.print("비밀번호가 틀렸습니다<br>");
	
%>

<form name = loginForm method = "post" action = "loginProcess.jsp">
아이디 입력 : <input type = "text" name = "userid" ><br>
비밀번호 입력 : <input type = "password" name = "userpw">
<br> <input type = "submit" value = "전송"> 
<input type = "reset" value = "취소">
</form>

</body>
</html>