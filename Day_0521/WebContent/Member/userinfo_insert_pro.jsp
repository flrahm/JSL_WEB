<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberVO" %>
<%
	request.setCharacterEncoding("utf-8");


	String[] fa = request.getParameterValues("fa");
	String favorite = "";
	
	if(fa != null)
		for(int i = 0; i < fa.length; i++){
			favorite += fa[i];
			if(i != fa.length-1)
				favorite += ",";
		}
	
	
	int zipcode = 0;
	if(request.getParameter("zip") != "")
		zipcode = Integer.parseInt(request.getParameter("zip"));
	else
		zipcode = 0;
%>

<jsp:useBean id="member" class = "member.MemberVO">
	<jsp:setProperty name = "member" property = "*" />
	<jsp:setProperty name = "member" property = "favorite" value = "<%=favorite %>" />
	<jsp:setProperty name = "member" property = "zipcode" value = "<%=zipcode %>" />
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

이름 : <%=member.getName() %><br>
아이디 : <%=member.getUserid() %><br>
비밀번호 : <%=member.getPasswd() %><br>
주소 :<%=member.getZipcode() %> &nbsp <%=member.getAddr1() %> &nbsp <%=member.getAddr2() %><br>
전화번호 : <%=member.getTel() %><br>
이메일 : <%=member.getEmail() %><br>
직업 : <%=member.getJob() %><br>
자기소개 : <%=member.getIntro() %><br>
관심분야 : <%=member.getFavorite() %><br>


</body>
</html>