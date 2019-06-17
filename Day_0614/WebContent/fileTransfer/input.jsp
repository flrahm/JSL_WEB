<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- enctype : request.getparameter 사용불가 -->
<form method = "post" action = "/Day_0614/upload.do" enctype="multipart/form-data">
	uploader : <input type = "text" name = "uploader"><br>
	subject :  <input type = "text" name = "subject"><br>
	file :  <input type = "file" name = "uploadFile"><br>
	<input type = "submit" value = "upload"><br>

</form>

</body>
</html>