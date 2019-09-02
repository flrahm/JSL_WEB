<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSL</title>
<script>
	function formcheck() {
		if (input.subject.value == "") {
			alert("제목을 입력하세요.");
			input.subject.focus();
			return;
		}
		if (input.contents.value == "") {
			alert("내용을 입력하세요.");
			input.contents.focus();
			return;
		}
		//alert("수정출력");
		input.action="notice?cmd=notice_modify_pro";
		input.submit();
	}
</script>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<form name="input" method="post">
		<input type="hidden" name="idx" value="${vo.idx}">
		<!-- idx를 hidden으로 지정하여 pro 클래스가 받을수있게 함. -->
		<br> <br>
		<table border="1"
			style="font-align: center; border-collapse: collapse;">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" style="width: 490px;"
					maxlength="100" value="${vo.subject}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="contents"
						style="width: 490px; height: 200px;" maxlength="4000">${vo.contents}
				</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="수정"
					onClick="formcheck();"> <input type="button" value="초기화"
					onClick="javascript:input.reset();"> <input type="button"
					value="수정취소" onClick="javascript:history.back();"></td>
			</tr>
		</table>
	</form>
	<%@include file="../include/footer.jsp"%>
</body>
</html>