<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSL</title>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<br>
	<br>
	이용자별 권한 보기
	<table border="1"
		style="line-collapse: collapse; width: 900px; text-align: center;">
		<colgroup>
			<col width=15%>
			<col width=15%>
			<col width=40%>
			<col width=20%>
			<col width=10%>
		</colgroup>
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>등급</th>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.memberid}</td>
				<td><a href="admin?cmd=admin_member_modify&memberid='${list.memberid}'">${list.membername}</a></td>
				<td>${list.email}</td>
				<td>${list.phone}</td>
				<td>${list.grade}</td>
			</tr>
		</c:forEach>
	</table>
	권한을 수정하려면 id를 클릭하세요.
	<%@include file="../include/footer.jsp"%>
</body>
</html>