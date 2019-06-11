<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form name = "uploadFrm" method = "post" enctype="multipart/form-data" action  = "/Day_0611/upload.do">
uploader : <input type = "text" name = "uploader" ><br>
title : <input type = "text" name = "title"><br>
file select : <input type ="file" name = "uploadedFile"><br>
<input type ="submit" value = "transfer">


</form>

</body>
</html>