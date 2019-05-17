<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "aaa";
	String pw = "123";
	
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	
	int flag=2;
	
	if(id.equals(userid)){
		if(pw.equals(userpw)){
			flag = 2;	// 로그인 성공
			response.sendRedirect("login_ok.jsp" +"?userid="+URLEncoder.encode(userid,"utf-8"));
		}
		else{
			flag = 1;	// 비밀번호 틀림
			response.sendRedirect("loginForm_p194.jsp"+"?flag="+flag);
		}
	}else{
		flag = 0; // 아이디 틀림
		response.sendRedirect("loginForm_p194.jsp"+"?flag="+flag);
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