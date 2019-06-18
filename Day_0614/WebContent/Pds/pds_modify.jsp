<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String filepath = "E:/라이브러리/문서/WebExam/Day_0614/WebContent/Pds/upload/";
	String filename = "icon_27.png";
	File file = new File(filepath+filename);
	pageContext.setAttribute("file", file);
%>

<html>
<head><title>자료 등록 수정</title><link rel="stylesheet" type="text/css" href="/stylesheet.css">
</head>
<body topmargin="0" leftmargin="0">
<form name = "modifyFrm" method = "post" action = "modify" enctype="multipart/form-data">
<input type = "hidden" name = "num" value = ${pvo.num }>
<table border="0" width="800">
<tr>
  <td width="20%" height="500" valign="top" bgcolor="#ecf1ef">

  <!--  로그인 폼 추가부분 -->
  
  </td>
  <td width="80%" valign="top">&nbsp;<br>
  <img src="/Day_0614/Pds/img/bullet-01.gif"><font size="3" face="돋움" color="blue">
  <b> 뮤직자료실</b></font><font size="2"> - 자료 수정하기</font><p>
  <img src="/Day_0614/Pds/img/bullet-03.gif"><font size="2" face="돋움" color="orange"> 잠깐</font> &nbsp;
  <img src="/Day_0614/Pds/img/bullet-02.gif"><font size="2" face="돋움">는 필수 입력 사항입니다.</font><p>

		<table border="0">
    <tr>
      <td width="5%" align="right"><img src="/Day_0614/Pds/img/bullet-02.gif"></td>
      <td width="15%"><font size="2 face="돋움"">글쓴이</font></td>
      <td width="80%"><input type="text" size="20" name="name" value = "${pvo.name }" ></td></tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td ><font size="2 face="돋움"">메일주소</font></td>
      <td><input type="text" size="20" name="email" ></td></tr>
    <tr>
      <td align="right"><img src="/Day_0614/Pds/img/bullet-02.gif"></td>
      <td><font size="2" face="돋움">제목</font></td>
      <td><input type="text" size="60" name="subject" value = "${pvo.subject }" ></td></tr>
    <tr>
      <td align="right"><img src="/Day_0614/Pds/img/bullet-02.gif"></td>
      <td><font size="2" face="돋움">자료설명</font></td>
      <td><textarea wrap="physical" rows="10" name="contents" cols="60">${pvo.contents }</textarea></td></tr>
    <tr>
      <td align="right"><img src="/Day_0614/Pds/img/bullet-02.gif"></td>
      <td><font size="2" face="돋움">파일첨부</font></td>
      <td><input type="file" name="filename" size="30" value = "${file }" ></td></tr>
    <tr>
      <td align="right"><img src="/Day_0614/Pds/img/bullet-02.gif"></td>
      <td><font size="2" face="돋움">비밀번호</font></td>
      <td><input type="password" size="10" name="pass"></td></tr>
    <tr>
    
      <td align="right">&nbsp;</td>
      <td><font size="2">&nbsp;</font></td>
      <td><input type="button" value="수정하기" onClick = "modifyFrm.submit()" >&nbsp;
      <input type="button" value="돌아가기" ></td></tr>
    </table></td>
  </tr>
  </table>
  </form>
</body>
</html>
