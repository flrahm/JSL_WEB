<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${row==1}">
	<script>
		alert("${bookname} 대여 완료");
		location.href = "booklist?cmd=booklist&nowpage=${nowpage}";
	</script>
</c:if>

<c:if test="${row!=1}">
	<script>
		alert("대여 실패");
		history.back();
	</script>
</c:if>