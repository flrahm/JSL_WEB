<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String name = request.getParameter("name");
	String passwd = request.getParameter("passwd");
	String zipcode = request.getParameter("zipcode");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String favorite = request.getParameter("favorite");
	String job = request.getParameter("job");
	String intro = request.getParameter("intro");
%>
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
<script type="text/javascript" src = "userinfo_exceptionHandling.js">
</script>
<script>
function send(){
	
	if(name_check() == false)
		return false;
	if(passwd_check() == false)
		return false;
	if(repasswd_check() == false)
		return false;
	if(email_check() == false)
		return false;
	if(tel_check() == false)
		return false;
	if(interest_check() == false)
		return false;
	if(job_check() == false)
		return false;

	userinfo.submit();
}
</script>
</head>

<body bgcolor="#FFFFFF" LEFTMARGIN=0  TOPMARGIN=0 >
 
 <!-- 탑 메뉴 영역 삽입-->


<table border="0" width="800">
<tr>
  <td width="20%"  bgcolor="#ecf1ef" valign="top" style="padding-left:0;">
	
	<!--로그인 영역 삽입-->

  </td>
  <td width="80%" valign="top">&nbsp;<img src="./img/title1.gif" ><br>    
	<form name=userinfo method=post action = "userinfo_insert_exe.jsp">
	<table border=0 cellpadding=0 cellspacing=0 border=0 width=730 valign=top>
		<tr><td align=center><br>                            
			<table cellpadding=0 cellspacing=0 border=0 width=650 align=center>       
				<tr>
					<td bgcolor="#7AAAD5">            
						<table cellpadding=0 cellspacing=0 border=0 width=100%>
							<tr bgcolor=#7AAAD5>
								<td align=left BORDER="0" HSPACE="0" VSPACE="0"><img src="./img/u_b02.gif"></td>
								<td align=center bgcolor="#7AAAD5"><FONT COLOR="#FFFFFF"><b>사용자등록&nbsp;</b><font color=black>(</font><font color=red>&nbsp;*&nbsp;</font><font color=black>표시항목은 반드시 입력하십시요.)</font></FONT></td>
								<td align=right BORDER="0" HSPACE="0" VSPACE="0"><img src="./img/u_b03.gif"></td>
							</tr>
						</table>
						<table cellpadding=3 cellspacing=1 border=0 width=100%>
							<tr>
								<td width=110 bgcolor=#EFF4F8>&nbsp;회원 성명<font color=red>&nbsp;*</font></td>
								<TD BGCOLOR=WHITE>
									<input type=text name=name size=16 maxlength=20 value=<%= name %>>성명은 빈칸없이 입력하세요.
								</td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;회원 ID<font color=red>&nbsp;*</font></td>
								<TD BGCOLOR=WHITE>
									<table cellspacing=0 cellpadding=0>
										<tr>
											<td align=absmiddle>
												<input type=text name=userid size=12 maxlength=16 style="width:120"  value = <%= userid %> readonly>
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
								<TD BGCOLOR="#EFF4F8">&nbsp;우편번호<font color=red>&nbsp;</font></td>
								<TD BGCOLOR=WHITE>
									<table cellspacing=0 cellpadding=0>
										<tr>
											<td>
                  				<input type=text name=zip size=6 maxlength=6 readonly value = <%= zipcode %>>
                  		</td>
                  		<td>
      									<img src="./img/u_bt07.gif" hspace=2 border=0 name=img2 align=absmiddle>
 											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;주소<font color=red>&nbsp;</font></td>
								<TD BGCOLOR=WHITE>
									<input type=text name=addr1 size=50 maxlength=100 value=<%=addr1 %> readonly>
								</td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;나머지 주소<font color=red>&nbsp;</font></td>
								<TD BGCOLOR=WHITE>
									<input type=text name=addr2 size=50 maxlength=100 value=<%=addr2 %>>
								</td>
							</tr>
							<tr>
               <TD BGCOLOR="#EFF4F8">&nbsp;전화번호<font color=red>&nbsp;*</font></td>
                <TD BGCOLOR=WHITE>
                  <input type=text name=tel size=13 maxlength=13 value=<%=tel %>>
               </td>
              </tr>
              <tr>
                <TD BGCOLOR="#EFF4F8">&nbsp;E-mail
                	<font color=red>&nbsp;</font>
                </td>
                <td bgcolor=WHITE valign=middle>
                  <input type=text name=email size=30 maxlength=30 value=<%=email %>>
                </td>
              </tr>
              <tr>
                <TD BGCOLOR="#EFF4F8">&nbsp;관심분야
                	<font color=red>&nbsp;</font>
                </td>  
								<td bgcolor=WHITE valign=middle> 
									<input type="checkbox" name="fa" value="건강"
									<% if(favorite.contains("건강")) {%> checked <% } %>
									>건강 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="fa" value="문화예술"
									<%if(favorite.contains("문화예술")) {%> checked <% } %>
									>문화예술 &nbsp;&nbsp;
									<input type="checkbox" name="fa" value="경제"
									<%if(favorite.contains("경제")) {%> checked <% } %>
									>경제 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="fa" value="연예오락"
									<%if(favorite.contains("연예오락")) {%> checked <% } %>
									>연예오락 &nbsp;
									<input type="checkbox" name="fa" value="뉴스
									<%if(favorite.contains("뉴스")) {%> checked <% } %>
									">뉴스
									<br><input type="checkbox" name="fa" value="여행레져"
									<%if(favorite.contains("여행레져")) {%> checked <% } %>
									>여행레져 &nbsp;&nbsp;
									<input type="checkbox" name="fa" value="생활"
									<%if(favorite.contains("생활")) {%> checked <% } %>
									>생활 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="fa" value="스포츠"
									<%if(favorite.contains("스포츠")) {%> checked <% } %>
									>스포츠 &nbsp;&nbsp;
									<input type="checkbox" name="fa" value="교육"
									<%if(favorite.contains("교육")) {%> checked <% } %>
									>교육 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="fa" value="컴퓨터"
									<%if(favorite.contains("컴퓨터")) {%> checked <% } %>
									>컴퓨터 &nbsp;&nbsp;
									<input type="checkbox" name="fa" value="학문"
									<%if(favorite.contains("학문")) {%> checked <% } %>
									>학문 &nbsp;&nbsp;
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
                  <textarea cols=65 rows=5 name="intro" value = ><%=intro %></textarea>
                </td>
              </tr>
            </table>
            <table cellpadding=0 cellspacing=0 border=0 width=100%>
              <tr bgcolor=#7AAAD5>
                <td valign=bottom>
                  <img src="./img/u_b04.gif" align=left hspace=0 vspace=0 border=0>
                </td>
                <td align=center></td>
                <td valign=bottom>
                  <img src="./img/u_b05.gif" align=right hspace=0 vspace=0 border=0>
                </td>
              </tr>
              <tr bgcolor=#ffffff>
                <td colspan=3 align=center>
                 <a href = "#" onClick = "send()">  <img src="./img/u_bt06.gif" vspace=3 border=0 name=img3></a>
                  <img src="./img/u_bt05.gif" border=0 hspace=10 vspace=3 name=img4>
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

 <!-- copyright 영역 삽입-->
  

</body>
</html>
