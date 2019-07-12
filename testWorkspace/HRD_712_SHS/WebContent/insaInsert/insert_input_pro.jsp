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
 	int insertOk = idao.insert_InsaVO(ivo);
 	
 	request.setAttribute("insertOk", insertOk);
 	RequestDispatcher rd = request.getRequestDispatcher("insert_input.jsp");
 	rd.forward(request, response);
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