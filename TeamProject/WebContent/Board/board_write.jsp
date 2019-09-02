<%@ page contentType="text/html; charset=UTF-8" %>

<html>
   <head><title>게시판 작성</title>
    <link rel="stylesheet" type="text/css" href="/stylesheet.css">

</head>
<script>
function send(){
		if(input.name.value==""){
			alert("이름 입력");
			input.name.focus();
			return;
		}
		if(input.pass.value==""){
			alert("비밀번호 입력");
			input.pass.focus();
			return;
		}
		if(input.subject.value==""){
			alert("제목입력 입력");
			input.subject.focus();
			return;
		}
		if(input.contents.value==""){
			alert("내용 입력");
			input.subject.focus();
			return;
		}
	
	input.submit();
	}
	
	function reset(){
	 input.reset();	
	}
	
</script>	
 <body topmargin="0" leftmargin="0">
 
<jsp:include page = "/include/topmenu.jsp"></jsp:include>

 <table border="0" width="800">
 <tr>
   <td width="20%" height="500" bgcolor="#ecf1ef" valign="top">

   <!-- 다음에 추가할 부분 -->

   </td>

   <td width="80%" valign="top">&nbsp;<br>
     <img src="Board/img/bullet-01.gif"><font size="3" face="돋움" color="blue"> <b>반갑습니다</b></font>
     <font size="2"> - 글쓰기</font><p>
     <img src="Board/img/bullet-03.gif"><font size="2" face="돋움" color="orange"> 잠깐</font> &nbsp;
     <img src="Board/img/bullet-02.gif"><font size="2" face="돋움">는 필수 입력 사항입니다.</font><p>
   <form method="post" action="boardwrite.do" name="input">

	  <table border="0">
       <tr>
         <td width="5%" align="right"><img src="Board/img/bullet-02.gif"></td>
         <td width="15%"><font size="2 face="돋움"">글쓴이</font></td>
         <td width="80%">
         <input type="text" size="20" name="name"></td>
       </tr>
       <tr>
         <td align="right">&nbsp;</td>
         <td ><font size="2 face="돋움"">메일주소</font></td>
         <td>
          <input type="text" size="20" name="email"></td>
       </tr>
	   <tr>
         <td align="right"><img src="Board/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">제목</font></td>
         <td><input type="text" size="60" name="subject" ></td>
       </tr>
       <tr>
         <td align="right"><img src="Board/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">내용</font></td>
         <td><textarea wrap="physical" rows="10" name="contents" cols="60"></textarea></td>
       </tr>
	   <tr>
         <td align="right"><img src="Board/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">비밀번호</font></td>
          <td><input type="password" size="10" name="pass" ><font size="2" face="돋움">*.수정과 삭제시 꼭 입력하셔야 합니다.</font></td>
        </tr>
        <tr></tr>
		<tr>
          <td align="right">&nbsp;</td>
          <td><font size="2">&nbsp;</font></td>
          <td>
                     <a href="#" onClick = "send()"><img src="Board/img/save.gif" border=0></a>&nbsp;&nbsp;&nbsp;
                     <a href="reset()"><img src="Board/img/cancle.gif" border=0></a>
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
