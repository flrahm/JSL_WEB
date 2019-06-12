<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

 %>
<HTML>
<HEAD>
<TITLE>로그온</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<STYLE TYPE="text/css">
<!--
body { font-family: 돋움, Verdana; font-size: 9pt}
td   { font-family: 돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000; 
      BACKGROUND-POSITION: left top; BACKGROUND-REPEAT: no-repeat;}
//-->
</STYLE>
</HEAD>
<script>
	function check(){
		if(loginFrm.userid.value == ""){
			alert('아이디는 필수 입력입니다');
			loginFrm.userid.focus();
			return false;
		}
		
		if(loginFrm.passwd.value == ""){
			loginFrm.pass.focus();
			alert('비밀번호는 필수 입력입니다');
			return false;
		}
		
		
		loginFrm.submit();
	}
</script>


<body bgcolor="#FFFFFF" text="#000000" leftmargin=0 
  topmargin=0 onLoad='document.fname.user_id.focus();'>
  					     	<c:if test="${param.flag == -1 }"> 아이디가 없습니다.</c:if> 
					     	<c:if test="${param.flag == 0 }"> 비밀번호가 틀렸습니다.</c:if> 
<br><br>
<TABLE width="683" border="0" cellspacing="0" cellpadding="0" height="265">
<TR>
  <TD width=100>&nbsp;</td>
  <TD>
    <table width="583" border="0" cellspacing="0" cellpadding="0" height="265">
	  <form name=loginFrm method=post action="../userlogin.do"  onSubmit="return check_submit()">
	    <tr>
		  <td height="298"> 
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr> 
			    <td width="9"><img src="./img/h_b02.gif" width="9" height="21"></td>
				<td bgcolor="7aaad5"> 
				 <div align="center"><font color="#FFFFFF"><b>Member Login</b></font></div>
				 </td>
				 <td width="9"><img src="./img/f_b03.gif" width="9" height="21"></td>
			  </tr>
			 </table>
			 <table border="0" cellpadding="0" cellspacing="0" width="550">
			   <tr> 
			     <td bgcolor="#7aaad5"> 
				   <table border="0" cellpadding="3" cellspacing="1" width="99%" height="321">
				     <tr bgcolor="#FFFFFF"> 
					   <td align=CENTER bgcolor="#eff4f8" height="92"> 
					     <table width="330" border="0" cellspacing="0" cellpadding="1">

							<tr valign=bottom> 
							  <td width="21"><img src="./img/h_bl02.gif" width="18" height="16"></td>
							  <td width="55" nowrap>아 이 디</td>
							  <td width="175">: 
								<input type=text name="userid" size=16 maxlength=16 STYLE="WIDTH:155">
							  </td>
							  <td width="79"></td>
							</tr>
							<tr valign=bottom> 
							  <td><img src="./img/h_bl02.gif" width="18" height="16"></td>
							  <td nowrap>비밀번호</td>
							  <td>: 
								<input type=password name="passwd" size=14 maxlength=12 STYLE="WIDTH:155">
							  </td>
							  <td><input type=image src="./img/login.gif" border=0 align=absmiddle onClick = "javascript:return check();"></td>
							</tr>
						  </table>
						</td>
					  </tr>
					  <tr bgcolor="#FFFFFF"> 
						<td bgcolor="#ffffff" align=CENTER height="138"> 
						  <table width="600" border="0" cellspacing="0" cellpadding="0">
							<tr> 
							  <td> 
								<table cellpadding=2 cellspacing=0 align=center border=0>
								  <tr> 
									<td> 
										<p style="LINE-HEIGHT:15PX;"><font color="#AFAFB1">
										이곳은 JSP를 배우고자 하는 분이면 누구나
										   <FONT COLOR="#006F70">회원가입 할 수 있는 </FONT>곳입니다.<BR><BR>
									</td> 
								  </tr> 
					              <tr> 
							        <td> 
							          <p style="LINE-HEIGHT:15PX;"><font color="#AFAFB1">아이디가 
								      없으신 분은 
							          <font color="#ff7508">이용자가입</font>을 하시기 바랍니다.<br>
							            <br>
							            <br>
							          </p>
							       </td>
							      </tr>
						         </table>
						       </td>
					         </tr>
					       </table>
				         </td>
				       </tr>
			         </table>
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr> 
				  <td width="9"><img src="./img/h_b04.gif" width="12" height="11"></td>
				  <td bgcolor="7aaad5" width="612"> 
					<div align="center"></div>
				  </td>
				  <td width="10"><img src="./img/h_b05.gif" width="12" height="11"></td>
				</tr>
			  </table>
			</td>
  		</tr>
		</table>
	</TD>
</TR>
</TABLE>
</body>
</html>

