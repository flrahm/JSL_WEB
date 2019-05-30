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
	int updateOk = gdao.updateGuest(gvo);
	response.sendRedirect("guest_view.jsp?idx="+gvo.getIdx()+"&updateOk="+updateOk);
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