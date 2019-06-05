<%@page import="member.vo.MemberVO"%>
<%@page import="member.dao.MemberManager"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String inputId = request.getParameter("userid");
	String inputPw = request.getParameter("passwd");
	
	MemberManager manager = MemberManager.getInstance();
	int flag = manager.userLogin(inputId, inputPw);
	//-1 0  1 : 로그인 성공
	
	 if(flag != 1){
		response.sendRedirect("userlogin_form.jsp?flag="+flag);
	}else{
		// 로그인 성공 
		MemberVO mvo = manager.selectMemberById(inputId);
		pageContext.setAttribute("mvo", mvo);
		manager.updateLastTime(""+mvo.getIdx());
		
		session.setAttribute("loginIdx", mvo.getIdx());
		session.setAttribute("loginId", mvo.getUserid());
		session.setAttribute("loginName", mvo.getName());
	} 

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
        ${sessionScope.loginName }  님 환영합니다.<br><br>
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
      <a href = "userinfo_modify.jsp">[자기정보수정]</a>
      <a href = "logout.jsp">[로그아웃]</a>
	<a href = "userinfo_list.jsp">[리스트로 이동]</a>
	</td>
  </tr>
</table>

</BODY>
</HTML>