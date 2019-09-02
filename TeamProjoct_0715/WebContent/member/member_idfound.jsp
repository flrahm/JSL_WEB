<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<HEAD>
<TITLE>사용자의 아이디를 체크합니다.</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<STYLE TYPE="text/css">
<!--
body {
	font-family: 돋움, Verdana;
	font-size: 9pt
}

td {
	font-family: 돋움, Verdana;
	font-size: 9pt;
	text-decoration: none;
	color: #000000
}
-
-->
</STYLE>

</HEAD>
<BODY bgcolor="#FFFFFF">
	<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
		<TR BGCOLOR=#7AAAD5>
			<td align=left><img src="member/img/u_b02.gif"></td>
			<td align=center><FONT COLOR="#FFFFFF"><b>아이디 찾기</FONT></td>
			<td align=right><img src="member/img/u_b03.gif"></td>
		</tr>
	</table>
	<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
		<TR BGCOLOR=#948DCF>
			<TD>
				<TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0 WIDTH=330>
					<TR BGCOLOR="#FFFFFF">
						<TD ALIGN="center"><br>
							<form name="member" method="post"
								action="member?cmd=member_idfound2"
								onsubmit="return formcheck();">

								<!-- 아이디 -->

								<br> <label><b>이름</b></label> <input type="text"
									placeholder="Enter name" name="membername" required class="id"
									id="membername"> <br>
								<div class="check_font" id="name_check"></div>
								<br> <label><b>이메일</b></label> <input type="text"
									placeholder="Enter Email" name="email" required class="id"
									id="email" onkeyup="checkemail()">
								<div class="check_font" id="email_check"></div>
								<br>




								<div class="clearfix">

									<button type="submit" id="signupbtn" class="signupbtn"
										disabled="disabled">인증하기</button>

									<!-- <input id = "hi" type="hidden" value='회원가입'/> -->
								</div>
							</form> <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
							<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>




							<script>
    
// 아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정

   var emailCheck = false;

   var nameCheck = false;
     
     
   
        $("#membername").blur(function() { 
           
             if($('#membername').val() == ""){
                  
                 $('#name_check').text('이름을 입력해주세요:(');
                 $('#name_check').css('color', 'red');
             }else{
            	            
                 for (var i=0; i<$("#membername").val().length; i++)  { 
                     var chk = $("#membername").val().substring(i,i+1); 
                  if(chk.match(/[0-9]/)) { 
                         $('#name_check').text('형식이 맞지 않습니다:(');
                           $('#name_check').css('color', 'red');
                           nameCheck = false;
                     }else if(chk.match(/([^가-힣\x20])/i)){
                         $('#name_check').text('형식이 맞지 않습니다 :(');
                           $('#name_check').css('color', 'red');
                           nameCheck = false;
                     }else{
                         $('#name_check').text('적절한 이름입니다:)');
                         $('#name_check').css('color', 'blue');
                         nameCheck = true;
                     }
                 }           
             }         
            makeReal();
            });
            


      function checkemail(){
           var v1 = member.email.value;
          
           if(!email_check(member.email.value)){
               document.getElementById('email_check').style.color = "red";
               document.getElementById('email_check').innerHTML = "gmail만 가능합니다";
               emailCheck = false;
           }else if(v1==""){
                     document.getElementById('email_check').style.color = "red";               
                  document.getElementById('email_check').innerHTML = "필수입력입니다";
                  emailCheck = false;
                 
           }else{
               document.getElementById('email_check').style.color = "blue";
               document.getElementById('email_check').innerHTML = "사용가능한 이메일입니다."; 
               emailCheck = true;
           }
           makeReal();
          }
	//이메일 검사
      function email_check(str) {
         var mail = /^([0-9a-zA-Z_\.-]+)@gmail.com$/;
         ///^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/;
         return mail.test(str);
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
      function makeReal(){
          var signupbtn = document.getElementById("signupbtn");       
          if( nameCheck==true && emailCheck == true){
             signupbtn.disabled=false;
             $(".signupbtn").css("background-color", "#4285F4");
          }else{
             signupbtn.disabled=true;
             $(".signupbtn").css("background-color", "#aaaaaa");
          }           
          }
   </script></TD>
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
			<td colspan=3 align=center></td>
		</tr>
	</table>
</BODY>
</HTML>