<%@page import="member.vo.MemberVO"%>
<%@page import="member.dao.MemberManager"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String idx = request.getParameter("idx");
	if(idx == null)
		idx = "" +(int)session.getAttribute("loginIdx");
		
	MemberManager manager = MemberManager.getInstance();
	MemberVO mvo = manager.selectMemberByIdx(idx);
	pageContext.setAttribute("mvo", mvo);
	
	String fa = mvo.getFavorite();
	String job = mvo.getJob();
	
	pageContext.setAttribute("fa", fa);
	pageContext.setAttribute("job", job);
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
<script>
	function send(){
		
		
		if(insertFrm.repasswd.value == '<%=mvo.getPasswd() %>'){
			insertFrm.submit();
		}else{
			alert("비밀번호가 일치하지 않습니다");
		}
	}
	
	
	function post_check(){
		window.open("post_check.jsp","post_check","width = 350 height = 250");
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
	<form name=insertFrm method=post action = "userinfo_modify_pro.jsp">
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
									<input type=text name=name size=16 maxlength=20 value="${mvo.name }" readonly>성명은 빈칸없이 입력하세요.
								</td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;회원 ID<font color=red>&nbsp;*</font></td>
								<TD BGCOLOR=WHITE>
									<table cellspacing=0 cellpadding=0>
										<tr>
											<td align=absmiddle>
												<input type=text name=userid size=12 maxlength=16 value="${mvo.userid }" style="width:120" readonly>
											</td>
											<td>
                  			<A href = "#" onClick = "javascript:id_check()"><img src="./img/u_bt01.gif" hspace=2 border=0 name=img1  align=absmiddle></A>
                   		5~16자 이내의 영문이나 숫자만 가능합니다.
                  		</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;비밀번호<font color=red>&nbsp;*</font></td>
								<TD BGCOLOR=WHITE>
								<input type=hidden name=passwd size=8 maxlength=12 style="width:80" value = "${mvo.passwd }" readonly>
                 6~12자 이내의 영문이나 숫자만 가능합니다.
								</td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;비밀번호확인<font color=red>&nbsp;*</font></td>
								<TD BGCOLOR=WHITE><input type=password name=repasswd size=8 maxlength=12 value="" style="width:80">수정을 하시려면 비밀번호를 한번 더 입력해주세요. </td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;우편번호<font color=red>&nbsp;</font></td>
								<TD BGCOLOR=WHITE>
									<table cellspacing=0 cellpadding=0>
										<tr>
											<td>
                  				<input type=text name=zipcode value = "${mvo.zipcode }" size=6 maxlength=6 readonly>
                  		</td>
                  		<td>
      									<a href = "#" onClick = "javascript:post_check()"><img src="./img/u_bt07.gif" hspace=2 border=0 name=img2 align=absmiddle></a>
 											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;주소<font color=red>&nbsp;</font></td>
								<TD BGCOLOR=WHITE>
									<input type=text name=addr1 value = "${mvo.addr1 }" size=50 maxlength=100 value="" readonly>
								</td>
							</tr>
							<tr>
								<TD BGCOLOR="#EFF4F8">&nbsp;나머지 주소<font color=red>&nbsp;</font></td>
								<TD BGCOLOR=WHITE>
									<input type=text name=addr2 value = "${mvo.addr2 }" size=50 maxlength=100 value="">
								</td>
							</tr>
							<tr>
               <TD BGCOLOR="#EFF4F8">&nbsp;전화번호<font color=red>&nbsp;*</font></td>
                <TD BGCOLOR=WHITE>
                  <input type=text name=tel size=13 maxlength=13 value="${mvo.tel }">
               </td>
              </tr>
              <tr>
                <TD BGCOLOR="#EFF4F8">&nbsp;E-mail
                	<font color=red>&nbsp;</font>
                </td>
                <td bgcolor=WHITE valign=middle>
                  <input type=text name=email size=30 maxlength=30 value="${mvo.email }">
                </td>
              </tr>
              <tr>
                <TD BGCOLOR="#EFF4F8">&nbsp;관심분야
                	<font color=red>&nbsp;</font>
                </td>
								<td bgcolor=WHITE valign=middle> 
									<input type="checkbox" name="fa" value="건강" <c:if test="${fn:contains(fa,'건강') }"> checked </c:if> >건강 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="fa" value="문화예술"<c:if test="${fn:contains(fa,'문화예술') }"> checked </c:if>>문화예술 &nbsp;&nbsp;
									<input type="checkbox" name="fa" value="경제" <c:if test="${fn:contains(fa,'경제') }"> checked </c:if>>경제 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="fa" value="연예오락" <c:if test="${fn:contains(fa,'연예오락') }"> checked </c:if>>연예오락 &nbsp;
									<input type="checkbox" name="fa" value="뉴스" <c:if test="${fn:contains(fa,'뉴스') }"> checked </c:if>>뉴스
									<br><input type="checkbox" name="fa" value="여행레져" <c:if test="${fn:contains(fa,'여행레져') }"> checked </c:if>>여행레져 &nbsp;&nbsp;
									<input type="checkbox" name="fa" value="생활" <c:if test="${fn:contains(fa,'생활') }"> checked </c:if>>생활 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="fa" value="스포츠" <c:if test="${fn:contains(fa,'스포츠') }"> checked </c:if>>스포츠 &nbsp;&nbsp;
									<input type="checkbox" name="fa" value="교육"<c:if test="${fn:contains(fa,'교육') }"> checked </c:if>>교육 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="fa" value="컴퓨터" <c:if test="${fn:contains(fa,'컴퓨터') }"> checked </c:if>>컴퓨터 &nbsp;&nbsp;
									<input type="checkbox" name="fa" value="학문" <c:if test="${fn:contains(fa,'학문') }"> checked </c:if>>학문 &nbsp;&nbsp;
								</td>
							
              </tr>
              <tr>
                <TD BGCOLOR="#EFF4F8">&nbsp;직업<font color=red>&nbsp;</font></td>
                <TD BGCOLOR=WHITE>
                  <select name=job class="formbox">
 										<option value="0">선택하세요 ---
 										<option value="회사원" <c:if test="${fn:contains(job,'회사원') }"> selected="selected" </c:if>>회사원
 										<option value="연구전문직" <c:if test="${fn:contains(job,'연구전문직') }"> selected="selected" </c:if>>연구전문직
 										<option value="교수학생" <c:if test="${fn:contains(job,'교수학생') }"> selected="selected" </c:if>>교수학생
 										<option value="일반자영업" <c:if test="${fn:contains(job,'일반자영업') }"> selected="selected" </c:if>>일반자영업
 										<option value="공무원" <c:if test="${fn:contains(job,'공무원') }"> selected="selected" </c:if>>공무원
 										<option value="의료인" <c:if test="${fn:contains(job,'의료인') }"> selected="selected" </c:if>>의료인
 										<option value="법조인" <c:if test="${fn:contains(job,'법조인') }"> selected="selected" </c:if>>법조인
 										<option value="종교,언론,에술인" <c:if test="${fn:contains(job,'종교.언론/예술인') }"> selected="selected" </c:if>>종교.언론/예술인
 										<option value="농,축,수산,광업인" <c:if test="${fn:contains(job,'농/축/수산/광업인') }"> selected="selected" </c:if>>농/축/수산/광업인
 										<option value="주부" <c:if test="${fn:contains(job,'주부') }"> selected="selected" </c:if>>주부
 										<option value="무직"<c:if test="${fn:contains(job,'무직') }"> selected="selected" </c:if>>무직
 										<option value="기타" <c:if test="${fn:contains(job,'기타') }"> selected="selected" </c:if>>기타
									</select>
								</td>                
              </tr>
              <tr>
                <TD BGCOLOR="#EFF4F8">&nbsp;자기소개<font color=red>&nbsp;</font></td>
                <TD BGCOLOR=WHITE>
                  <textarea cols=65 rows=5 name="intro">${mvo.intro }</textarea>
                </td>
                
              </tr>
              <input type ="hidden" name = "idx" value = "${mvo.idx }">
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
                  <a href = "#" onClick = "javascript:send()"><img src="./img/u_bt06.gif" vspace=3 border=0 name=img3></a>
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
