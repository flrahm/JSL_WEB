<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="guest.dao.GuestDao"%>

<%
	String idx = request.getParameter("idx");
	GuestDao gdao = new GuestDao();
	int deleteOk = gdao.deleteGuest(idx);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function enter(){
		opener.location.href = "guest_list.jsp";
		self.close();
	}
</script>
</head>
<body>

삭제되었습니다<br>
<a href = "#" onClick = "enter()">확인</a>

</body>
</html>