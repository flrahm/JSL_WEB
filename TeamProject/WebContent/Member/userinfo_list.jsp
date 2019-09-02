<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib  prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
<script>
function check() {
	if(input.search_name.value == "") {
		alert("검색어를 입력해주세요");
		input.search_name.focus();
		return;
	}
	input.submit();
}

</script>
<body>

<jsp:include page = "/include/topmenu.jsp"></jsp:include>

<table width="550" border="1" cellspacing="0" cellpadding="2" bordercolorlight="#173E7C" bordercolordark="white">
  <tr>
    <td width=50 align=center>번호</td>
    <td width=50 align=center>ID</td>
    <td width=80 align=center>이름</td>
    <td width=100 align=center>전화번호</td>
    <td width=100 align=center>등록일자</td>
    <td width=100 align=center>최근접속일</td>
    
  </tr>
<c:if test ="${search != 1 }">
 <c:forEach var = "sList" items = "${sList}"> 
   <tr>
      <td align=center>${sList.idx}</td>
      <td align=center>${sList.userid }</td>
      <td align=center>${sList.name }</td>
      <td align=center>${sList.tel }</td>
      <td align=center>${sList.first_time }</td>
      <td align=center>${sList.last_time }</td>
   </tr>
   </c:forEach>
  </c:if>
  
  <c:if test = "${search == 1 }">
  <c:forEach var ="sList" items = "${mList }">
  <tr>
      <td align=center>${sList.idx}</td>
      <td align=center>${sList.userid }</td>
      <td align=center>${sList.name }</td>
      <td align=center>${sList.tel }</td>
      <td align=center>${sList.first_time }</td>
      <td align=center>${sList.last_time }</td>
   </tr>
   </c:forEach>
  </c:if>
</table>
<table width=550>
  <tr>
    <td>
    <form name = "input" action = "ListSearch" method = "post">
      <select name="gubun">
        <option value = "name">이름 </option>
        <option value = "addr">주소 </option>
        </select>
        
    </td>
    <td>  찾는이름:
          <input type="text" name="search_name" size=10> &nbsp;          
          <input type=hidden name="user_id" ><a href = "#" onClick = "check()">[조회]</a>
     </td>
    </form> 
   </tr>
  <tr>
    <td>
    </td>
    <td></td>
   </tr>
  <tr>
    <td><a href = "userloginform.do">로그인 페이지 이동</a>
    </td>
    <td><a href = "userinfoinsert.do">회원가입페이지 이동</a></td>
   </tr>
</table>    

<jsp:include page="/include/copyright.jsp"></jsp:include>

</body>
</html>
