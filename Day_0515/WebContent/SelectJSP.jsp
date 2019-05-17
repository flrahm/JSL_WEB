<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method = "get" action = "SelectServlet">

<label for = "job"> 직업 </label>
<select id = "job" name = "job" size = "1">
<option value = ""> 직업을 선택하세요 </option>
<option value = "학생">학생</option>
<option value = "회사원">회사원</option>
<option value = "공무원">공무원</option>
<option value = "군인">군인</option>
</select>
<br><br>

<label for ="interest">관심사</label>
<select id = "interest" name = "interest" size = "5" multiple = "multiple">
<option value = "에스프레소"> 에스프레소</option>
<option value = "아메리카노"> 아메리카노</option>
<option value = "라떼"> 라떼</option>
<option value = "콜드브루"> 콜드브루</option>
<option value = "유자차"> 유자차</option>
<option value = "포도쥬스"> 포도쥬스</option>

</select>

<input type = "submit" value = "전송">
</form>


</body>
</html>