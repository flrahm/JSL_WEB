<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("utf-8"); 
	List<String[]> srList = (List<String[]>)request.getAttribute("srList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>이익 순위 제품 화면</h3>
	<br>
	<br>
	<table>
		<tr>
			<td>제품 이름</td>
			<td>총 이익 금액</td>
		</tr>

		<%	
		for(int i = 0; i < srList.size() ; i++){
			String[] strArr = srList.get(i);	
		
	%>
		<tr>
			<td><%= strArr[0] %></td>
			<td><%= strArr[1] %></td>

		</tr>
		<%
		}
	%>



	</table>

	<input type="button" value="메인으로" onclick="toMain()">

	<script>
	function toMain(){
		location.href = "pm?cmd=goMain";
	}
</script>
</body>
</html>