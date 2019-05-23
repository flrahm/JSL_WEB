
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function send(){
		
		var username = cal.username;
		var pay = cal.pay;
		
		if(username.value == ""){
			alert("이름를 입력하세요");
			return false;
		}
		 
		
		for(i = 0; i < pay.value.length ; i++){
			var ch = pay.value.charAt(i);
			if(!((ch >= '0') && (ch <= '9'))){
				alert("출장비는 숫자만 입력하세요");
				return false;
				}
			}
		
		cal.submit();
	}
	

</script>
</head>
<body>

<h1>급여 명세서</h1>
<form method = post name = cal action = "input_pro.jsp">
이름 : <input type = text name = username ><br>
출장비 : <input type= text name = pay>  <br>

<%
	

%>
<input type = button value = "등록" onClick = "send()">

<br>

</form>
</body>
</html>