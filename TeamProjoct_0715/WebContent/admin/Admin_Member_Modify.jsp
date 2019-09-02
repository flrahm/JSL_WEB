<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSL</title>
<script>
	function formcheck() {
		if (confirm("권한을 수정하시겠습니까?") == true) {
			input.action = "admin?cmd=admin_member_modify_pro";
			input.submit();
		} else {
			return;
		}
	}
</script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	권한설정 변경
	<br>
	<br>
	<form name="input" method="post">
	<input type="hidden" name="memberid" value="${memberid}">
		<table>
			<tr>
				<th>권한</th>
				<td><select name="grade">
						<option value="A" <c:if test="${grade=='A'}">selected</c:if>>교수</option>
						<option value="B" <c:if test="${grade=='B'}">selected</c:if>>대학원생</option>
						<option value="C" <c:if test="${grade=='C'}">selected</c:if>>학부생</option>
						<option value="D" <c:if test="${grade=='D'}">selected</c:if>>지역주민</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="button" value="수정" onClick="formcheck();">
				</td>
				<td><input type="button" value="돌아가기"
					onClick="javascript:location.href='admin?cmd=admin_member_list'">
				</td>
			</tr>
		</table>
	</form>
	<%@include file="../include/footer.jsp"%>
</body>
</html>