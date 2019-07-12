<%@page import="vo.GroupcodeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<GroupcodeVO> list = (List<GroupcodeVO>) request.getAttribute("gcodeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>생산관리 등록 화면</h3>
	<form name = "insertFrm" method="post" >
		<table>
			<tr>
				<td>제품 코드</td>
				<td><input type="text" name="code" ></td>
			</tr>

			<tr>
				<td>제품 이름</td>
				<td><input type="text" name="pname"></td>
			</tr>

			<tr>
				<td>제품 원가</td>
				<td><input type="text" name="cost"></td>
			</tr>

			<tr>
				<td>목표 수량</td>
				<td><input type="text" name="pnum"></td>
			</tr>

			<tr>
				<td>재고 수량</td>
				<td><input type="text" name="jnum"></td>
			</tr>

			<tr>
				<td>출고가</td>
				<td><input type="text" name="sale"></td>
			</tr>

			<tr>
				<td>그룹이름</td>
				<td><select name="gcode">
						<%
							for (int i = 0; i < list.size(); i++) {
								GroupcodeVO gvo = list.get(i);
						%>

						<option value="<%=gvo.getGcode() %>" > <%=gvo.getGname() %> </option>

							<%
								}
							%>
						
				</select></td>
			</tr>
			
			<tr>
			<td colspan="2"> <input type ="submit" value = "등록" onclick = "return frmCheck();" > 
			<input type ="button" value = "메인으로" onclick = "return toMain();" >
			
			</td>
			
			</tr>
		</table>
	</form>
	
	
	
	<script type="text/javascript" src="InputFrmCheck.js"></script>
	
	<script>
	
		function frmCheck(){
			
			if(insertFrmValidation(insertFrm) == false){
				return false;
			}
			
			insertFrm.action = "pm?cmd=pd_input";
			insertFrm.submit();
		}
		
		function toMain(){
			location.href = "pm?cmd=goMain";
		}
	
	</script>
	
</body>
</html>