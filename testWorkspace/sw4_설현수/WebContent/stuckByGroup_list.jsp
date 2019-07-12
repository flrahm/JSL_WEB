<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("utf-8"); 
	List<String[]> sList = (List<String[]>)request.getAttribute("sList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>그룹 별 재고 수량 화면</h3>
	<br>
	<br>
	<table>
		<tr>
			<td>그룹이름</td>
			<td>재고 수량</td>
		</tr>

		<%	
		for(int i = 0; i < sList.size() ; i++){
			String[] strArr = sList.get(i);	
		
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