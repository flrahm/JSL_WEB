<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>회원등록</title>
<STYLE TYPE="text/css">
<!--
body { font-family: 돋움, Verdana; font-size: 9pt}
td   { font-family: 돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000; BACKGROUND-POSITION: left top; BACKGROUND-REPEAT: no-repeat;}
-->
.formbox {
	BACKGROUND-COLOR: #F0F0F0; FONT-FAMILY: "Verdana", "Arial", "Helvetica", "돋움"; FONT-SIZE:9pt
} 
--->
</STYLE>
</head>

<script>
function check() {
	if(userinfoinsert.name.value == "") {
		alert("이름을 입력해주세요");
		userinfoinsert.name.focus();
		return;
	}
	
	if(userinfoinsert.passwd.value == "") {
		alert("비밀번호를 입력해주세요");
		userinfoinsert.passwd.focus();
		return;
	}else if(!checkPasswordPattern(userinfoinsert.passwd.value)){
		userinfoinsert.passwd.focus();
		return;
	}else if(userinfoinsert.passwd.value != userinfoinsert.repasswd.value) {
		alert("비밀번호가 서로 일치하지 않습니다. 다시한번 확인해주세요");
		userinfoinsert.passwd.focus();
		return;
	}
	
	if(userinfoinsert.tel.value == "") {
		alert("전화번호를 입력해주세요");
		userinfoinsert.tel.focus();
		return;
	}else if(!tel_check(userinfoinsert.tel.value)) {
		alert("올바른 전화번호를 입력해주세요");
		userinfoinsert.tel.focus();
		return;
	}
	if(!email_check(userinfoinsert.email.value)) {
		alert("올바른 이메일을 입력해주세요");
		userinfoinsert.email.focus();
		return;
	}
	
	userinfoinsert.action.value = "userinfoinsert.do";
	userinfoinsert.submit();
}



	function onIdCheck(){
		if(userinfoinsert.userid.value == "" ) {
			alert("아이디를 입력해주세요");
			userinfoinsert.userid.focus();
			return;
		}else{
			url = "idcheck.do?userid=" + userinfoinsert.userid.value ;
			window.open(url, "id_check","width=300" , "height=300");
		}
	}
	
	function onPostCheck(){
		url = "postcheck.do"; 
		window.open(url, "post_check","width=300" , "height = 300");
	}

	function onSubmit(){
		userinfoinsert.action.value = "userinfoinsert.do";
		userinfoinsert.submit();
	}
	
	function onReset(){
		userinfoinsert.reset();
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
	
	function checkSpecial(str) { 
		var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		if(special_pattern.test(str) == true) { 
			return true; 
			} else {
		return false; } } // 비밀번호 패턴 체크 (8자 이상, 문자, 숫자, 특수문자 포함여부 체크) 
		
		function checkPasswordPattern(str) { 
			var pattern1 = /[0-9]/;	// 숫자 
			var pattern2 = /[a-zA-Z]/;	// 문자 
			var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;
			if(!pattern1.test(str) || !pattern2.test(str) || str.length < 6) { 
				alert("비밀번호는 6자리 이상 문자, 숫자로 구성하여야 합니다."); 
				return false; 
				}else { 
				return true; 
				} 
			}
		
		function tel_check(str){
			
			str=str.split('-').join('');
			var phone=/^((01[0|1|9])[0-9]{7,8})$/;
			return phone.test(str);
		}
		
		function email_check(email) {
			var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			return re.test(email);
			}
	
	

	function onSubmit(){
		userinfoinsert.action.value = "usermodify.do";
		userinfoinsert.submit();
	}
	
	function onReset(){
		userinfoinsert.reset();
	}

</script>




<body bgcolor="#FFFFFF" LEFTMARGIN=0  TOPMARGIN=0 >
 
<jsp:include page = "/include/topmenu.jsp"></jsp:include>


<table border="0" width="800">
<tr>
  <td width="20%"  bgcolor="#ecf1ef" valign="top" style="padding-left:0;">
	
	<!--로그인 영역 삽입-->

  </td>
  <td width="80%" valign="top">&nbsp;<img src="Member/img/title1.gif" ><br>    
	<form name = "userinfoinsert" method = "post">
	<table border=0 cellpadding=0 cellspacing=0 border=0 width=730 valign=top>
		<tr><td align=center><br>                            
			<table cellpadding=0 cellspacing=0 border=0 width=650 align=center>       
				<tr>
					<td bgcolor="#7AAAD5">            
						<table cellpadding=0 cellspacing=0 border=0 width=100%>
							<tr bgcolor=#7AAAD5>
								<td align=left BORDER="0" HSPACE="0" VSPACE="0"><img src="Member/img/u_b02.gif"></td>
								<td align=center bgcolor="#7AAAD5"><FONT COLOR="#FFFFFF"><b>사용자등록&nbsp;</b><font color=black>(</font><font color=red>&nbsp;*&nbsp;</font><font color=black>표시항목은 반드시 입력하십시요.)</font></FONT></td>
								<td align=right BORDER="0" HSPACE="0" VSPACE="0"><img src="Member/img/u_b03.gif"></td>
							</tr>
						</table>
						<table cellpadding=3 cellspacing=1 border=0 width=100%>
							<tr>
								<td width=110 bgcolor=#EFF4F8>&nbsp;회원 성명<font color=red>&nbsp;*</font></td>
								<TD BGCOLOR=WHITE>
									<input type=text name=name size=16 maxlength=20 value="${name }"  readonly>성명은 빈칸없이 입력하세요.
								</td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;회원 ID<font color=red>&nbsp;*</font></td>
								<TD BGCOLOR=WHITE>
									<table cellspacing=0 cellpadding=0>
										<tr>
											<td align=absmiddle>
												<input type=text name=userid size=12 maxlength=16 value="${userid }" style="width:120" readonly >
											</td>
											<td>
                  			<img src="Member/img/u_bt01.gif" hspace=2 border=0 name=img1  align=absmiddle>
                   		5~16자 이내의 영문이나 숫자만 가능합니다.
                  		</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;비밀번호<font color=red>&nbsp;*</font></td>
								<TD BGCOLOR=WHITE>
								<input type=password name=passwd size=8 maxlength=12 style="width:80">
                 6~12자 이내의 영문이나 숫자만 가능합니다.
								</td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;비밀번호확인<font color=red>&nbsp;*</font></td>
								<TD BGCOLOR=WHITE><input type=password name=repasswd size=8 maxlength=12 value="" style="width:80">비밀번호 확인을 위해서 비밀번호를 한번 더 입력해주세요. </td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;주소구분<font color=red>&nbsp;</font></td>
								<TD BGCOLOR=WHITE>
									<input type=radio name=gubun>직장&nbsp;&nbsp;
									<input type=radio name=gubun>자택 
								</td>
							</tr>
							
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;우편번호<font color=red>&nbsp;</font></td>
								<TD BGCOLOR=WHITE>
									<table cellspacing=0 cellpadding=0>
										<tr>
											<td>
                  				<input type=text name=zipcode size=6 maxlength=6 >
                  		</td>
                  		<td>
      									<a href = "#" onClick = "onPostCheck()"><img src="Member/img/u_bt07.gif" hspace=2 border=0 name=img2 align=absmiddle></a>
 											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;주소<font color=red>&nbsp;</font></td>
								<TD BGCOLOR=WHITE>
									<input type=text name=addr1 size=50 maxlength=100 value="">
								</td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;나머지 주소<font color=red>&nbsp;</font></td>
								<TD BGCOLOR=WHITE>
									<input type=text name=addr2 size=50 maxlength=100 value="">
								</td>
							</tr>
							<tr>
               <TD BGCOLOR="#EFF4F8">&nbsp;전화번호<font color=red>&nbsp;*</font></td>
                <TD BGCOLOR=WHITE>
                  <input type=text name=tel size=13 maxlength=13 value="">
               </td>
              </tr>
              <tr>
                <TD BGCOLOR="#EFF4F8">&nbsp;E-mail
                	<font color=red>&nbsp;</font>
                </td>
                <td bgcolor=WHITE valign=middle>
                  <input type=text name=email size=30 maxlength=30 value="">
                </td>
              </tr>
              <tr>
                <TD BGCOLOR="#EFF4F8">&nbsp;관심분야
                	<font color=red>&nbsp;</font>
                </td>
								<td bgcolor=WHITE valign=middle> 
									<input type="checkbox" name="fa" value="건강">건강 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="fa" value="문화예술">문화예술 &nbsp;&nbsp;
									<input type="checkbox" name="fa" value="경제">경제 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="fa" value="연예오락">연예오락 &nbsp;
									<input type="checkbox" name="fa" value="뉴스">뉴스
									<br><input type="checkbox" name="fa" value="여행레져">여행레져 &nbsp;&nbsp;
									<input type="checkbox" name="fa" value="생활">생활 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="fa" value="스포츠">스포츠 &nbsp;&nbsp;
									<input type="checkbox" name="fa" value="교육">교육 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="fa" value="컴퓨터">컴퓨터 &nbsp;&nbsp;
									<input type="checkbox" name="fa" value="학문">학문 &nbsp;&nbsp;
								</td>
              </tr>
              <tr>
                <TD BGCOLOR="#EFF4F8">&nbsp;직업<font color=red>&nbsp;</font></td>
                <TD BGCOLOR=WHITE>
                  <select name=job class="formbox">
 										<option value="0">선택하세요 ---
 										<option value="회사원">회사원
 										<option value="연구전문직">연구전문직
 										<option value="교수학생">교수학생
 										<option value="일반자영업">일반자영업
 										<option value="공무원">공무원
 										<option value="의료인">의료인
 										<option value="법조인">법조인
 										<option value="종교,언론,에술인">종교.언론/예술인
 										<option value="농,축,수산,광업인">농/축/수산/광업인
 										<option value="주부">주부
 										<option value="무직">무직
 										<option value="기타">기타
									</select>
								</td>                
              </tr>
              <tr>
                <TD BGCOLOR="#EFF4F8">&nbsp;자기소개<font color=red>&nbsp;</font></td>
                <TD BGCOLOR=WHITE>
                  <textarea cols=65 rows=5 name="intro"></textarea>
                </td>
              </tr>
            </table>
            <table cellpadding=0 cellspacing=0 border=0 width=100%>
              <tr bgcolor=#7AAAD5>
                <td valign=bottom>
                  <img src="Member/img/u_b04.gif" align=left hspace=0 vspace=0 border=0>
                </td>
                <td align=center></td>
                <td valign=bottom>
                  <img src="Member/img/u_b05.gif" align=right hspace=0 vspace=0 border=0>
                </td>
              </tr>
              <tr bgcolor=#ffffff>
                <td colspan=3 align=center>
                  <a href = "#" onClick = "check()"><img src="Member/img/u_bt06.gif" vspace=3 border=0 name=img3></a>
                  <a href = "#" onClick = "onReset()"><img src="Member/img/u_bt05.gif" border=0 hspace=10 vspace=3 name=img4></a>
                </td>
              </tr>
            </table> 
          </td>
        </tr>
      </td>
    </tr>
	</table>
	</form>
	</td>
</tr>
</table>

<jsp:include page="/include/copyright.jsp"></jsp:include>

</body>
</html>



