<%@ page contentType="text/html; charset=UTF-8" %>
<%
	session.removeAttribute("loginIdx");
	session.removeAttribute("loginId");
	session.removeAttribute("loginName");
	response.sendRedirect("userinfo_list.jsp");

%>
<html>
<head>
<title>로그아웃 처리 </title>
</head>

<html>
