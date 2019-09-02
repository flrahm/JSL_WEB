<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSL</title>
<script>
	function formcheck() {
		if (input.memberid.value == "") {
			alert("ID를 입력하시오.");
			input.memberid.focus();
			return;
		}
		if (input.memberpasswd.value == "") {
			alert("비밀번호를 입력하시오.");
			input.memberpasswd.focus();
			return;
		}
		input.action="member?cmd=member_login_pro";
		input.submit();
	}
</script>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<br>
	<br>
	<form name="input" method="post">
		<table style="width: 400px" border="1">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<th>ID</th>
				<td><input type="text" name="memberid" style="width: 320px;"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="memberpasswd" style="width: 320px;"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="로그인" onClick="formcheck();">
					<input type="button" value="이전으로" onClick="javascript:history.back();">
				</td>
			</tr>
		</table>
	</form>
	<%@include file="../include/footer.jsp"%>
</body>
</html>