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
		
		if(login.usertype[0].checked == true){
			
			login.action = "selfTest01_user.jsp";
			login.submit();
			
		}else if(login.usertype[1].checked == true){
			
			login.action = "selfTest01_admin.jsp";
			login.submit();
			
		}else{
			alert("오류");
		}
	}
	
	function send2(){
		login.action = "selfTest01_loginPro.jsp";
		login.submit();
	}
</script>
<body>

<form method = post name = "login">
이름 : <input type = text name = "username"><br>
비밀번호 : <input type = password name = "userpw"><br>
<input type = radio name = "usertype" value = "1" checked>사용자
<input type = radio name = "usertype" value = "2" >관리자

<br> <input type = "button" value = "way 1" onClick = "send()">
<input type = "button" value = "way 2" onClick = "send2()">
</form>

</body>
</html>