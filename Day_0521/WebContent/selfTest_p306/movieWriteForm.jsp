<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method = "post" name = "movieForm" action = "movieWrite.jsp">
<h1>영화 정보 등록</h1><br><br>
제목 : <input type = "text" name = "title"> <br>
가격 : <input type = "text" name = "price"> <br>
감독 : <input type = "text" name = "director"> <br>
배우 : <input type = "text" name = "actor"> <br>
시놉시스 : <textarea name = "synopsis" rows = "3" cols = "35"> </textarea><br>
장르 : <select name = "genre" size = "1">
 <option value = "액션">액션</option>
 <option value = "코미디">코미디</option>
 <option value = "느와르">느와르</option>
 <option value = "코미디">코미디</option>
</select>
<br>
<input type = "submit" value = "전송">
</form>
</body>
</html>