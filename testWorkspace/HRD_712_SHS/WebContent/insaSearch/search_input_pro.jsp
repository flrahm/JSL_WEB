<%@page import="net.hrdkorea.model.InsaVO"%>
<%@page import="java.util.List"%>
<%@page import="net.hrdkorea.model.InsaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String dept = request.getParameter("dept");

	String val = id;
	int flag = 1; // 1이면 id로, 2면 dept로 검색
	if (request.getParameter("searchFlag").equals("byDept")) {
		flag = 2;
		val = dept;
	}

	InsaDAO idao = InsaDAO.getInstance();
	List<InsaVO> list = idao.select_ByIdOrDept(val, ""+flag,"id");
	
	
	request.setAttribute("val", val);
	request.setAttribute("searchFlag", ""+flag);
	request.setAttribute("list", list);
	RequestDispatcher rd = request.getRequestDispatcher("search_list.jsp");
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