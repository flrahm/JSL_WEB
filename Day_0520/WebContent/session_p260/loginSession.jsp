<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("id");
	String userpw = request.getParameter("pw");
	
	
	String name = "SEOL";
	String id = "shss2216";
	String pw = "123123";
	
	if(userid.equals(id) && userpw.equals(pw)){
		session.setAttribute("loginUser", name);
		response.sendRedirect("main.jsp");
	}
	else
		response.sendRedirect("main.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>