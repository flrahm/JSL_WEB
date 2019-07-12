<%@page import="vo.ProductVO"%>
<%@page import="vo.GroupcodeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	List<GroupcodeVO> list = (List<GroupcodeVO>) request.getAttribute("gcodeList");
	ProductVO pvo = (ProductVO) request.getAttribute("pvo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>생산관리 등록 화면</h3>
	<form name="insertFrm" method="post">
		<table>
			<tr>
				<td>제품 코드</td>
				<td><input type="text" name="code" <%if (pvo != null) {%>
					value="<%=pvo.getCode()%>" <%}%>></td>
			</tr>

			<tr>
				<td>제품 이름</td>
				<td><input type="text" name="pname" <%if (pvo != null) {%>
					value="<%=pvo.getPname()%>" <%}%>></td>
			</tr>

			<tr>
				<td>제품 원가</td>
				<td><input type="text" name="cost" <%if (pvo != null) {%>
					value="<%=pvo.getCost()%>" <%}%>></td>
			</tr>

			<tr>
				<td>목표 수량</td>
				<td><input type="text" name="pnum" <%if (pvo != null) {%>
					value="<%=pvo.getPnum()%>" <%}%>></td>
			</tr>

			<tr>
				<td>재고 수량</td>
				<td><input type="text" name="jnum" <%if (pvo != null) {%>
					value="<%=pvo.getJnum()%>" <%}%>></td>
			</tr>

			<tr>
				<td>출고가</td>
				<td><input type="text" name="sale" <%if (pvo != null) {%>
					value="<%=pvo.getSale()%>" <%}%>></td>
			</tr>
			<option value='A'>컴퓨터</option>
			<tr>
				<td>그룹이름</td>
				<td><select name="gcode">
						<%
							for (int i = 0; i < list.size(); i++) {
								GroupcodeVO gvo = list.get(i);
						%>

						<option value="<%=gvo.getGcode()%>"
							<%if (pvo != null && gvo.getGcode().equals(pvo.getGcode())) {%>
							selected <%}%>>
							<%=gvo.getGname()%>
						</option>

						<%
							}
						%>

				</select></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="조회"
					onclick="return frmSearch();"> <input type="submit"
					value="수정" onclick="return frmModify();"> <input
					type="submit" value="삭제" onclick="return frmDelete();"><input
					type="button" value="메인으로" onclick="return toMain();"></td>
			</tr>
		</table>
	</form>

	<script src="InputFrmCheck.js">
	</script>

	<script>
		function frmSearch() {

			insertFrm.action = "pm?cmd=pd_search";
			
			if(searchFrmValidation(insertFrm) == false)
				return false;
			
			
			insertFrm.submit();
		}

		function frmModify() {

			insertFrm.action = "pm?cmd=pd_modify";
			
			if(insertFrmValidation(insertFrm) == false)
				return false;
			
			insertFrm.submit();
		}
		function frmDelete() {

			insertFrm.action = "pm?cmd=pd_delete";
			insertFrm.submit();
		}

		function toMain() {
			location.href = "pm?cmd=goMain";
		}
	</script>

</body>
</html>