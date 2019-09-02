<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
<title>회원목록 보여주기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<STYLE TYPE="text/css">
<!--
body { font-family: 돋움, Verdana; font-size: 9pt}
td   { font-family: 돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000} 
--->
</STYLE>
</head>
<body>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr><td><jsp:include page="top_menu.jsp" flush="true" /></td></tr>
  <tr>
    <td align="center" height="100%" valign=middle><br>
      <table width="30%" border="1" cellspacing="0" cellpadding="3" bgcolor="#FFCC66" bordercolor="#FFFFFF" bordercolorlight="#000000">
        <tr> 
          <td height=40 align="center" style="font-size: 15px;"><b>관리자</b></a>
          </b></td>
        </tr>
      </table><br>
      <table width="80%" border="1" cellspacing="0" cellpadding="2" bordercolorlight="#173E7C" bordercolordark="white">

  <tr>
    <td width="18%" align="center" bgcolor="EcECEC"><strong>아이디</strong></td>
    <td width="32%"bgcolor="ffffff">${vo.adminid }</td>
    <td width="18%" align="center" bgcolor="EcECEC"><strong>비밀번호</strong></td>
    <td width="32%"align="center" bgcolor="ffffff">${vo.adminpass }</td>
  </tr>
  <tr>
    <td align="center" bgcolor="EcECEC"><strong>등록일자</strong></td>
    <td bgcolor="ffffff">${vo.indate }</td>
    <td align="center" bgcolor="EcECEC"><strong>등급</strong></td>
    <td align="center" bgcolor="ffffff">${vo.rate }</td>
  </tr>
</table>
  <a href = "adminlist.do">[목록]</a>
