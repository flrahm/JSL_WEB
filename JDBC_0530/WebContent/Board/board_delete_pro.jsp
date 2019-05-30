<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	BoardDAO bdao = new BoardDAO();
	
	String num = request.getParameter("num");
	String inputPass = request.getParameter("pass");
	String pass = bdao.selectPassByNum(num);
	int flag = -1;
	int deleteOk = 0;
	
	if(pass.equals(inputPass)){
		flag = 1;
		deleteOk = bdao.deleteBoard(num);
	}
	
	
	pageContext.setAttribute("flag", flag);
	pageContext.setAttribute("deleteOk", deleteOk);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function enter(){
		opener.location.href = "board_list.jsp";
		self.close();
	}
	
	function closeWindow(){
		self.close();
	}
</script>
<body>

<c:if test="${flag == -1 }">
 비밀번호가 일치하지 않습니다<br> 
 <a href = "#" onClick = "closeWindow()">닫기</a>
</c:if>
<c:if test="${flag == 1 and deleteOk == 1 }"> 
삭제 성공<br>
<a href = "#" onClick = "enter()">확인</a>
</c:if>



</body>
</html>