<%@page import="net.hrdkorea.model.InsaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
 %>
 <jsp:useBean id="ivo" class="net.hrdkorea.model.InsaVO">
 	<jsp:setProperty name="ivo" property="*" /> 
 </jsp:useBean>
 
 <%
 	InsaDAO idao = InsaDAO.getInstance();
 	int updateOk = idao.update_InsaVO(ivo);
 	
 	request.setAttribute("updateOk", updateOk);
 	RequestDispatcher rd = request.getRequestDispatcher("update_input.jsp");
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