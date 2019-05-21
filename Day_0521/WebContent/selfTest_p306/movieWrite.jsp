
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "selfTest_p306.MovieBean" %>
<% request.setCharacterEncoding("utf-8"); %>


	<jsp:useBean id = "movie1" class = "selfTest_p306.MovieBean" >
		<jsp:setProperty name = "movie1" property = "*" />
	</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>입력 완료된 정보</h1><br>

제목: <%= movie1.getTitle() %><br>
가격:<%= movie1.getPrice() %><br>
감독:<%= movie1.getDirector() %><br>
출연배우:<%= movie1.getActor() %><br>
시놉시스:
<textarea rows="3" cols="35">
<%= movie1.getSynopsis() %>
</textarea>
<br>
장르 :<%= movie1.getGenre() %><br>


</body>
</html>