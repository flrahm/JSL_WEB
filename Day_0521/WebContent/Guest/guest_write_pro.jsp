<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "guest.GuestBean" %>
<%
	request.setCharacterEncoding("utf-8");
	String[] kindArr = request.getParameterValues("kind");
	String kind = "";
	
	if(kindArr != null)
	for(int i = 0; i < kindArr.length; i++){
		kind += kindArr[i];
		if(i != kindArr.length -1)
			kind += ",";
	}
	
%>

<jsp:useBean id = "guest" class = "guest.GuestBean">	<!-- 액션 태그를 이용한 자바 빈 객체 생성 -->
	<jsp:setProperty name = "guest" property ="*" /> <!-- 값을 설정해줌 -->
	<jsp:setProperty name = "guest" property = "readCnt" value = "2" />
	<jsp:setProperty name = "guest" property = "kind" value = "<%=kind%>" />
</jsp:useBean>

<%
	request.setAttribute("guest", guest);
	RequestDispatcher rd = request.getRequestDispatcher("guest_edit.jsp");
	rd.forward(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

공개여부 : <%= guest.getOpen() %> <br>
종류 : <%= guest.getKind() %><br>
작성자 : <%=guest.getWriter() %> <br>
제목 : <%=guest.getSubject() %> <br>
내용 : <%=guest.getContent() %> <br>
조회수: <%=guest.getReadCnt() %> <br>


</body>
</html>