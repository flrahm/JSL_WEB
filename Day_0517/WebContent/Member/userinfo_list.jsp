<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String name = request.getParameter("name");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String job = request.getParameter("job");

	
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
<script>
	function detail_info(){
		alert("이름 : " + frm.name.value + "\n" + "아이디 : " + frm.userid.value);
		
		alert("<%=name %>");
	}


</script>
</head>
<body>
<table width="550" border="1" cellspacing="0" cellpadding="2" bordercolorlight="#173E7C" bordercolordark="white">
  <tr>
    <td width=50 align=center>ID</td>
    <td width=80 align=center>이름</td>
    <td width=120 align=center>주소</td>
    <td width=100 align=center>이메일</td>
    <td width=100 align=center>전화번호</td>
    <td width=100 align=center>직업</td>
    <td width=100 align=center>삭제여부</td>
    
  </tr>
   <tr>
      <td align=center>ein1027</td>
      <td align=center>홍길동</td>
      <td width=300>대전광역시 중구 도마동 114(집)</td>
      <td align=center>1234@gmail.com</td>
      <td align=center>042-222-1111</td>
      <td align=center>의사</td>
      <td align=center>[삭제]</td>
   </tr>

   <tr>
   		<form name = frm>
   			<input type = "hidden" name = "name" value = <%=name %>>
   			<input type = "hidden" name = "userid" value = <%=userid %>>
   		</form>
   
      <td align=center><%=userid %></td>
      <td align=center><a href = "#" onClick = detail_info()> <%=name %></a></td>
      <td width=300><%=addr1 %><%=addr2 %></td>
      <td align=center><%=email %></td>
      <td align=center><%=tel %></td>
      <td align=center><%=job %></td>
      <td align=center>[삭제]</td>
   </tr>

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
          <input type=hidden name="user_id" >[조회] 
          <a href = "userinfo_insert.jsp">[회원가입]</a>
     </td>
   </tr>
</table>    
</body>
</html>
