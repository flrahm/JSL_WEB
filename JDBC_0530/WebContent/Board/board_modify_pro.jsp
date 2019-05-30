<%@page import="board.vo.BoardVO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	request.setCharacterEncoding("utf-8");
	BoardVO bvo = new BoardVO();
	bvo.setNum(Integer.parseInt(request.getParameter("num")));
	bvo.setEmail(request.getParameter("email"));
	bvo.setContents(request.getParameter("contents"));
	
	BoardDAO bdao = new BoardDAO();

	String num = request.getParameter("num");
	String inputPass = request.getParameter("pass");
	String pass = bdao.selectPassByNum(num);
	
	int flag = 0; // 0 : 비밀번호 틀림, 1 : 비밀번호 맞음
	int updateOk = 0;
	
	
	if(pass.equals(inputPass)){
		updateOk = bdao.updateBoard(bvo);
		flag = 1;
	}
		
	
 	if(flag == 1){
		out.println("<script>alert('수정되었습니다');</script>");
		response.sendRedirect("board_list.jsp");
	}else{
		out.println("<script>alert('비밀번호가 일치하지 않습니다');</script>");
		response.sendRedirect("board_modify.jsp?num="+num+"&flag=0");
	} 
	
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