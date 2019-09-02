<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%! public int getRandom(){
	int random = 0;
	random = (int)Math.floor((Math.random()*(999999-100000+1)))+100000;
	return random;
} %>
<!doctype html>
<html lang="kr">
	<head>
	<meta charset="UTF-8">
	<title>http://www.blueb.co.kr</title>

<style rel="stylesheet">
html {
  width: 100%;
  height: 100%;
}

body {
  background: -webkit-linear-gradient(45deg, rgba(66, 183, 245, 0.8) 0%, rgba(66, 245, 189, 0.4) 100%);
  background: linear-gradient(45deg, rgba(66, 183, 245, 0.8) 0%, rgba(66, 245, 189, 0.4) 100%);
  color: rgba(0, 0, 0, 0.6);
  font-family: "Roboto", sans-serif;
  font-size: 14px;
 /*  line-height: 1.6em; */
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.overlay, .form-panel.one:before {
  position: absolute;
  top: 0;
  left: 0;
  display: none;
  background: rgba(0, 0, 0, 0.8);
  width: 100%;
  height: 100%;
}

.form {
  z-index: 15;
  position: relative;
  background: #FFFFFF;
  width: 600px;
  border-radius: 4px;
  box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
  box-sizing: border-box;
  margin: 100px auto 10px;
  overflow: hidden;
}

.form-group {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-wrap: wrap;
      -ms-flex-wrap: wrap;
          flex-wrap: wrap;
  -webkit-box-pack: justify;
  -webkit-justify-content: space-between;
      -ms-flex-pack: justify;
          justify-content: space-between;
  margin: 0 0 20px;
}
.form-group:last-child {
  margin: 0;
}
.form-group label {
  display: block;
  margin: 0 0 10px;
  color: rgba(0, 0, 0, 0.6);
  font-size: 12px;
  font-weight: 500;
  line-height: 1;
  text-transform: uppercase;
  letter-spacing: .2em;
}
.two .form-group label {
  color: #FFFFFF;
}
.form-group input {
  outline: none;
  display: block;
  background: rgba(0, 0, 0, 0.1);
  width: 100%;
  border: 0;
  border-radius: 4px;
  box-sizing: border-box;
  padding: 12px 20px;
  color: rgba(0, 0, 0, 0.6);
  font-family: inherit;
  font-size: inherit;
  font-weight: 500;
  line-height: inherit;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
}
.form-group input:focus {
  color: rgba(0, 0, 0, 0.8);
}
.two .form-group input {
  color: #FFFFFF;
}
.two .form-group input:focus {
  color: #FFFFFF;
}
.form-group button {
  outline: none;
  background: #aaaaaa;
  width: 100%;
  border: 0;
  border-radius: 4px;
  padding: 12px 20px;
  color: #FFFFFF;
  font-family: inherit;
  font-size: inherit;
  font-weight: 500;
  line-height: inherit;
  text-transform: uppercase;
  cursor: pointer;
}
.two .form-group signupbtn {
  background: #FFFFFF;
  color: #4285F4;
}
.form-group .form-remember {
  font-size: 12px;
  font-weight: 400;
  letter-spacing: 0;
  text-transform: none;
}
.form-group .form-remember input[type='checkbox'] {
  display: inline-block;
  width: auto;
  margin: 0 10px 0 0;
}
.form-group .form-recovery {
  color: #4285F4;
  font-size: 12px;
  text-decoration: none;
}
.form-panel {
  padding: 60px calc(5% + 60px) 60px 60px;
  box-sizing: border-box;
}
.form-panel.one:before {
  content: '';
  display: block;
  opacity: 0;
  visibility: hidden;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
}
.form-panel.one.hidden:before {
  display: block;
  opacity: 1;
  visibility: visible;
}
.form-panel.two {
  z-index: 5;
  position: absolute;
  top: 0;
  left: 95%;
  background: #4285F4;
  width: 100%;
  min-height: 100%;
  padding: 20px calc(10% + 60px) 60px 60px;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
  cursor: pointer;
}
.form-panel.two:before, .form-panel.two:after {
  content: '';
  display: block;
  position: absolute;
  top: 60px;
  left: 1.5%;
  background: rgba(255, 255, 255, 0.2);
  height: 30px;
  width: 2px;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
}
.form-panel.two:after {
  left: 3%;
}
.form-panel.two:hover {
  left: 93%;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}
.form-panel.two:hover:before, .form-panel.two:hover:after {
  opacity: 0;
}
.form-panel.two.active {
  left: 10%;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  cursor: default;
}
.form-panel.two.active:before, .form-panel.two.active:after {
  opacity: 0;
}
.form-header {
  margin: 0 0 40px;
}
.form-header h1 {
 /*  padding: 4px 0; */
  color: #4285F4;
  font-size: 22px;
  font-weight: 700;
  text-transform: uppercase;
}
.two .form-header h1 {
  position: relative;
  z-index: 40;
  color: #FFFFFF;
}

.pen-footer {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
  -webkit-box-pack: justify;
  -webkit-justify-content: space-between;
      -ms-flex-pack: justify;
          justify-content: space-between;
  width: 600px;
  margin: 20px auto 100px;
}
.pen-footer a {
  color: #FFFFFF;
  font-size: 12px;
  text-decoration: none;
  text-shadow: 1px 2px 0 rgba(0, 0, 0, 0.1);
}
.pen-footer a .material-icons {
  width: 12px;
  margin: 0 5px;
  vertical-align: middle;
  font-size: 12px;
}

.cp-fab {
  background: #FFFFFF !important;
  color: #4285F4 !important;
}

</style>
</head>
<body>


  
  <div class="form">
  <div class="form-toggle"></div>
  <div class="form-panel one">
    <div class="form-header">
      <h1>Register Account</h1>
    </div>
    <div class="form-content">
  <form name="member" method="post" action="member?cmd=member_insert2">
        <div class="form-group">
         <label><b>Userid</b></label> <input type="text" placeholder="Enter ID"
         name="memberid" id="memberid"  required="required"/>
      <div class="check_font" id="id_check"></div>
      </div>
         <div class="form-group">
          <label for="membername">Username</label>
          <input type="text" id="membername" name="membername" placeholder="Enter name" required="required"/>
         <div class="check_font" id="name_check"></div>
        </div>
        <div class="form-group">
          <label for="pass">Password</label>
          <input type="password"  required class="pass" placeholder="Enter passwd" id="pass" name="memberpasswd"  oninput="checkPwd()"  onkeyup="checkpw()" required="required"/>
       <div class="check_font" id="pw_check"></div>
        </div>
        <div class="form-group">
          <label for="repwd">Confirm Password</label>
          <input type="password" placeholder="Enter repasswd" id="repwd" name="repasswd"  oninput="checkPwd()" required="required"/>
        </div>
       <div class="form-group">
                 <label for="phone">Phone</label>
        <input type="text" placeholder="Enter phone" name="phone" required
         class="id" id="phone" onkeyup="checkphone()"  required="required"/>    
      <div class="check_font" id="phone_check"></div>
      </div>
     <input type=button name="authbtn" value="인증하기" onclick="checkatn()">
    <!--  <input type="hidden" value="false" name="atn"> -->
        <div class="form-group">
          <label for="email">Email Address</label>
          <input type="email" id="email" name="email" onkeyup="checkemail()" required="required"/>
        <div class="check_font" id="email_check"></div>
        </div>


      <tr>
         <th><label><b>등급</b></label></th>
         <td><input type="radio" name="grade" value="D">지역주민
         <td><input type="radio" name="grade" value="C" checked="checked">학부생
         <td><input type="radio" name="grade" value="B" >대학원생
         <td><input type="radio" name="grade" value="A">교수
      </tr>
     
 <div class="form-group"> 
          <button type="submit" id="signupbtn" class="signupbtn"
            disabled="disabled">Sign Up</button>
        <!--   <button type="submit">Register</button> -->
       </div> 
      </form>
    </div>
  </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



  <script>
//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
 var pAuthCheck=false;
 var idCheck = false;
 var pwdCheck = false;
 var repwdCheck = false;
 var emailCheck = false;
 var phoneCheck = false;
 var nameCheck = false;
 
 
 
  function checkhidden(){
	  //if(member.atn.value=='true')
	 // alert('dd');
	  document.getElementById('phone_check').style.color = "blue";
	  document.getElementById('phone').style.backgroundColor = "#B0F6AC";
      document.getElementById('phone_check').innerHTML = "인증되었습니다:)"; 
      pAuthCheck = true;
  }
  
 //인증번호 보내기
    function checkatn(){
	 var phone=member.phone.value;
    // location.href="member?cmd=member_authentication&phone="+phone;
	window.open('member?cmd=member_authentication&phone='+ phone,'atn','width=400,height=250,location=no,status=no,scrollbars=no');
    }
 

         // 아이디 유효성 검사(1 = 중복 / 0 != 중복)
         $("#memberid").blur(function() { 
            var memberid = $('#memberid').val();    
            var memberidlen = $('#memberid').length;
            // 유효성 검사
            
                  if(memberid==""){
                      $('#id_check').text('아이디를 입력해주세요 :(');
                      $('#id_check').css('color', 'red');
                      idCheck = false;
                  }else if(!a_or_d(memberid)){
                      $('#id_check').text('아이디는 숫자와 영문만 가능합니다:(');
                      $('#id_check').css('color', 'red');
                      idCheck = false;
                  }else if(member.memberid.value.length<6||member.memberid.value.length>12){
                      $('#id_check').text('아이디는 6자 이상, 12자 이하로 입력해주세요:(');
                      $('#id_check').css('color', 'red');
                      idCheck = false;  
                  }else{///              
                      $.ajax({
                         url : 'member?cmd=member_idcheck2&memberid=' + memberid,
                          type : 'get',
                          success : function(data) {
                             console.log("1 = 중복o / 0 = 중복x : " + data);
                             $("#data_test").text(data);   
                     if (data != 0) {
                          // 1 : 아이디가 중복되는 문구
                          $("#id_check").text("사용중인 아이디입니다:(");
                          $("#id_check").css("color", "red");
                          $("#memberid").css("background-color", "#FFCECE");
                          idCheck = 0;
                          idCheck = false;
                       }else {
                           $('#id_check').text("사용 가능한 아이디 입니다:)");
                           $('#id_check').css('color', 'blue');
                           $("#memberid").css("background-color", "#B0F6AC");
                           idCheck = true;
                        }
                     
                          },
                          error : function() {
                             $('#id_check').text("아이디 중복검사 에러입니다:(");
                             $('#id_check').css('color', 'red');
                             idCheck = false;
                          }
                       });
                     
                  }////
                  
            makeReal();
         });

    
         $("#membername").blur(function() { 
            
              if($('#membername').val() == ""){
                   
                  $('#name_check').text('이름을 입력해주세요:(');
                  $('#name_check').css('color', 'red');
              }else{
            
            
             for (var i=0; i<$("#membername").val().length; i++)  { 
                  var chk = $("#membername").val().substring(i,i+1); 
               if(chk.match(/[0-9]|[a-z]|[A-Z]/)) { 
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
             


       function checkPwd() {
          var inputed = $('.pass').val();
          var reinputed = $('#repwd').val();
          
          if (reinputed == ""
                && (inputed != reinputed || inputed == reinputed)) {
             $("#repwd").css("background-color", "#FFCECE");
             repwdCheck = false;
          } else if (inputed == reinputed) {
             $("#repwd").css("background-color", "#B0F6AC");
             repwdCheck = true;
          } else if (inputed != reinputed) {
             $("#repwd").css("background-color", "#FFCECE");
             repwdCheck = false;
       } 
          makeReal();
          }
       
       function checkpw(){
            var v1 = member.memberpasswd.value;
            var v2 =  member.repasswd.value;
            if(v1.length <6 || v1.length>12){
                document.getElementById('pw_check').style.color = "red";
                document.getElementById('pw_check').innerHTML = "비밀번호는 6자이상 12자 이내로 입력하세요:(";
                pwdCheck = false;
            }else{
                document.getElementById('pw_check').style.color = "blue";
                document.getElementById('pw_check').innerHTML = "사용가능한 비밀번호입니다:)"; 
                pwdCheck = true;
            }
            makeReal();
           }

       function checkphone(){
            var v1 = member.phone.value;
            if(!tel_check(v1)){
                document.getElementById('phone_check').style.color = "red";               
                document.getElementById('phone_check').innerHTML = "형식이 맞지않습니다:(";
                   phoneCheck = false;
            }
                   else if(v1==""){
                      document.getElementById('phone_check').style.color = "red";               
                   document.getElementById('phone_check').innerHTML = "필수입력입니다:(";
                   phoneCheck = false;
              
            }else{
                document.getElementById('phone_check').style.color = "blue";
                document.getElementById('phone_check').innerHTML = "사용가능합니다:)"; 
                phoneCheck = true;
            }
            makeReal();
           }

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
       
     
       
       function tel_check(str) {
          //010_1111,0101111둘다 가능하게
          str = str.split("-").join("");//-이들어오면 없애고 한줄로 합친다
          var phone = /^((01[0|1|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
          //var phone=/^(010[1-9][0-9]{7})$/;//pattern란 클래스에 속한 /^문자열 검색하는 패턱이다 /^( )$/ ==$/끝이라는 뜻 일치하면 true []{}크기

          
          return phone.test(str);//.test 패턴을 검사하는 메소드 일치하는지 비교한다 ==정규식이라 검색하면 나옴
          
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
        
           if( nameCheck==true && pwdCheck == true && repwdCheck==true && phoneCheck == true && emailCheck == true){
             // alert('all true');
              signupbtn.disabled=false;
              $(".signupbtn").css("background-color", "#4285F4");
           }else{
              signupbtn.disabled=true;
              $(".signupbtn").css("background-color", "#aaaaaa");
              //alert('something false');
           }
              
           }    
    </script>



</body>
</html>

<%@ include file="/include/footer.jsp"%>