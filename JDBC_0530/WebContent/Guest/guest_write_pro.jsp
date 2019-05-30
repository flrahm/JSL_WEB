<%@page import="guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="gvo" class = "guest.vo.GuestVO">
	<jsp:setProperty name="gvo" property="*" />
</jsp:useBean>    

<%
	pageContext.setAttribute("gvo", gvo);
	GuestDao gdao = new GuestDao();
	int insertOk = gdao.insertNewGuest(gvo);	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${gvo.name }
${gvo.subject }
${gvo.contents }

<a href = "guest_list.jsp?">리스트로 이동</a>
</body>
</html>
