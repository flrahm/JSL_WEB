<%@page import="net.hrdkorea.model.InsaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
 	InsaDAO idao = InsaDAO.getInstance();
 	int deleteOk = idao.delete_InsaVO(id);
 	
 	request.setAttribute("deleteOk", deleteOk);
 	RequestDispatcher rd = request.getRequestDispatcher("delete_input.jsp");
 	rd.forward(request, response);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>

</body>
</html>