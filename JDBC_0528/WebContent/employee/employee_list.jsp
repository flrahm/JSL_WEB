<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<table border = "1">
	<tr>
		<td>eno</td>
		<td>ename</td>
		<td>job</td>
		<td>manager</td>
		<td>hiredate</td>
		<td>salary</td>
		<td>commission</td>
		<td>dno</td>
	</tr>


<c:forEach var="empVO" items="${empList }">
	<tr>
		<td>${empVO.eno }</td>
		<td>${empVO.ename }</td>
		<td>${empVO.job }</td>
		<td>${empVO.manager }</td>
		<td>${empVO.hiredate }</td>
		<td>${empVO.salary }</td>
		<td>${empVO.commission }</td>
		<td>${empVO.dno }</td>
	</tr>
</c:forEach>


</table>



</body>
</html>