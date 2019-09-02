<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${row==0}">
	<script>
		alert("요청 실패.\n데이터를 재확인하세요");
		history.back();
	</script>
</c:if>
<c:if test="${row!=0}">
	<script>
		alert("요청 완료.\n메인으로 돌아갑니다.");
		location.href = "admin?cmd=admin_member_list";
	</script>
</c:if>