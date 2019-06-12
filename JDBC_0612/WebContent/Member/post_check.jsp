<%@page import="member.vo.ZipSampleVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
	List<ZipSampleVO> zList = (List) request.getAttribute("zList");
	pageContext.setAttribute("zList", zList);
%>
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
<script>
	function check(){
		
		if(inquiry.addr.value == ""){
			alert("값을 입력하세요");
			return false;
		}
		
		inquiry.submit();
	}	
	
	function send(zipcode, addr1){
		
		opener.insertFrm.zipcode.value = zipcode;
		opener.insertFrm.addr1.value = addr1;
		opener.insertFrm.addr2.value = "";
		opener.insertFrm.addr2.readonly = true;
		self.close();
		
	}
</script>
</HEAD>
<BODY BGCOLOR="#FFFFFF" onLoad="document.inquiry.addr.focus();">
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="/JDBC_0612/Member/img/u_b02.gif"></td>
    <td align=center><FONT COLOR="#FFFFFF"><b>우편번호 찾기</FONT></td>
    <td align=right><img src= "/JDBC_0612/Member/img/u_b03.gif"></td>
  </tr>
</table>
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330><TR><TD BGCOLOR=#948DCF>
  <TABLE CELLPADDING=0 CELLSPACING=1 BORDER=0 WIDTH=330><TR><TD>
    <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=3 WIDTH=100% BGCOLOR=#FFFFFF>
    <FORM NAME="inquiry" METHOD="post" ACTION="/JDBC_0612/post_check.do">
      <TR>
        <TD ALIGN=CENTER><br>
          동이름 입력 : <INPUT NAME="addr" TYPE="text" style="width:120">
         <a href = "#" onClick = "javascript:check()"> <INPUT TYPE="image" src="/JDBC_0612/Member/img/u_bt08.gif" hspace=10></a>
        </TD>
      </TR>
      <TR>
        <TD ALIGN=CENTER>
        ※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.
        </TD>
      </TR>
	<c:forEach var="zipVO" items="${zList }">      
      <TR>
        <TD><a href = "#" onClick = "javascript:send('${zipVO.zipcode}','${zipVO.addr1 }')">${zipVO.zipcode } &nbsp; ${zipVO.addr1 }</a>
        </TD>
      </TR>
      </c:forEach>
    </FORM>
    </TABLE>
  </TD></TR></TABLE>
</TD></TR></TABLE>
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="/JDBC_0612/Member/img/u_b04.gif"></td>
    <td align=right><img src="/JDBC_0612/Member/img/u_b05.gif"></td>
  </tr>
  <tr>
    <td colspan=2 align=center>
      <A href = "#" onClick = "self.close()"><img src="/JDBC_0612/Member/img/u_bt13.gif" border=0 vspace=5></A>    </td>
  </tr>
</table>
</BODY>
</HTML>