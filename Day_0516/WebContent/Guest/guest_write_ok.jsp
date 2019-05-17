<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String context = request.getParameter("content");
	
	// DB에 저장함
	// DB에서 게시판 리스트를 받아옴
	
	List<String[] > list = new ArrayList<String[]>();

	
	
	
	boolean flag = false;
	if(name.equals("aaa"))
		flag = true;
	
	if(flag){
	RequestDispatcher rd = request.getRequestDispatcher("guest_list.jsp");
	request.setAttribute("subject", subject);
	request.setAttribute("name", name);
	request.setAttribute("context", context);
	rd.forward(request, response);
	}
	else{
		
%>
<script>
alert("등록실패");
</script>

<%} %>
</body>
</html>