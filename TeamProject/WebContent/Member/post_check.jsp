<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<HTML>
<HEAD>
<TITLE>우편번호 찾기</TITLE>

<STYLE TYPE="text/css">
<!--
body { font-family: 돋움, Verdana; font-size: 9pt}
td   { font-family: 돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000}
a    { font-family: 돋움, Verdana; color: #000000; text-decoration: none}
     a:link { font-family:돋움; font-size:9pt; text-decoration:none}
     a:visited { font-family:돋움; font-size:9pt; text-decoration:none}
     a:hover { font-family:돋움; text-decoration:underline }
-->
</STYLE>
</HEAD>

<script>


	function onSubmit(){
		if(postcheck.addr.value == "") {
			alert("동이름을 입력해주세요");
			postcheck.addr.focus();
			return;
		}else{
			postcheck.action = "postcheck.do";
			postcheck.submit();	
		}
		
	}

	function send(){
		opener.userinfoinsert.zipcode.value = document.postcheck.zipcode.value; 
		opener.userinfoinsert.addr1.value =document.postcheck.addr1.value; 
		self.close();
	}
	
</script>

<BODY BGCOLOR="#FFFFFF" onLoad="document.inquiry.addr.focus();">
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="Member/img/u_b02.gif"></td>
    <td align=center><FONT COLOR="#FFFFFF"><b>우편번호 찾기</FONT></td>
    <td align=right><img src= "Member/img/u_b03.gif"></td>
  </tr>
</table>

<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330><TR><TD BGCOLOR=#948DCF>
  <TABLE CELLPADDING=0 CELLSPACING=1 BORDER=0 WIDTH=330><TR><TD>
    <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=3 WIDTH=100% BGCOLOR=#FFFFFF>
    <FORM NAME="postcheck" METHOD="post">
      <TR>
        <TD ALIGN=CENTER><br>
          동이름 입력 : <INPUT NAME="addr" TYPE="text" style="width:120">
          <a href = "#" onClick = "onSubmit()"><Img src="Member/img/u_bt08.gif" hspace=10></a>
        </TD>
      </TR>
      <TR>
        <TD ALIGN=CENTER>
        ※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.
        </TD>
      </TR>
      <c:if test = "${zList.size() != null }"  > 
     <c:forEach var = "zList" items = "${zList }"> 
      
      <TR>
        <TD><a href = "#" onClick = "send()">${zList.zipcode } </a>${zList.sido } ${zList.gugun } ${zList.dong } ${zList.bunji }
        	<input type = "hidden" name = "addr1" value ="${addr }">
        	<input type = "hidden" name = "zipcode" value = "${zList.zipcode }">
        </TD>
      </TR>
      
      </c:forEach>
      </c:if>


    </FORM>
    </TABLE>
  </TD></TR></TABLE>
</TD></TR></TABLE>

<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="Member/img/u_b04.gif"></td>
    <td align=right><img src="Member/img/u_b05.gif"></td>
  </tr>
  <tr>
    <td colspan=2 align=center>
      <a href = "#" onClick = "onClose()"><img src="Member/img/u_bt13.gif" border=0 vspace=5></a>    </td>
  </tr>
</table>
</BODY>
</HTML>
