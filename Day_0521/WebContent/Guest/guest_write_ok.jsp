<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "guest.GuestBean" %>
<%
	request.setCharacterEncoding("utf-8");
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
 	 GuestBean guest = new GuestBean();
 	 guest.setWriter(writer);
 	 guest.setSubject(subject);
 	 guest.setContent(content);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

이름 :<%=guest.getWriter() %><br>
제목 :<%=guest.getSubject() %><br>
내용 :<%=guest.getContent() %><br>

</body>
</html>