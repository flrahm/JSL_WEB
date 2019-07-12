<%@page import="vo.SalesVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	memberDAO mdao  =memberDAO.getInstacne();
	List<SalesVO> slist = mdao.getAllSales();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	<jsp:include page="include/nav.jsp"></jsp:include>

	<h2>회원 매출 조회</h2>

	<table>
		<tr>
			<td>회원번호</td>
			<td>회원성명</td>
			<td>고객등급</td>
			<td>매출</td>
		</tr>


		<% for(int i = 0; i < slist.size() ; i++) {
		SalesVO svo = slist.get(i);
	%>
		<tr>
			<td><%=svo.getCustno() %></td>
			<td><%=svo.getCustname() %></td>
			<td><%=svo.getGrade() %></td>
			<td><%=svo.getSalessum() %></td>
		</tr>
		<%
}
%>

	</table>




	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>