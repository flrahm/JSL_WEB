<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
	
<jsp:useBean id="bvo" class = "board.vo.BoardVO">
	<jsp:setProperty name="bvo" property="*" />
</jsp:useBean>
	
<%
	BoardDAO bdao = new BoardDAO();
	int insertOk = bdao.insertBoard(bvo);
	/* out.print(insertOk + "<Br>");
	out.print(bvo.getName() + "<Br>");
	out.print(bvo.getPass() + "<Br>"); */
	response.sendRedirect("board_list.jsp");
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