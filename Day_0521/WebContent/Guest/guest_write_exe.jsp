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

 	String[] kindArr = request.getParameterValues("kind");
 	String kind = "";
 	
 	if(kindArr != null)
 	for(int i = 0; i < kindArr.length; i++){
 		kind += kindArr[i];
 		if(i != kindArr.length -1)
 			kind += ",";
 	}
 	guest.setKind(kind);
 	
 	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function send(){
		frm.submit();
	}
</script>
</head>
<body>

공개여부 : <%= guest.getOpen() %> <br>
종류 : <%= guest.getKind() %><br>
작성자 : <%=guest.getWriter() %> <br>
제목 : <%=guest.getSubject() %> <br>
내용 : <%=guest.getContent() %> <br>
조회수: <%=guest.getReadCnt() %> <br>

<form name = "frm" method = "post" action = "guest_edit2.jsp">
<input type = hidden name = open value = <%= guest.getOpen() %>>
<input type = hidden name = kind value = <%= guest.getKind() %>>
<input type = hidden name = writer value = <%=guest.getWriter() %>>
<input type = hidden name = subject value = <%=guest.getSubject() %>>
<input type = hidden name = content value =<%=guest.getContent() %>>
<input type = hidden name = readCnt value = <%=guest.getReadCnt() %>>

</form>

<a href = "#" onClick = "send()"> 수정하기 </a>
</body>
</html>