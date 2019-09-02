<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
<TITLE>사용자의 비밀번호를 체크합니다.</TITLE>
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
    <td align=left><img src="member/img/u_b02.gif"></td>
    <td align=center><FONT COLOR="#FFFFFF"><b>회원 탈퇴</FONT></td>
    <td align=right><img src="member/img/u_b03.gif"></td>
  </tr>
</table>
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
<TR BGCOLOR=#948DCF>
  <TD>
    <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0 WIDTH=330>
  	  <TR BGCOLOR="#FFFFFF">
        <TD ALIGN="center">  	
    	<br> 
    	<form name="member" method="post" action="member?cmd=member_delete2">
		<!-- 비번 -->
		 <label for="pass">Password</label>
          <input type="password"  required class="pass" placeholder="Enter passwd" id="pass" name="memberpasswd"   onkeyup="checkpw()" required="required"/>
       <div class="check_font" id="pw_check"></div>
        </div>
		<div class="clearfix">
			<button type="submit" id="signupbtn" class="signupbtn"
				disabled="disabled">탈퇴하기</button>
		</div>
	</form>
    	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script> 
//  아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
  var pwdCheck = false;
function checkpw(){
            var v1 = member.memberpasswd.value;           
            if(v1.length<6 || v1.length>12){
                document.getElementById('pw_check').style.color = "red";
                document.getElementById('pw_check').innerHTML = "비밀번호는 6자이상 12자 이내로 입력하세요";
                pwdCheck = false;
            }else{
                document.getElementById('pw_check').style.color = "blue";
                document.getElementById('pw_check').innerHTML = "사용가능한 비밀번호입니다."; 
                pwdCheck = true;
            }
            makeReal();
           }
      function makeReal(){
         var signupbtn = document.getElementById("signupbtn");
         if(pwdCheck == true){
            signupbtn.disabled=false;
         }else{
            signupbtn.disabled=true;
         }
            
         }
   </script>
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