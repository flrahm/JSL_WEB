<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSL</title>
<script>
	function delcheck() {
		if (confirm("삭제하시겠습니까?") == true) {
			location.href = "notice?cmd=notice_delete&idx=${vo.idx}";
		} else {
			alert("삭제취소");
			return;
		}
	}
</script>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<br>
	<br>
	<table class="tbl">
		<colgroup>
			<col width="10%">
			<col width="90%">
		</colgroup>
		<tr>
			<th>제목</th>
			<td>${vo.subject}</td>
		</tr>
		<tr>
			<th>등록일자</th>
			<td>${vo.indate}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td style="text-align: left;"><pre>${vo.contents}</pre></td>
		</tr>
	</table>
	<div class="tbl">
	<c:if test="${not empty session && session=='admin1'}">
	<input type="button" value="수정"
		onClick="javascript:location.href='notice?cmd=notice_modify&idx=${vo.idx}'">
	<input type="button" value="삭제" onClick="delcheck()">
	</c:if>
	<input type="button" value="목록"
		onClick="javascript:location.href='notice?cmd=notice&page=${page}'">
		</div>
	<%@include file="../include/footer.jsp"%>
</body>
</html>