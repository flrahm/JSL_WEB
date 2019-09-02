<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>관리자목록 보여주기</title>
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
		adminlist.submit();
	}

</script>


<body>

<jsp:include page="top_menu.jsp" flush="true" />

<table width="800" border="1" cellspacing="0" cellpadding="2" bordercolorlight="#173E7C" bordercolordark="white">
  
  
  
  <tr>
    <td width=100 align=center>ID</td>
    <td width=150 align=center>등록일자</td>
    <td width=150 align=center>등급</td>
    <td width=150 align=center>삭제</td>
    
  </tr>
  <c:if test="${list.size()!=0 }">
  <c:forEach var="admin" items="${list }">
   <tr>
      <td align=center><a href = "adminview.do?num=${admin.num }">${admin.adminid }</a></td>
      <td align=center>${admin.indate }</td>
      <td align=center>${admin.rate }</td>
      <td align=center><a href = "admindelete.do?num=${admin.num }">[삭제]</a></td>
   </tr>
   </c:forEach>
</c:if>
  <c:if test="${list.size()==0 }">
   <tr>
      <td align=center colspan="4"><a href = "adminview.do">등록된 관리자가 없습니다.</a></td>
   </tr>
</c:if>
</table>
<form name = "adminlist" method = "post" action = "adminsearch.do">
<table width=550>
  <tr>
    <td>
      <select name="search">
        <option value="adminid">아이디 </option>
        <option value="rate">등급 </option>
        </select>
    </td>
    <td>  찾는이름:
          <input type="text" name="search_name" size=10> &nbsp;
          <input type=hidden name="user_id" ><a href = "#" onClick = "onSubmit()">[조회]</a>
          <a href = "adminwrite.do">[등록]</a>
     </td>
   </tr>
</table>
</form>    
</body>
</html>
