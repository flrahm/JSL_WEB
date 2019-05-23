<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method = post action = "actionTagTest.jsp">
ID : <input type = text name = userid><br>
PW : <input type = password name = userpw><br>
<input type = radio name = loginUser value =user checked> user <br>
<input type = radio name = loginUser value =manager> manager<br>
<input type = submit name = transfer>
</form>
</body>
</html>