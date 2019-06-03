<%@page import="member.dao.MemberManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mvo" class = "member.vo.MemberVO">
	<jsp:setProperty name="mvo" property="*" />
</jsp:useBean>    
<%
	
	String[] fa = request.getParameterValues("fa");
	String favorite = "";
	if(fa != null)
		for(int i = 0; i < fa.length ; i++){
			favorite += fa[i];
			if(i != fa.length-1)
				favorite += ",";
		}
	mvo.setFavorite(favorite);
%>
<%
	MemberManager manager = MemberManager.getInstance();
	int updateOk = manager.updateBoard(mvo);
	
/* 	out.print(insertOk + "<br>");
	out.print(mvo.toString()); */
	
	if(updateOk != 0){
		out.print("<script>alert('수정되었습니다');</script>");
		response.sendRedirect("userinfo_list.jsp");
	}else{
		out.print("<script>alert('수정 실패');</script>");
		response.sendRedirect("userinfo_list.jsp");
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