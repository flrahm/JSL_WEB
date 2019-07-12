<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>인사 관리 시스템</h1>

<h2>인사 관리 메인 메뉴</h2>

<input type="button" value = "조회" onClick = "goList()">
<input type="button" value = "사원등록" onClick = "goInsert()">
<input type="button" value = "정보변경" onClick = "goModify()">
<input type="button" value = "퇴사처리" onClick = "goDelete()">
<input type="button" value = "종료" onClick = "goExit()">



<script>
	function goList(){
		
		location.href= "insaSearch/search_input.jsp";
	}
	
	function goInsert(){
		location.href="insaInsert/insert_input.jsp";
	}
	
	function goModify(){
		location.href="insaModify/update_input.jsp";
	}
	
	function goDelete(){
		location.href="insaDelete/delete_input.jsp";
	}
	
	function goExit(){
		window.close();
	}

</script>
</body>
</html>