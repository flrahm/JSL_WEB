<%@page import="java.time.LocalDate"%>
<%@page import="dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	memberDAO mdao = memberDAO.getInstacne();
	int custno = mdao.getcustno();
	pageContext.setAttribute("regcustno", custno+1);
	
	LocalDate date = LocalDate.now();
	String year = "" + date.getYear();
	String month = "";
	
	if(date.getMonthValue()<10)
		month+= "0";
	month += date.getMonthValue();
	
	String day = "";
	if(date.getDayOfMonth() < 10)
		day += "0";
	day += date.getDayOfMonth();
		
	String dateStr = year + month + day;
	pageContext.setAttribute("date", dateStr);

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

 			if (insertFrm.custname.value == "") {
				alert('회원 성명을 입력하세요');
				insertFrm.custname.focus();
				return false;
			} 

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





	<h2>홈쇼핑 회원 등록</h2>


	<form id = "insertFrm" name="insertFrm" method="post" action="regmember_pro.jsp" >
		<table>
			<tr>
				<td>회원번호(자동발생)</td>
				<td><input type="text" name="custno" value="${pageScope.regcustno }" readonly></td>
			</tr>

			<tr>
				<td>회원 성명</td>
				<td><input type="text" name="custname"></td>
			</tr>

			<tr>
				<td>회원 전화</td>
				<td><input type="text" name="phone"></td>
			</tr>

			<tr>
				<td>회원 주소</td>
				<td><input type="text" name="address"></td>
			</tr>

			<tr>
				<td>가입 일자</td>
				<td><input type="text" name="joindate" value="${date }"
					readonly></td>
			</tr>

			<tr>
				<td>고객등급</td>
				<td><input type="text" name="grade"></td>
			</tr>

			<tr>
				<td>도시코드</td>
				<td><input type="text" name="city"></td>
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