<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String userid = request.getParameter("userid");
	String passwd = request.getParameter("passwd");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	//String fa = request.getParameter("fa");// 배열이 넘어오는데 값을 하나만 받아옴
	String[] fa = request.getParameterValues("fa");

	String job = request.getParameter("job");

	String fav = "";
	if (fa != null)
		for (int i = 0; i < fa.length; i++) {
			fav += fa[i];
			if (i != fa.length - 1)
				fav += ",";
		}
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>입력자료 출력</h1>
	이름 : <%= name %><br>
	id : <%= userid %><br>
	passwd : <%= passwd %><br>
	tel : <%= tel %><br>
	email : <%= email %><br>
	favorite : <%= fav %>

	
</body>
</html>