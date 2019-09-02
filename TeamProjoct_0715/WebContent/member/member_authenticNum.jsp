<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
<TITLE>인증번호를 체크합니다.</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<STYLE TYPE="text/css">
<!--
body { font-family: 돋움, Verdana; font-size: 9pt}
td   { font-family: 돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000} 
--->
</STYLE>

</HEAD>
<BODY bgcolor="#FFFFFF">
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="/TeamProject715/member/img/u_b02.gif"></td>
    <td align=center><FONT COLOR="#FFFFFF"><b>인증하기</FONT></td>
    <td align=right><img src="/TeamProject715/member/img/u_b03.gif"></td>
  </tr>
</table>
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
<TR BGCOLOR=#948DCF>
  <TD>
    <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0 WIDTH=330>
  	  <TR BGCOLOR="#FFFFFF">
        <TD ALIGN="center">
      
    	
    	
    	<br> 
    		<form name="member" method="post" action="member?cmd=member_authentication2"
		onsubmit="return formcheck();">

		<!-- 아이디 -->

		<br> <label><b>인증번호</b></label> <input type="text"
			placeholder="Enter name" name="inputatn" 
			id="inputatn"> <br> 
			<div class="check_font" id="name_check"></div>
			
			
		<div class="clearfix">

			<button type="submit" id="signupbtn" class="signupbtn">인증하기</button>

			<!-- <input id = "hi" type="hidden" value='회원가입'/> -->
		</div>
	</form>
      	
    	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>





        </TD>
      </TR>
    </TABLE>
 </TD>
</TR>
</TABLE>

<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="/TeamProject715/member/img/u_b04.gif"></td>
    <td align=right><img src="/TeamProject715/member/img/u_b05.gif"></td>
  </tr>
  <tr>
    <td colspan=3 align=center>

    </td>
  </tr>
</table>
</BODY>
</HTML>