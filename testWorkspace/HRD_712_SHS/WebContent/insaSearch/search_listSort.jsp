<%@page import="net.hrdkorea.model.InsaVO"%>
<%@page import="java.util.List"%>
<%@page import="net.hrdkorea.model.InsaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); 
	String val = request.getParameter("val");
	String searchFlag = request.getParameter("searchFlag");
	String sortBy = request.getParameter("sortBy");
	
	
	InsaDAO idao = InsaDAO.getInstance();
	List<InsaVO> list = idao.select_ByIdOrDept(val, searchFlag,sortBy);
	request.setAttribute("searchFlag", searchFlag);
	request.setAttribute("val", val);
	request.setAttribute("list", list);
	out.print(list.size());
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