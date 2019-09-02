<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String row = request.getParameter("row");
	String memberid = request.getParameter("memberid");
	pageContext.setAttribute("row", row);
	pageContext.setAttribute("memberid", memberid);

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
function id_check(){
	if(idcheck.memberid.value==""){
		alert("아이디입력");
		idcheck.memberid.focus();
		return;
	}else if(idcheck.memberid.value.length<5 || idcheck.memberid.value.length>16){
		alert("아이디가 적절하지 않습니다");
		idcheck.memberid.focus();
		return;
	}else if(!a_or_d(idcheck.memberid.value)){
		alert("아이디는 영문과 숫자만 사용가능합니다");
		idcheck.memberid.focus();
		return;
	}
	idcheck.submit();
}

//문자, 숫자 검사 함수
function a_or_d(str){
	var lower_str=str.toLowerCase();
	for(i=0; i<lower_str.length; i++){
		ch=lower_str.charAt(i);
		if(((ch<'a')||(ch>'z'))&&((ch<'0')||(ch>'9'))){
			return 0;//영문자와 숫자 이외의 값이 들어왔을 때
		}
	}
	return 1;//정상적으로 들어왔을 때		
}

/* function confirm(memberid){

	opener.insertFrm.memberid.value = memberid;

	self.close();

} */

function win_close(row,memberid){
	//var s = '${row}';//1이면 중복된다는거
	if(row != 0){
		self.close();
	}else{
		opener.member.memberid.value=memberid;//상위폼에 값 넣어주기
		self.close();
	}
}
</script>

</HEAD>
<BODY bgcolor="#FFFFFF">
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="/TeamProject715/member/img/u_b02.gif"></td>
    <td align=center><FONT COLOR="#FFFFFF"><b>아이디 중복 체크</FONT></td>
    <td align=right><img src="/TeamProject715/member/img/u_b03.gif"></td>
  </tr>
</table>
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
<TR BGCOLOR=#948DCF>
  <TD>
    <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0 WIDTH=330>
  	  <TR BGCOLOR="#FFFFFF">
        <TD ALIGN="center">
        <c:if test="${!empty memberid }">
        <c:if test="${row==0 }">
          <br><FONT FACE="굴림"><B>사용 가능합니다.</B></FONT><br>
         <BR><FONT COLOR="#483cae"><b>${memberid }</b></FONT>는 아직 사용되지 않은 아이디입니다.
         <BR><FONT COLOR="#483cae"><b>${memberid }</b></FONT>로 등록하셔도 됩니다.
          </c:if>
           <c:if test="${row !=0 }">
         <br><font face="굴림"><b>죄송합니다</b></font><br>
    	<BR><FONT COLOR="#483cae"><b>${memberid }</b></FONT>는 이미 사용 중인 아이디입니다<br>
    	다른 아이디를 사용하여 주십시오.<br>
    	</c:if>
    	</c:if>
    	
    	
    	<br>사용할 아이디 검색 :  
    	<form name="idcheck" method="post" action="member?cmd=member_idcheck2">
           <INPUT NAME="memberid" type="text" size=16 maxlength=16>
      	  <a href="#" onClick="id_check();"> <img src="/TeamProject715/member/img/u_bt08.gif" border=0 vspace=0 ></a>
      	  
		</form>
    	
    	
    	
       

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
        <a href="#" onClick="win_close('${row}','${memberid }')"><img src="/TeamProject715/member/img/u_bt13.gif" border=0 vspace=5></a>
    </td>
  </tr>
</table>
</BODY>
</HTML>