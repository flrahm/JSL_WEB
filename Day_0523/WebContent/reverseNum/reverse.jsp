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
		
		var input = form.input.value;
		
		if(input.length > 6 ){
			alert("6자 이하의 숫자를 입력하세요");
			return false;
		}
		
		for(var i = 0; i < input.length ; i++){
			var ch = input.charAt(i);
			if( ch<'0' || ch >'9'){
				alert("숫자만 입력하세요");
				return false;
			}
		}
		
		
		
		form.submit();
	}
</script>
<body>
<form method = post name = form action = "reverse_pro.jsp">

입력 : <input type = text name = input><br>

<input type ="button" onClick = "send()" value = "전송" >
</form>
</body>
</html>