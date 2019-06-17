<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method = "post" action = "/Day_0614/upload2.do" enctype="multipart/form-data">
	uploader : <input type = "text" name = "uploader"><br>
	subject :  <input type = "text" name = "subject"><br>
	file :  <input type = "file" name = "uploadFile01"><br>
	file :  <input type = "file" name = "uploadFile02"><br>
	file :  <input type = "file" name = "uploadFile03"><br>
	<input type = "submit" value = "upload"><br>

</form>
</body>
</html>