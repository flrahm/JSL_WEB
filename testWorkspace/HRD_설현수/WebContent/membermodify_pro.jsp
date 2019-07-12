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
	int updateOk = mdao.updateMember(mvo);
	out.print(updateOk);
	if(updateOk == 1){
%>

<script>
	alert('수정되었습니다');
	location.href = "memberlist.jsp";
</script>

<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>

</body>
</html>