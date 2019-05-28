<%@page import="notice.NoticeVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<NoticeVO> list = new ArrayList<NoticeVO>();
	NoticeVO nvo1 = new NoticeVO(1,"aaa",0);
	NoticeVO nvo2 = new NoticeVO(2,"bbb",15);
	NoticeVO nvo3 = new NoticeVO(4,"ccc",23);
	NoticeVO nvo4 = new NoticeVO(7,"ddd",8);
	list.add(nvo1);
	list.add(nvo2);
	list.add(nvo3);
	list.add(nvo4);
	
	request.setAttribute("list", list);
	RequestDispatcher rd = request.getRequestDispatcher("notice_list.jsp");
	rd.forward(request, response);
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