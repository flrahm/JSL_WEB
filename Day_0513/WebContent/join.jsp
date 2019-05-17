<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
</head>
<body>
	<!-- method : 전송방식(post,get) // action = 전달 위치(servlet 이름)-->
	<form name = "join" method = "post" action="JoinServlet">	<!-- 접근방식 : join.userid -->
		<table border="1" align="center">
			<tr>
				<td colspan="2" align="center">Member Register</td>
				<!-- colspan : 한줄로 합침 -->
			</tr>

			<tr>
				<td>ID</td>
				<td><input type="text" name = "userId"></td>
			</tr>

			<tr>
				<td>PW</td>
				<td><input type="password" name = "userPw"></td>
			</tr>

			<tr>
				<td>Name</td>
				<td><input type="text" name = "userName"></td>
			</tr>

			<tr>
				<td>Email</td>
				<td><input type="text" name = "userEmail"></td>
			</tr>

			<tr>
				<td>Age</td>
				<td><input type="text" name = "userAge"></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="sign in"> <input type="reset" value="cancel">
					<!-- submit : form 전송, reset : 값 초기화 -->
			</tr>
		</table>
	</form>	<!-- 입력 관련 자료는 폼 태그 안에 있어야 함 --> 
</body>
</html>