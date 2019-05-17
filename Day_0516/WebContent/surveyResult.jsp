<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("username");
	String gender = request.getParameter("gender");
	String[] season = request.getParameterValues("favSeason");
	String favSeason = "";
	
	
	String[] seasonList = {"봄","여름","가을","겨울"};
	if(season != null)
		for(int i = 0; i <season.length; i++){
			favSeason += seasonList[Integer.parseInt(season[i])-1];
			if(i !=(season.length-1))
				favSeason += ",";
		}

	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사 결과</title>
</head>
<body>
<h1>설문조사 결과</h1>
<br>
이름 : <%= name %>
<br>
성별 : <%= gender %>
<br>
당신이 좋아하는 계절은 <h3><%= favSeason %></h3> 입니다
<br>

<b><a href = 'javascript:history.go(-1)'>다시</a></b>
</body>
</html>