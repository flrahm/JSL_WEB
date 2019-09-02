<%@ page contentType="text/html; charset=UTF-8" %>

<html>
   <head><title> 자료 올리기 </title>
   </head> 
   
<script>

	function onSubmit(){
		if(pdswrite.name.value==""){
			alert("이름을 입력해주세요");
			pdswrite.name.focus();
			return;
		}else {
			pdswrite.email.focus();
		}
		if(pdswrite.email.value==""){
			alert("이메일을 입력해주세요");
			pdswrite.email.focus();
			return;
		}else {
			pdswrite.subject.focus();
		}
		if(pdswrite.subject.value==""){
			alert("제목을 입력해주세요");
			pdswrite.subject.focus();
			return;
		}else {
			pdswrite.contents.focus();
		}
		if(pdswrite.contents.value==""){
			alert("내용을 입력해주세요");
			pdswrite.contents.focus();
			return;
		}else {
			pdswrite.filename.focus();
		}
		if(pdswrite.filename.value==""){
			alert("파일을 첨부해주세요");
			pdswrite.filename.focus();
			return;
		}else {
			pdswrite.pass.focus();
		}
		if(pdswrite.pass.value==""){
			alert("비밀번호 입력해주세요");
			pdswrite.pass.focus();
			return;
		}
			
		pdswrite.action= "pdswrite.do";
		pdswrite.submit();
	}

</script>
   
<body>

<jsp:include page = "/include/topmenu.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="stylesheet.css">

<table border="0" width="800">
 <tr>
   <td width="20%" height="500" bgcolor="#ecf1ef" valign="top">

<!--     다음에 추가할 로그인  -->

   </td>
   <td width="80%" valign="top">&nbsp;<br>
     <img src="Pds/img/bullet-01.gif"><font size="3" face="돋움" color="blue"> <b>참 좋은 자료실</b></font>
     <font size="2"> - 자료올리기</font><p>
     <img src="Pds/img/bullet-03.gif"><font size="2" face="돋움" color="orange"> 잠깐</font> &nbsp;
     <img src="Pds/img/bullet-02.gif"><font size="2" face="돋움">는 필수 입력 사항입니다.</font><p>
	<form name = "pdswrite" method = "post" enctype="multipart/form-data">
	  <table border="0" >
		<tr>
         <td width="5%" align="right"><img src="Pds/img/bullet-02.gif"></td>
         <td width="15%"><font size="2" face="돋움">글쓴이</font></td>
         <td width="80%">
			<input type="text" size="20" name="name"></td>
		</tr>
		<tr> 
		  <td align="right">&nbsp;</td>
          <td><font size="2" face="돋움">메일주소</font></td>
		  <td><input type="text" size="20" name="email"></td>
		</tr>	
       <tr>
         <td align="right"><img src="Pds/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">제목sub</font></td>
         <td><input type="text" size="60" name="subject"></td>
       </tr>
       <tr>
         <td align="right"><img src="Pds/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">내용</font></td>
         <td><textarea wrap="physical" rows="10" name="contents" cols="60"></textarea></td>
       </tr>
		<tr>
		  <td align="right"><img src="Pds/img/bullet-02.gif"></td>
		  <td><font size="2" face="돋움">파일첨부</font></td>
		  <td><input type="file" name="filename" size="30"></td></tr>
		<tr>
       <tr>
         <td align="right"><img src="Pds/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">비밀번호</font></td>
          <td><input type="password" size="10" name="pass" > 
          <font size="2" face="돋움">*.게시글의 수정 및 삭제시 필요.</font>
         </td>
        </tr>

		<tr></tr>			<tr></tr>
          <td align="right">&nbsp;</td>
          <td><font size="2">&nbsp;</font></td>
          <td align=center>
			<a href = "#" onClick = "onSubmit()"><img src="Pds/img/purple_save.gif" width="56" height="18" border="0"></a>
			<a href = "pdslist.do"><img src="Pds/img/purple_cancle.gif" width="56" height="18" border="0"></a>

		  </td>
        </tr>
      </table>
      </form>
    </td>
  </tr>
 </table>

<jsp:include page="/include/copyright.jsp"></jsp:include>

</body>		
</html>
