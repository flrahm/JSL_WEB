<%@page import="net.hrdkorea.model.InsaVO"%>
<%@page import="java.util.List"%>
<%@page import="net.hrdkorea.model.InsaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String val = (String)request.getAttribute("val");
	String searchFlag = (String)request.getAttribute("searchFlag");
	List<InsaVO> list = (List<InsaVO>)request.getAttribute("list");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>직원정보 조회결과</h1>

<form name ="sortFrm" method="post" action = "search_listSort.jsp">
	<table style="text-align: center; width: 700px; ">
		<tr>
			<td>사원명</td>
			<td>사번</td>
			<td>직급</td>
			<td>직책</td>
			<td>연락처</td>
			<td>소속부서</td>
		</tr>
		
		
		<% for(int i = 0; i < list.size() ; i++) { 
			InsaVO ivo = list.get(i);
		%>
		<tr>
			<td><%=ivo.getName() %></td>
			<td><%=ivo.getId() %></td>
			<td><%=ivo.getPosition() %></td>
			<td><%=ivo.getDuty() %></td>
			<td><%=ivo.getPhone() %></td>
			<td><%=ivo.getDept() %></td>
		</tr>
		
		<% } %>

		<tr>
			<td colspan="6">
				<input type = "button" value = "확인" onClick = "goMain()">
				<input type = "button" value = "이름순으로 정렬" onClick = "sortByName()">
				<input type = "button" value = "사번순으로 정렬" onClick = "sortById()">
				<input type = "hidden" name = "sortBy">
				<input type = "hidden" name = "val" value ="<%=val%>">
				<input type = "hidden" name = "searchFlag" value ="<%=searchFlag%>">
			</td>
		</tr>
		
	</table>
</form>
	<script>
		function goMain() {

			location.href = "../index.jsp";
		}
		
		function sortByName() {
			var frm = sortFrm;
			frm.sortBy.value = 'name';
			frm.submit();
		}
		
		function sortById() {
			var frm = sortFrm;
			frm.sortBy.value = 'id';
			frm.submit();
		}
	</script>
</body>
</html>