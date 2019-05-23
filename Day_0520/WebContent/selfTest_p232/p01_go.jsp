<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request.setCharacterEncoding("utf-8");
	String search = request.getParameter("search");
	String SE = request.getParameter("SE");
	System.out.print(search);
	if(SE.equals("naver"))
		response.sendRedirect("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+search);
	else if(SE.equals("google"))
		response.sendRedirect("https://www.google.com/search?q="+search+"&oq="+search+"&aqs=chrome..69i57j0l5.703j0j8&sourceid=chrome&ie=UTF-8");
		
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