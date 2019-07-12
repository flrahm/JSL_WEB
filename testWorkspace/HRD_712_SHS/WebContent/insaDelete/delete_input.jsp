<%@page import="net.hrdkorea.model.InsaVO"%>
<%@page import="net.hrdkorea.model.InsaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String isNewpage = request.getParameter("isNewpage");
	String id = request.getParameter("id");
	InsaVO ivo = new InsaVO(); 
	if(id != null){
		
		InsaDAO idao = InsaDAO.getInstance();
		ivo = idao.select_ByID(id);
			
		pageContext.setAttribute("ivo", ivo);
		
	}
	


	int deleteOk = 0;
	if(request.getAttribute("deleteOk") != null)
		deleteOk = (int)request.getAttribute("deleteOk");
	
	if(deleteOk == 1){
%>
<script>
alert('삭제 성공');
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
	<h1>인사관리 퇴사처리 화면</h1>

	<form name="deleteFrm" method="post">
		
		
		
		
		<table>
		<% 
		if(ivo.getId() == null && isNewpage != null && deleteOk != 1){ 	
		%>
		<tr>
			<td colspan="2"><p style="color: #c00">해당 사번에 맞는 사원이 없습니다</p></td>
		</tr>
		<%} %>
		
			<tr>
				<td>성명</td>
				<td><input type="text" name="name" value = "${ivo.name }"></td>
			</tr>

			<tr>
				<td>사원번호</td>
				<td><input type="text" name="id" value = "${ivo.id }" onkeypress="if(event.keyCode == 13){ frmSearch(); return; }"></td>
			</tr>

			
			<tr>
				<td colspan="2"> <input type="button" value="삭제"
					onclick="frmCheck()"> <input type="button" value="취소"
					onclick="goMain()"></td>
			</tr>

		</table>
		<input type="hidden" name = "isNewpage" value = "1">
	</form>
	<script>

		function frmSearch() {

			var frm = deleteFrm;
			frm.action = "delete_input.jsp";
			frm.submit();
		}

		function frmCheck() {
			var frm = deleteFrm;
			frm.action = "delete_input_pro.jsp";
			frm.submit();
		}

		function goMain() {

			location.href = "../index.jsp";
		}
	</script>
</body>
</html>