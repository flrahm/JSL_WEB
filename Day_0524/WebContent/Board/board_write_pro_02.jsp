<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.boardVO" %>

<jsp:useBean id="board" class="board.boardVO" >
<jsp:setProperty name = "board" property = "*" />
</jsp:useBean>

<!DOCTYPE html>
<!-- 자바 beans 이용 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<br> 작성자 :	<%= board.getName() %>
<br> 이메일 : <%= board.getEmail() %>
<br> 제목 :<%= board.getSubject() %>
<br> 내용 : <textarea rows="5" cols="35"><%= board.getContents() %></textarea>
<br> 비밀번호 : <%= board.getPass() %>
<br> 등록일자 : <%= board.getIndate() %>

</body>
</html>