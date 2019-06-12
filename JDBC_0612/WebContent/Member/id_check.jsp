<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String flag = request.getParameter("flag");
	String userid = request.getParameter("userid");
	
	pageContext.setAttribute("flag", flag);
	pageContext.setAttribute("userid", userid);
 %>

<HTML>
<HEAD>
<TITLE>사용자의 아이디를 체크합니다.</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<STYLE TYPE="text/css">
<!--
body { font-family: 돋움, Verdana; font-size: 9pt}
td   { font-family: 돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000} 
--->
</STYLE>
<script>
	function id_duple(){
		if(idDupleFrm.userid.value ==""){
			alert("값을 입력하세요");
			return false;
		}
		
		if(idDupleFrm.userid.length < 3){
			alert("아이디는 4자 이상 입력하세요");
			return false;
		}
		
		
		idDupleFrm.submit();
	}
	function confirm(userid){
		opener.insertFrm.userid.value = userid;
		self.close();
	}
	
	function cancle(){
		self.close();
	}
	
</script>
</HEAD>
<BODY bgcolor="#FFFFFF">
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="/JDBC_0612/Member/img/u_b02.gif"></td>
    <td align=center><FONT COLOR="#FFFFFF"><b>아이디 중복 체크</FONT></td>
    <td align=right><img src="/JDBC_0612/Member/img/u_b03.gif"></td>
  </tr>
</table>
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
<TR BGCOLOR=#948DCF>
  <TD>
    <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0 WIDTH=330>
  	  <TR BGCOLOR="#FFFFFF">
        <TD ALIGN="center">
        
        
         <br><FONT FACE="굴림"><B>아이디를 입력하세요</B></FONT><br>
        
        <c:if test="${flag == 1 }">
          <br><FONT FACE="굴림"><B>사용 가능합니다.</B></FONT><br>
         <BR><FONT COLOR="#483cae"><b>${userid }</b></FONT>는 아직 사용되지 않은 아이디입니다.
         <BR><FONT COLOR="#483cae"><b>${userid }</b></FONT>로 등록하셔도 됩니다.
         <input type = "button" name = "confirm" value = "등록" onClick = "javascript:confirm('${userid}')">
         </c:if>
         
         <c:if test="${flag == 0 }">
         <br><font face="굴림"><b>죄송합니다</b></font><br>
    	<BR><FONT COLOR="#483cae"><b>${userid }</b></FONT>는 이미 사용 중인 아이디입니다<br>
    	다른 아이디를 사용하여 주십시오.
    	</c:if>
    	
    	
    	
    	
    	
    	<form method = "post" name = "idDupleFrm" action = "/JDBC_0612/id_check.do">
           <INPUT NAME=userid type=text size=16 maxlength=16>
      	   <a href = "#" onClick = "javascript:id_duple()"><img src="/JDBC_0612/Member/img/u_bt08.gif" border=0 vspace=0></a>
	</form>
        </TD>
      </TR>
    </TABLE>
 </TD>
</TR>
</TABLE>
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="/JDBC_0612/Member/img/u_b04.gif"></td>
    <td align=right><img src="/JDBC_0612/Member/img/u_b05.gif"></td>
  </tr>
  <tr>
    <td colspan=3 align=center>
      <A href = "#" onclick = "javascript:cancle();"><img src="/JDBC_0612/Member/img/u_bt13.gif" border=0 vspace=5></A>
    </td>
  </tr>
</table>
</BODY>
</HTML>