<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
          <td height=40 align="center" style="font-size: 15px;"><b>회원</b></a>
          </b></td>
        </tr>
      </table><br>
      <table width="80%" border="1" cellspacing="0" cellpadding="2" bordercolorlight="#173E7C" bordercolordark="white">
  <tr>
    <td width="18%" align="center" bgcolor="EcECEC"><strong>아이디</strong></td>
    <td width="32%"bgcolor="ffffff">${vo.userid }</td>
    <td width="18%" align="center" bgcolor="EcECEC"><strong>성명</strong></td>
    <td width="32%"align="center" bgcolor="ffffff">${vo.name }</td>
  </tr>
  <tr>
    <td align="center" bgcolor="EcECEC"><strong>전화번호</strong></td>
    <td bgcolor="ffffff">${vo.tel }</td>
    <td align="center" bgcolor="EcECEC"><strong>이메일</strong></td>
    <td align="center" bgcolor="ffffff">${vo.email }</td>
  </tr>
  <tr>
    <td align="center" bgcolor="EcECEC"><strong>직업</strong></td>
    <td bgcolor="ffffff">${vo.job }</td>
    <td align="center" bgcolor="EcECEC"><strong>마일리지</strong></td>
    <td align="center" bgcolor="ffffff">0</td>
  </tr>
  <tr bgcolor="EcECEC">
    <td align="center" bgcolor="EcECEC"><strong>관심분야</strong></td>
    <td colspan=3 bgcolor="ffffff">${vo.favorite }</td>
  </tr>
  <tr bgcolor="EcECEC">
    <td align="center" bgcolor="EcECEC"><strong>자기소개</strong></td>
    <td colspan=3 bgcolor="ffffff">${vo.intro }</td>
  </tr>
  <tr>
    <td align="center" bgcolor="EcECEC"><strong>가입일자</strong></td>
    <td bgcolor="ffffff">${vo.first_time }</td>
    <td align="center" bgcolor="EcECEC"><strong>최근접속일</strong></td>
    <td align="center" bgcolor="ffffff">${vo.last_time }</td>
  </tr>
</table>
<a href = "adminmemberlist.do">[목록]</a>
<a href = "adminmemberlist.do">[수정]</a>