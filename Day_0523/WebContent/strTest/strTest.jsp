<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function send(){
		
		if(form.input.value.length%2 !=0){
			alert("입력 값의 길이가 홀수입니다");
			return false;
	}
		
		form.submit();
		
	}

</script>
<body>

<form method = post name = form action = "strTest_pro.jsp">

입력 : <input type = text name = input><br>

<input type ="button" onClick = "send()" value = "전송" >
</form>
</body>
</html>