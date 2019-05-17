<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사</title>
</head>
<body>

<br>
<h1>설문 조사</h1>

<form name = "survey" method = "post" action = "surveyResult.jsp">

<br>이름 : <input type = "text" name = "username">
<br>성별 :
<input type = "radio" name = "gender" value = "male" checked>
<input type = "radio" name = "gender" value = "female">
 
<br>좋아하는 계절 : 
<input type = "checkbox" name = "favSeason" value = "1">봄
<input type = "checkbox" name = "favSeason" value = "2">여름
<input type = "checkbox" name = "favSeason" value = "3">가을
<input type = "checkbox" name = "favSeason" value = "4">겨울
<br>
<input type = "submit" value = "전송">
<input type = "reset" value = "취소">
</form>

</body>
</html>