<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="50%" border="1">


		<tr>
			<td width="15%">number</td>
			<td width="20%">name</td>
			<td>adress</td>
		</tr>

		<%
			for(int i = 1; i <= 10; i ++){
		%>
		<tr>
			<td width="15%"><%=i %></td>
			<td width="20%">name</td>
			<td>adress</td>
		</tr>
		<%
			}
		%>



	</table>

</body>
</html>