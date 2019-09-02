<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%! public int getRandom(){
	int random = 0;
	random = (int)Math.floor((Math.random()*(999999-100000+1)))+100000;
	return random;
} %>
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
<BODY bgcolor="#FFFFFF">
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="member/img/u_b02.gif"></td>
    <td align=center><FONT COLOR="#FFFFFF"><b>임시비밀번호 발급</FONT></td>
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
    		<form name="member" method="post" action="member?cmd=member_pwfound2"
		onsubmit="return formcheck();">
 <label><b>아이디</b></label> <input type="text" placeholder="Enter ID"
         name="memberid" required class="id" id="memberid">
      <div class="check_font" id="id_check"></div>
		<br> <label><b>이메일</b></label> <input type="text"
			placeholder="Enter Email" name="email" required class="id" id="email"
			onkeyup="checkemail()">
		<div class="check_font" id="email_check"></div>
		<br>
<div class="clearfix">
<button type="submit" id="signupbtn" class="signupbtn"disabled="disabled">인증하기</button>
<td>
<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>">
</td>
		</div>
	</form>      	
    	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>    
//  아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
 var emailCheck = false;
 var idCheck = false;
 // 아이디 유효성 검사(1 = 중복 / 0 != 중복)
 $("#memberid").blur(function() { 
    var memberid = $('#memberid').val();    
    var memberidlen = $('#memberid').length;
    // 유효성 검사   
          if(memberid==""){
              $('#id_check').text('아이디를 입력해주세요 :)');
              $('#id_check').css('color', 'red');
              idCheck = false;
          }else{             
              $.ajax({
           	   url : 'member?cmd=member_idcheck2&memberid=' + memberid,
                  type : 'get',
                  success : function(data) {
                     console.log("1 = 중복o / 0 = 중복x : " + data);
                     $("#data_test").text(data);   
             if (data == 0) {
                  // 1 : 아이디가 중복되는 문구
                  $("#id_check").text("아이디가 존재하지않습니다");
                  $("#id_check").css("color", "red");
                  $("#memberid").css("background-color", "#FFCECE");
                  idCheck = 0;
                  idCheck = false;
               }else {
                   $('#id_check').text("아이디가 존재합니다");
                   $('#id_check').css('color', 'blue');
                   $("#memberid").css("background-color", "#B0F6AC");
                   idCheck = true;
                }
             
                  },
                  error : function() {
                     $('#id_check').text("아이디 중복검사 에러입니다");
                     $('#id_check').css('color', 'red');
                     idCheck = false;
                  }
               });         
          }
    makeReal();
 });
      function checkemail(){
           var v1 = member.email.value;
          
           if(!email_check(member.email.value)){
               document.getElementById('email_check').style.color = "red";
               document.getElementById('email_check').innerHTML = "이메일 형식이 맞지않습니다";
               emailCheck = false;
           }else if(v1==""){
                     document.getElementById('email_check').style.color = "red";               
                  document.getElementById('email_check').innerHTML = "필수입력입니다";
                  emailCheck = false;
                 
           }else{
               document.getElementById('email_check').style.color = "blue";
               document.getElementById('email_check').innerHTML = "이메일 형식이 맞습니다."; 
               emailCheck = true;
           }
           makeReal();
          }      
      function a_or_d(str) {
          var lower_str = str.toLowerCase();
          for (i = 0; i < lower_str.length; i++) {
             ch = lower_str.charAt(i);
             if (((ch < 'a') || (ch > 'z')) && ((ch < '0') || (ch > '9'))) {
                return 0;//영문자와 숫자 이외의 값이 들어왔을 때
             }
          }
          return 1;//정상적으로 들어왔을 때      
       }
      //이메일 검사
      function email_check(str) {
         var mail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
         ///^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/;
         return mail.test(str);
      }
function makeReal(){
         var signupbtn = document.getElementById("signupbtn");
         if(emailCheck == true){
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
    <td align=left><img src="member/img/u_b04.gif"></td>
    <td align=right><img src="member/img/u_b05.gif"></td>
  </tr>
  <tr>
  </tr>
</table>
</BODY>
</HTML>
