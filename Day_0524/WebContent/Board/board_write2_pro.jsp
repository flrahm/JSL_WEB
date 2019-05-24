<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.boardVO" %>
<%! List<boardVO> boardList = new ArrayList<boardVO>();%>

<jsp:useBean id="board" class="board.boardVO" >
<jsp:setProperty name = "board" property = "*" />
</jsp:useBean>
<%	
	String flag = request.getParameter("flag");
	
	if(!flag.equals("1")){
		boardList.add(board);
		response.sendRedirect("board_write2.jsp");
	}else{
		RequestDispatcher rd = request.getRequestDispatcher("board_list.jsp");
		request.setAttribute("boardList", boardList);
		rd.forward(request, response);
	}

	
%>
<!DOCTYPE html>
<!-- 자바 beans 이용 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>