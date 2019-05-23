<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	String logingUser = request.getParameter("loginUser");
	
	if(logingUser.equals("user")){
%>
	<jsp:forward page="userMain.jsp">
	<jsp:param value="<%=userid %>" name="userid"/>
	<jsp:param value="<%=userpw %>" name="userpw"/>
	</jsp:forward>
<% }else { %>
	<jsp:forward page="managerMain.jsp">
	<jsp:param value="<%=userid %>" name="userid"/>
	<jsp:param value="<%=userpw %>" name="userpw"/>
	</jsp:forward>
<%} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>