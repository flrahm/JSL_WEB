<%@page import="dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
%>

<jsp:useBean id="mvo" class="vo.MemberVO">
	<jsp:setProperty name="mvo" property="*" />
</jsp:useBean>

<%
	memberDAO mdao = memberDAO.getInstacne();
	int insertOk = mdao.insertMember(mvo);
	out.print(insertOk);
	if(insertOk == 1){
%>

<script>
	alert('등록되었습니다');
	loaction.href = "regmember.jsp";
</script>

<%
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