<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSL</title>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<br>
	<br>
	<table class="tbl">
		<colgroup>
			<col width="30%">
			<col width="70%">
		</colgroup>
		<tr>
			<th>번호</th>
			<th>제목</th>
		</tr>
		<c:if test="${list.size()==0}">
			<!-- 공지사항 전체 리스트가 없을 때 -->
			<tr>
				<td colspan="3">공지사항이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${list.size()!=0}">
			<!-- 공지사항 전체 리스트가 있을 때 -->			
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.idx}</td>
					<td><a href="notice?cmd=notice_view&idx=${list.idx}&page=${nowpage}">${list.subject}</a></td>
				</tr>
			</c:forEach>
		</c:if>
		<tr>
		<td colspan="3">${pageSkip}</td>
		</tr>
		<tr>
		<td colspan="3">
		<c:if test="${not empty session && session=='admin1'}">
		<input type="button" value="글쓰기"
		onClick="javascript:location.href='notice?cmd=notice_write'">
		</c:if>
		</td>
		</tr>
	</table>

	<%@include file="../include/footer.jsp"%>
</body>
</html>