<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${row != 0}">
	<script>
		alert("등록되었습니다.");
		location.href="/SampleProject1/guestlist.do";
	</script>
</c:if>
<c:if test="${row == 0}">
	<script>
		alert("오류발생");
		history.back();
	</script>
</c:if>
