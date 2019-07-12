<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("utf-8"); 
	List<String[]> priList = (List<String[]>)request.getAttribute("priList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>우선 생산 제품 목록</h3>
	<br>
	<br>
	<table>
		<tr>
			<td>제품 이름</td>
			<td>생산해야할 수량</td>
		</tr>

		<%	
		for(int i = 0; i < priList.size() ; i++){
			String[] strArr = priList.get(i);	
		
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