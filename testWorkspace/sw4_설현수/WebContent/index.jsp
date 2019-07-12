<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>생산 관리 시스템</h1>
<h3>생산 관리 메인 메뉴</h3>


<input type="button" value = "제품입력" onclick="pd_input()">
<input type="button" value = "제품조회" onclick="pd_list()">
<input type="button" value = "우선생산제품" onclick="pri_list()">
<input type="button" value = "이익순위" onclick="p_rank()">
<input type="button" value = "그룹별 재고수량" onclick="stuck_byG()">

<script>
	function pd_input(){
		location.href = "pm?cmd=pd_goInput";
	}
	
	function pd_list(){
		location.href = "pm?cmd=pd_view";
	}
	
	function pri_list(){
		location.href = "pm?cmd=pri_list";
	}
	
	function p_rank(){
		location.href = "pm?cmd=p_rank";
	}
	
	function stuck_byG(){
		location.href = "pm?cmd=stuck_byG";
	}
</script>
</body>
</html>