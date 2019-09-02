<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
<head><title>자료 등록 수정</title><link rel="stylesheet" type="text/css" href="/stylesheet.css">
</head>

<script>

	function onSubmit(){
		if(pdsmodify.name.value==""){
			alert("이름을 입력해주세요");
			pdsmodify.name.focus();
			return;
		}else {
			pdsmodify.email.focus();
		}
		if(pdsmodify.email.value==""){
			alert("이메일을 입력해주세요");
			pdsmodify.email.focus();
			return;
		}else {
			pdsmodify.subject.focus();
		}
		if(pdsmodify.subject.value==""){
			alert("제목을 입력해주세요");
			pdsmodify.subject.focus();
			return;
		}else {
			pdsmodify.contents.focus();
		}
		if(pdsmodify.contents.value==""){
			alert("내용을 입력해주세요");
			pdsmodify.contents.focus();
			return;
		}else {
			pdsmodify.filename.focus();
		}
		if(pdsmodify.filename.value==""){
			alert("파일을 첨부해주세요");
			pdsmodify.filename.focus();
			return;
		}else {
			pdsmodify.pass.focus();
		}
		if(pdsmodify.pass.value==""){
			alert("비밀번호 입력해주세요");
			pdsmodify.pass.focus();
			return;
		}
		if(pdsmodify.passed.value != pdsmodify.pass.value){
			alert("비밀번호가 일치하지 않습니다.");
			namae.pass.focus();
			return;
		}
			pdsmodify.action.value = "pdsmodify.do";
			pdsmodify.submit();
	}
	
	function onBack(){
		location.href = "pdsview.do";
	}
	
</script>


<body topmargin="0" leftmargin="0">

<jsp:include page = "/include/topmenu.jsp"></jsp:include>

<input type="hidden" name="num" value="${vo.num }" >
<table border="0" width="800">
<tr>
  <td width="20%" height="500" valign="top" bgcolor="#ecf1ef">

  <!--  로그인 폼 추가부분 -->
  
  </td>
  <td width="80%" valign="top">&nbsp;<br>
  <img src="Pds/img/bullet-01.gif"><font size="3" face="돋움" color="blue">
  <b> 뮤직자료실</b></font><font size="2"> - 자료 수정하기</font><p>
  <img src="Pds/img/bullet-03.gif"><font size="2" face="돋움" color="orange"> 잠깐</font> &nbsp;
  <img src="Pds/img/bullet-02.gif"><font size="2" face="돋움">는 필수 입력 사항입니다.</font><p>

	<form name = "pdsmodify" method = "post" enctype="multipart/form-data">
	<table border="0">
    <tr>
      <td width="5%" align="right"><img src="Pds/img/bullet-02.gif"></td>
      <td width="15%"><font size="2 face="돋움"">글쓴이</font></td>
      <td width="80%"><input type="text" size="20" name="name" value="${vo.name}"></td></tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td ><font size="2 face="돋움"">메일주소</font></td>
      <td><input type="text" size="20" name="email" value="${vo.email}" ></td></tr>
    <tr>
      <td align="right"><img src="Pds/img/bullet-02.gif"></td>
      <td><font size="2" face="돋움">제목</font></td>
      <td><input type="text" size="60" name="subject" value="${vo.subject}"></td></tr>
    <tr>
      <td align="right"><img src="Pds/img/bullet-02.gif"></td>
      <td><font size="2" face="돋움">자료설명</font></td>
      <td><textarea wrap="physical" rows="10" name="contents" cols="60">${vo.contents}</textarea></td></tr>
    <tr>
      <td align="right"><img src="Pds/img/bullet-02.gif"></td>
      <td><font size="2" face="돋움">파일첨부</font></td>
     <td><input type="file" name="filename" size="30" >
      <input type="text" name="file1" size="30" value="${vo.filename}"></td></tr>
    <tr>
      <td align="right"><img src="Pds/img/bullet-02.gif"></td>
      <td><font size="2" face="돋움">비밀번호</font></td>
      <td><input type="password" size="10" name="pass" value=""></td>
      <input type="hidden" name="passed" value="${vo.pass }">
      </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td><font size="2">&nbsp;</font></td>
      <td><a href = "#" onClick = "onSubmit()"><input type="button" value="수정하기" ></a>&nbsp;
      <a href = "#" onClick = "onBack()"><input type="button" value="돌아가기" ></a></td></tr>
    </table>
    </form>    
    </td>
  </tr>
  </table>

<jsp:include page="/include/copyright.jsp"></jsp:include>

</body>
</html>
