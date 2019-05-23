<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>검색 엔진 정보 페이지</h1><br>
<form type = "get" action = "p01_go.jsp">
<h3>검색어를 입력하세요 </h3><input type = "text" name ="search">
<h3>검색 엔진을 선택하세요</h3><br>
<input type ="radio" name = SE value = "naver" checked>네이버<br>
<input type ="radio" name = SE value = "google">구글<br>
<input type = "submit" value = "검색">
</form>
</body>
</html>