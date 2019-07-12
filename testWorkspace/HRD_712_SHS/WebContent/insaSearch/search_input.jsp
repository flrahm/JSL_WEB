<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>인사관리 조회 화면</h1>

<h2>인사관리 조회</h2>

<form name = "searchFrm" method="post" action="search_input_pro.jsp">
	<table>
	<tr>
		<td rowspan="2" colspan="2"> <input type="radio" name="searchFlag" value = "byId" checked="checked" ><br>
		<input type="radio" name="searchFlag" value = "byDept">
		</td>

		<td>사원 번호로 조회</td>
		<td><input type="text" name = "id"></td>
	</tr>
	<tr>
		<td>부서명으로 조회</td>
		<td>
		<select name = "dept">
			<option value = "인사부">인사부</option>
			<option value = "기획부">기획부</option>
			<option value = "홍보부">홍보부</option>
			<option value = "영업부">영업부</option>
			<option value = "경리부">경리부</option>
		</select>
		</td>
	</tr>	
	
	<tr>
		<td colspan="3">
		<input type = "submit" value = "조회" onClick = "return frmCheck();">
		<input type = "button" value = "취소" onClick = "goMain()">
		 </td>
	</tr>
	</table>
</form>



<script>
	function frmCheck(){
		var frm = searchFrm;
		
		if(frm.searchFlag.value == "byId" && frm.id.value == ""){
			frm.id.placeholder = "값을 입력하세요";
			return false;
		}
		
		return true;
	}
	
	function goMain(){
		
		location.href = "../index.jsp";
	}

</script>
</body>
</html>