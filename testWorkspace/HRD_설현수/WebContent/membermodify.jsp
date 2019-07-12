<%@page import="dao.memberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String custno = request.getParameter("custno");
	memberDAO mdao = memberDAO.getInstacne();
	MemberVO mvo = mdao.getByCustno(custno);
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

<script>
		function goMemberList(){
			location.href = "memberlist.jsp";
		}
	
		function frmCheck() {

			if (insertFrm.phone.value == "") {
				alert('전화번호를 입력하세요');
				insertFrm.phone.focus();
				return false;
			}

			if (insertFrm.address.value == "") {
				alert('주소를 입력하세요');
				insertFrm.address.focus();
				return false;
			}

			if (insertFrm.grade.value == "") {
				alert('회원 등급을 입력하세요');
				insertFrm.grade.focus();
				return false;
			}

			if (insertFrm.city.value == "") {
				alert('도시코드를 입력하세요');
				insertFrm.city.focus();
				return false;
			}
			 
		 return true;
		

		}
	</script>


	<h2>홈쇼핑 회원 정보 수정</h2>


	<form id = "insertFrm" name="insertFrm" method="post" action="membermodify_pro.jsp" >
		<table>
			<tr>
				<td>회원번호</td>
				<td><input type="text" name="custno" value="<%=mvo.getCustno() %>" readonly></td>
			</tr>

			<tr>
				<td>회원 성명</td>
				<td><input type="text" name="custname" value = "<%=mvo.getCustname() %>" readonly></td>
			</tr>

			<tr>
				<td>회원 전화</td>
				<td><input type="text" name="phone" value = "<%=mvo.getPhone()%>"></td>
			</tr>

			<tr>
				<td>회원 주소</td>
				<td><input type="text" name="address" value = "<%=mvo.getAddress()%>"></td>
			</tr>

			<tr>
				<td>가입 일자</td>
				<td><input type="text" name="joindate" value="<%=mvo.getJoindate().substring(0,11) %>"
					readonly></td>
			</tr>

			<tr>
				<td>고객등급</td>
				<td><input type="text" name="grade" value = "<%=mvo.getGrade() %>"></td>
			</tr>

			<tr>
				<td>도시코드</td>
				<td><input type="text" name="city" value = "<%=mvo.getCity() %>"></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="등록"
					onclick="return frmCheck();"> &nbsp;&nbsp;&nbsp;<input type="button" value="조회"
					onclick="goMemberList();"></td>
			</tr>

		</table>
	</form>






<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>