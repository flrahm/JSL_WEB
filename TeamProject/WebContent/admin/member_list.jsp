<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>회원목록 보여주기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<STYLE TYPE="text/css">
<!--
body { font-family: 돋움, Verdana; font-size: 9pt}
td   { font-family: 돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000} 
--->
</STYLE>
</head>

<script>

	function onSubmit(){
		memberlist.submit();
	}

</script>


<body>

<jsp:include page="top_menu.jsp" flush="true" />

<table width="800" border="1" cellspacing="0" cellpadding="2" bordercolorlight="#173E7C" bordercolordark="white">
  
  
  
  <tr>
    <td width=50 align=center>번호</td>
    <td width=100 align=center>ID</td>
    <td width=100 align=center>이름</td>
    <td width=400 align=center>주소</td>
    <td width=150 align=center>전화번호</td>
    <td width=200 align=center>이메일</td>
    <td width=150 align=center>가입일자</td>
    <td width=150 align=center>최근접속일자</td>
    <td width=100 align=center>삭제여부</td>
    
  </tr>
  <c:if test="${list.size()!=0 }">
  <c:forEach var="member" items="${list }">
   <tr>
      <td align=center>${member.idx }</td>
      <td align=center>${member.userid }</td>
      <td align=center><a href = "adminmemberview.do?idx=${member.idx }">${member.name }</a></td>
      <td width=300>${member.addr1 } ${member.addr2 } ${member.zipcode }(${member.gubun })</td>
      <td align=center>${member.tel }</td>
      <td align=center>${member.email }</td>
      <td align=center>${member.first_time }</td>
      <td align=center>${member.last_time }</td>
      <td align=center><a href = "adminmemberdelete.do?idx=${member.idx }">[삭제]</a></td>
   </tr>
   </c:forEach>
</c:if>
<c:if test="${list.size()==0 }">
	<tr>
      <td align=center colspan="9">해당항목이 없습니다.</td>
   </tr>
</c:if>
</table>
<form name = "memberlist" method = "post" action = "adminmembersearch.do">
<table width=550>
  <tr>
    <td>
      <select name="search">
        <option value="name">이름 </option>
        <option value="addr1">주소 </option>
        
    </td>
    <td>  찾는이름:
          <input type="text" name="search_name" size=10> &nbsp;
          <input type=hidden name="user_id" ><a href = "#" onClick = "onSubmit()">[조회]</a>
     </td>
   </tr>
</table>
</form>    
</body>
</html>
