<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

당신이 입력한 정보입니다(expression)<br>
아이디 :<%=request.getParameter("userid") %> <br>
비밀번호 :<%=request.getParameter("passwd") %> <br>
<hr>
당신이 입력한 정보입니다(expression language)<br>
아이디 :${param.userid } <br>
비밀번호 : ${param["passwd"] }<br> 
</body>
</html>