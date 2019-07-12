<%@page import="net.hrdkorea.model.InsaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	InsaDAO idao = InsaDAO.getInstance();
	String idval = idao.idGenerate();
	
	int insertOk = 0;
	if(request.getAttribute("insertOk") != null)
		insertOk = (int)request.getAttribute("insertOk");
	
	if(insertOk == 1){
%>
<script>
alert('등록 성공');
</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>인사관리 등록화면</h1>

	<form name = "insertFrm" method="post" action = "insert_input_pro.jsp">
		<table>
			<tr>
				<td>성명</td>
				<td><input type="text" name="name"></td>
			</tr>

			<tr>
				<td>사원번호</td>
				<td><input type="text" name="id" value = "<%=idval %>" readonly="readonly"></td>
			</tr>

			<tr>
				<td>소속부서</td>
				<td><select name="dept">
						<option value="인사부">인사부</option>
						<option value="기획부">기획부</option>
						<option value="홍보부">홍보부</option>
						<option value="영업부">영업부</option>
						<option value="경리부">경리부</option>
				</select></td>
			</tr>

			<tr>
				<td>직급</td>
				<td><select name="position">
						<option value="1">1급</option>
						<option value="2">2급</option>
						<option value="3">3급</option>
						<option value="4">4급</option>
				</select></td>
			</tr>

			<tr>
				<td>직책</td>
				<td><input type="text" name="duty"></td>
			</tr>

			<tr>
				<td>연락처</td>
				<td><input type="text" name="phone"></td>
			</tr>
		<tr>
		<td colspan="2">
		<input type = "button" value = "등록" onclick = "frmCheck()">
		<input type = "button" value = "취소" onclick = "goMain()">
		</td>
		</tr>
		
		</table>
	</form>
	
	<script src="../inputFrmValidation.js"></script>
	
	<script>
		function frmCheck(){
			var frm = insertFrm;
			
			if(inputFrmValidation(frm) == false )
				return false;
			
			frm.submit();
		}
		
		function goMain(){
			
			location.href = "../index.jsp";
		}
	</script>
</body>
</html>