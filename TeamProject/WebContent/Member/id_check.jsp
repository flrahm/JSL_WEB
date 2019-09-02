<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
${row }
${userid }
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
</HEAD>

<script>
function useID() {
	
	opener.document.userinfoinsert.userid.value = document.hID.hiddenid.value;
	self.close();
}

function check_id() {
	if(input.userid.value == ""){
		alert("아이디를 입력해주세요");
		input.userid.focus();
		return;
	}
	if(input.userid.value.length < 5) {
		alert("아이디는 5자이상으로 입력해주세요");
		input.userid.focus();
		return;
	}
	
	if(!checkSpace(input.userid.value)) {
		alert("아이디에는 공백이 들어갈 수 없습니다.");
		input.userid.focus();
		return;
	}
	input.submit();
}

function checkSpace(str) {  
	if(str.search(/\s/) != -1) { 
		return false; 
		} else { 
		return true; 
		} 
	}

function checkid(str) {
	var pattern1 = /[0-9]/;
	var pattern2 = /[a-zA-Z]/;
	var pattern3 = /[ㄱ-ㅎㅏ-ㅣ가-힣]/;
	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	if(pattern3.test(str) || special_pattern.test(str)) {
		alert("아이디는 숫자와 문자로만 입력해주세요");
		return false;
	}else{
		return true;	
	}
}
	
</script>

<BODY bgcolor="#FFFFFF">
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="Member/img/u_b02.gif"></td>
    <td align=center><FONT COLOR="#FFFFFF"><b>아이디 중복 체크</FONT></td>
    <td align=right><img src="Member/img/u_b03.gif"></td>
  </tr>
</table>
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
<TR BGCOLOR=#948DCF>
  <TD>
    <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0 WIDTH=330>
  	  <TR BGCOLOR="#FFFFFF">
        <TD ALIGN="center">
        <c:if test ="${row == 0 }">
          <br><FONT FACE="굴림"><B>사용 가능합니다.</B></FONT><br>
         <BR><FONT COLOR="#483cae"><b>${userid }</b></FONT>는 아직 사용되지 않은 아이디입니다.
         <BR><FONT COLOR="#483cae"><b>${userid }</b></FONT>로 등록하셔도 됩니다.
         <BR><FONT COLOR="#483cae">사용하시겠습니까</FONT>
         <form name = "hID">
         	<input type = "hidden" name ="hiddenid" value = "${userid }">
         </form>
         <a href = "#" onClick = "useID()"><img src="./img/u_bt08.gif" border=0 vspace=0></a>
         <br><FONT FACE="굴림"><B>다른 아이디를 사용하시려면 다시한번 입력해주세요</B></FONT><br>
      
         </c:if>
         <c:if test ="${row == 1 }">
         <br><font face="굴림"><b>죄송합니다</b></font><br>
    	<BR><FONT COLOR="#483cae"><b>${userid }</b></FONT>는 이미 사용 중인 아이디입니다<br>
    	다른 아이디를 사용하여 주십시오.
    	</c:if>
    	<form name = "input" method = "post" action = "idcheck.do">
    	<INPUT NAME=userid type=text size=16 maxlength=16>
    	<a href = "#" onClick = "check_id()"><img src="Member/img/u_bt08.gif" border=0 vspace=0></a>
    	</form>
        </TD>
      </TR>
    </TABLE>
 </TD>
</TR>
</TABLE>

<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="Member/img/u_b04.gif"></td>
    <td align=right><img src="Member/img/u_b05.gif"></td>
  </tr>
  <tr>
    <td colspan=3 align=center>
      <a href = "#" onClick = "close()"><img src="Member/img/u_bt13.gif" border=0 vspace=5></a>
    </td>
  </tr>
</table>
</BODY>
</HTML>