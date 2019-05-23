<%@ page contentType="text/html; charset=UTF-8" %>
<%
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("passwd");
	
	// DB 접속
	int row = 0;	// 0이면 아이디없음, 1이면 비밀번호 틀림, 2면 로그인
	String id = "shss2216";
	String pw = "123123";
	String name = "SEOL";
	
	if(userid.equals(id)){
		if(userpw.equals(pw))
			row = 2;
		else
			row = 1;
	}else
		row = 0;
	
	if(row == 2){
		session.setAttribute("user", name);
		session.setMaxInactiveInterval(60*30);
%>
<HTML>

<TITLE>본 사이트에 오신 것을 환영합니다..</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<STYLE TYPE="text/css">
<!--
body { font-family: 돋움, Verdana; font-size: 9pt}
td   { font-family: 돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000} 
-->
</STYLE>
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src=./img/h_b02.gif></td>
    <td align=center><FONT COLOR="#FFFFFF"><b>로그인 성공</b></FONT></td>
    <td align=right><img src=./img/f_b03.gif></td>
  </tr>
</table>
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
<TR BGCOLOR=#948DCF>
  <TD>
    <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0 WIDTH=330>
  	  <TR BGCOLOR="#FFFFFF">
        <TD ALIGN="center">
          <%=name %>님 환영합니다.<br><br>
        </TD>
      </TR>
    </TABLE>
 </TD>
</TR>
</TABLE>

<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src=./img/h_b04.gif></td>
    <td align=right><img src=./img/h_b05.gif></td>
  </tr>
</table>

<br><br>
<table cellpadding=0 cellspacing=0 border=0 width=330>
  <tr>
    <td align="center">
      [자기정보수정]
    <a href = "userinfo_list.jsp">[회원보기]</a>

	</td>
  </tr>
</table>

</BODY>
</HTML>
<%
	}else{
%>
<script>
	alert("ID 또는 비밀번호가 틀렸습니다");
	history.back();
</script>
<%
	}
%>