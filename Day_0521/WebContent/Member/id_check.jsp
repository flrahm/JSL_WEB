<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String[] id = {"admin","jsl","sample","scott","jslhrd","oracle","servlet","jsp","java","administrator"};
	boolean isOverlap = false;
	for(int i = 0; i < id.length; i++){
		if(userid.equals(id[i])){
			isOverlap = true;
			break;
		}
	}
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

function a_or_d(str){	// 입력 문자가 숫자나 영문자인지 검사하는 메소드
	var lower_str = str.toLowerCase();
	for(i = 0; i < lower_str.length ; i++){
		ch = lower_str.charAt(i);
		if((ch >= 'a' && ch <= 'z' )||(ch >= '0') && (ch <= '9')){
			if(i == lower_str.length-1){
				return true;
			}
		}else
			return false;
	}
}

function id_validate(){	// id의 유효성을 검사하는 메소드
	//alert("id_check");	
	
	var userid = nameForm.userid;
	
	if(userid.value == ""){
		alert("아이디를 입력하세요");
		userid.focus();
		return false;
	} 
	
	if(userid.value.length < 5 || userid.value.length > 16){
		alert("5~16자 이내의 값을 입력해주세요");
		userid.focus();
		return false;
	} 
	
	if(!a_or_d(userid.value)){
		alert("아이디는 영문이나 숫자만 가능합니다")
		return false;
	}
	
		alert("사용 가능한 아이디 입니다")
		return true;
	
}

	function send(){
		if(id_validate() == false )
			return false;
		
		nameForm.submit();
	}
	
	function confirm(){
		opener.document.userinfo.userid.value ="<%=userid %>";
		self.close();
	}
</script>
</HEAD>
<BODY bgcolor="#FFFFFF">
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="./img/u_b02.gif"></td>
    <td align=center><FONT COLOR="#FFFFFF"><b>아이디 중복 체크</FONT></td>
    <td align=right><img src="./img/u_b03.gif"></td>
  </tr>
</table>
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
<TR BGCOLOR=#948DCF>
  <TD>
    <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0 WIDTH=330>
  	  <TR BGCOLOR="#FFFFFF">
        <TD ALIGN="center">
        <% if(!isOverlap) { %>
          <br><FONT FACE="굴림"><B>사용 가능합니다.</B></FONT><br>
         <BR><FONT COLOR="#483cae"><b><%=userid %></b></FONT>는 아직 사용되지 않은 아이디입니다.
         <BR><FONT COLOR="#483cae"><b><%=userid %></b></FONT>로 등록하셔도 됩니다.
         <%} else { %>
         <br><font face="굴림"><b>죄송합니다</b></font><br>
    	<BR><FONT COLOR="#483cae"><b><%=userid %></b></FONT>는 이미 사용 중인 아이디입니다<br>
    	다른 아이디를 사용하여 주십시오.
    	<%} %>
    	<form method = "get" name = "nameForm" action = "id_check.jsp" onSubmit = "return false">
           <INPUT NAME=userid type=text size=16 maxlength=16>
      	   <a href = "#" onClick = "send()"><input type=image src="./img/u_bt08.gif" border=0 vspace=0></a>
		</form>
        </TD>
      </TR>
    </TABLE>
 </TD>
</TR>
</TABLE>

<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="./img/u_b04.gif"></td>
    <td align=right><img src="./img/u_b05.gif"></td>
  </tr>
  <tr>
    <td colspan=3 align=center>
    <%if(!isOverlap){ %>
     <a href = "#" onClick = "confirm()"><img src="./img/u_bt13.gif" border=0 vspace=5></a>
     <%} %>
    </td>
  </tr>
</table>
</BODY>
</HTML>