<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	memberDAO mdao = memberDAO.getInstacne();
	List<MemberVO> mlist = mdao.getAllList();
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


	<h2>회원목록 조회/수정</h2>

	<table>
		<tr>
			<td>회원번호</td>

			<td>회원성명</td>

			<td>전화번호</td>

			<td>주소</td>

			<td>가입일자</td>

			<td>고객등급</td>

			<td>거주지역</td>
		</tr>



		<%
			for (int i = 0; i < mlist.size(); i++) {
				MemberVO mvo = mlist.get(i);
		%>
		<tr>
			<td><a href = "membermodify.jsp?custno=<%=mvo.getCustno()%>"><%=mvo.getCustno()%></a></td>

			<td><%=mvo.getCustname()%></td>

			<td><%=mvo.getPhone()%></td>

			<td><%=mvo.getAddress()%></td>

			<td><%=mvo.getJoindate().substring(0,11)%></td>

			<td><%=mvo.getGrade()%></td>
			<td><%=mvo.getCity()%></td>
		</tr>
		<%
			}
		%>
	</table>







	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>