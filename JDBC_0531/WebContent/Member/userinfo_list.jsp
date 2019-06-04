<%@page import="member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="member.dao.MemberManager"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	MemberManager manager = MemberManager.getInstance();
	List<MemberVO> mList = manager.selectAllMember();
	pageContext.setAttribute("mList", mList);
	
%>
<html>
<head>
<title>회원목록 보여주기</title>

<STYLE TYPE="text/css">
<!--
body { font-family: 돋움, Verdana; font-size: 9pt}
td   { font-family: 돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000} 
--->
</STYLE>
</head>
<body>
<c:if test="${not empty sessionScope.loginName }">
${sessionScope.loginName } 님 환영합니다 &nbsp;&nbsp; <A href = "logout.jsp">로그아웃</A><br>
</c:if>

<c:if test="${empty sessionScope.loginName }">
<a href = "userlogin_form.jsp">로그인</a><br>
</c:if>
<table width="550" border="1" cellspacing="0" cellpadding="2" bordercolorlight="#173E7C" bordercolordark="white">
  <tr>
    <td width=50 align=center>ID</td>
    <td width=80 align=center>이름</td>
    <td width=120 align=center>주소</td>
    <td width=100 align=center>생년월일</td>
    <td width=100 align=center>전화번호</td>
    <td width=100 align=center>직업</td>
    <td width=100 align=center>삭제여부</td>
    
  </tr>
  
  <c:forEach var="mvo" items="${mList }">
   <tr>
      <td align=center><a href = "userinfo_modify.jsp?idx=${mvo.idx }">${mvo.userid }</a></td>
      <td align=center>${mvo.name }</td>
      <td width=300>${mvo.addr1 }&nbsp; ${mvo.addr2 }&nbsp;( ${mvo.zipcode } )</td>
      <td align=center>921025</td>
      <td align=center>${mvo.tel }</td>
      <td align=center>${mvo.job }</td>
      <td align=center>[삭제]</td>
   </tr>
</c:forEach>

</table>
<table width=550>
  <tr>
    <td>
      <select name="search_gubun">
        <option >이름 </option>
        <option >주소 </option>
        
    </td>
    <td>  찾는이름:
          <input type="text" name="search_name" size=10> &nbsp;
          <input type=hidden name="user_id" >[조회]</a>
     </td>
   </tr>
</table>    

</body>
</html>
