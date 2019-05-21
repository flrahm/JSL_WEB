<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String[] fa = request.getParameterValues("fa");
	String favorite = "";

	if (fa != null)
		for (int i = 0; i < fa.length; i++) {
			favorite += fa[i];
			if (i != fa.length - 1)
				favorite += ",";
		}

	int zipcode = 0;
	if (request.getParameter("zip") != "")
		zipcode = Integer.parseInt(request.getParameter("zip"));
	else
		zipcode = 0;
%>

<jsp:useBean id="member" class="member.MemberVO">
	<jsp:setProperty name="member" property="*" />
	<jsp:setProperty name="member" property="favorite"
		value="<%=favorite%>" />
	<jsp:setProperty name="member" property="zipcode" value="<%=zipcode%>" />
</jsp:useBean>

<%
	String pwshow = "";
	if(member.getPasswd() != null)
		for(int i = 0; i < member.getPasswd().length() ; i++){
			if(i == 0)
				pwshow += member.getPasswd().charAt(0);
			else
				pwshow += "*";
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function edit(){
		
		edit_form.submit();
	}
	
	function send(){
		
		send_form.submit();
	}
</script>
</head>
<body>
<h1>입력 결과 출력</h1>
이름 : <%=member.getName() %><br>
아이디 : <%=member.getUserid() %><br>
비밀번호 : <%=pwshow %><br>
우편번호 :<%=member.getZipcode() %> <br>
주소1: <%=member.getAddr1() %><br>
주소2: <%=member.getAddr2() %><br>
전화번호 : <%=member.getTel() %><br>
이메일 : <%=member.getEmail() %><br>
직업 : <%=member.getJob() %><br>
관심분야 : <%=member.getFavorite() %><br>
자기소개 : <%=member.getIntro() %><br>

<!--  아이디는 변경 불가 -->
<form name = "edit_form" method = "post" action = "userinfo_edit.jsp">

<input type = "hidden" name = "userid" value = "<%=member.getUserid() %>">
<input type = "hidden" name = "name" value = "<%=member.getName() %>">
<input type = "hidden" name = "passwd" value = "<%=member.getPasswd() %>">
<input type = "hidden" name = "zipcode" value = "<%=member.getZipcode() %>">
<input type = "hidden" name = "addr1" value = "<%=member.getAddr1() %>">
<input type = "hidden" name = "addr2" value = "<%=member.getAddr2() %>">
<input type = "hidden" name = "tel" value = "<%=member.getTel() %>">
<input type = "hidden" name = "email" value = "<%=member.getEmail() %>">
<input type = "hidden" name = "job" value = "<%=member.getJob() %>">
<input type = "hidden" name = "favorite" value = "<%=member.getFavorite() %>">
<input type = "hidden" name = "intro" value = "<%=member.getIntro() %>">

</form>

<form name = "send_form" method = "post" action = "userinfo_list.jsp">
<input type = "hidden" name = "userid" value = "<%=member.getUserid() %>">
<input type = "hidden" name = "name" value = "<%=member.getName() %>">
<input type = "hidden" name = "zipcode" value = "<%=member.getZipcode() %>">
<input type = "hidden" name = "addr1" value = "<%=member.getAddr1() %>">
<input type = "hidden" name = "addr2" value = "<%=member.getAddr2() %>">
<input type = "hidden" name = "tel" value = "<%=member.getTel() %>">
<input type = "hidden" name = "job" value = "<%=member.getJob() %>">
</form>

<input type = "button" value = "수정" onClick = "edit()">
<input type = "button" value = "전송" onClick = "send()">
</body>
</html>