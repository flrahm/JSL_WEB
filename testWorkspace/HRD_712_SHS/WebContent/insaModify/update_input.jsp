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
	


	int updateOk = 0;
	if(request.getAttribute("updateOk") != null)
		updateOk = (int)request.getAttribute("updateOk");
	
	if(updateOk == 1){
%>
<script>
alert('수정 성공');
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
	<h1>인사관리 사원정보 변경 화면</h1>

	<form name="updateFrm" method="post">
		<table>
		
				<% 
		if(ivo.getId() == null && isNewpage != null && updateOk != 1){ 	
		%>
		<tr>
			<td colspan="2"><p style="color: #c00">해당 사번에 맞는 사원이 없습니다</p></td>
		</tr>
		<%} %>
			<tr>
				<td>성명</td>
				<td><input type="text" name="name" value = "${ivo.name }" ></td>
			</tr>

			<tr>
				<td>사원번호</td>
				<td><input type="text" name="id" value = "${ivo.id }" onkeypress="if(event.keyCode == 13){ frmSearch(); return; }"></td>
			</tr>

			<tr>
				<td>소속부서</td>
				<td><select name="dept">
						<option value="인사부" 
						<% if(ivo.getDept() != null && ivo.getDept().equals("인사부")){ %> 
						selected="selected"
						<%} %>
						>인사부</option>
						<option value="기획부"
						<% if(ivo.getDept() != null && ivo.getDept().equals("기획부")){ %> 
						selected="selected"
						<%} %>
						>기획부</option>
						<option value="홍보부"
						<% if(ivo.getDept() != null && ivo.getDept().equals("홍보부")){ %> 
						selected="selected"
						<%} %>
						>홍보부</option>
						<option value="영업부"
						<% if(ivo.getDept() != null && ivo.getDept().equals("영업부")){ %> 
						selected="selected"
						<%} %>
						>영업부</option>
						<option value="경리부"
						<% if(ivo.getDept() != null && ivo.getDept().equals("경리부")){ %> 
						selected="selected"
						<%} %>
						>경리부</option>
				</select></td>
			</tr>

			<tr>
				<td>직급</td>
				<td><select name="position">
						<option value="1"
						<% if(ivo.getPosition() != null && ivo.getPosition().equals("1")){ %> 
						selected="selected"
						<%} %>
						>1급</option>
						<option value="2"
						<% if(ivo.getPosition() != null && ivo.getPosition().equals("2")){ %> 
						selected="selected"
						<%} %>
						>2급</option>
						<option value="3"
						<% if(ivo.getPosition() != null && ivo.getPosition().equals("3")){ %> 
						selected="selected"
						<%} %>
						>3급</option>
						<option value="4"
						<% if(ivo.getPosition() != null && ivo.getPosition().equals("4")){ %> 
						selected="selected"
						<%} %>
						>4급</option>
				</select></td>
			</tr>

			<tr>
				<td>직책</td>
				<td><input type="text" name="duty" value = "${ivo.duty }"></td>
			</tr>

			<tr>
				<td>연락처</td>
				<td><input type="text" name="phone" value = "${ivo.phone }"></td>
			</tr>
			<tr>
				<td colspan="2"> <input type="button" value="수정"
					onclick="frmCheck()"> <input type="button" value="취소"
					onclick="goMain()"></td>
			</tr>

		</table>
		<input type="hidden" name = "isNewpage" value = "1">
	</form>
	
	<script src="../inputFrmValidation.js"></script>
	<script>
		
	
		function frmSearch() {

			var frm = updateFrm;
			frm.action = "update_input.jsp";
			frm.submit();
		}

		function frmCheck() {
			var frm = updateFrm;
			
			if(inputFrmValidation(frm) == false )
				return false;
			
			frm.action = "update_input_pro.jsp";
			frm.submit();
		}

		function goMain() {

			location.href = "../index.jsp";
		}
	</script>
</body>
</html>