<%@ page contentType="text/html; charset=UTF-8" %>

<html>
   <head><title>방명록 작성</title>
    <link rel="stylesheet" type="text/css" href="stylesheet.css">

  
</head>
<script>
	function name_check(){
		
		
		var name = input.name;
		
		if(name.value==""){
			alert("글쓴이는 필수 입력입니다");
			name.focus();
			return false;
		}
		
		return true;
	}
	
	function subject_check(){
		var subject = input.subject;
		if(subject.value==""){
			alert("제목은 필수 입력입니다");
			subject.focus();
			return false;
		}
		
		return true;
	}
	
	function content_check(){
		var content = input.content;
		if(content.value==""){
			alert("제목은 필수 입력입니다");
			content.focus();
			return false;
		}
		
		return true;
	}
	
	function input_check(){
		//alert("등록 테스트");
		if(name_check() == false)
			return;
		if(subject_check() == false)
			return;
		if(content_check() == false)
			return; 
		
		
		
		
		input.submit();
		
	}


</script>
 <body topmargin="0" leftmargin="0">
 
 <!--  상단 메뉴 추가 -->
 
 <%@ include file = "../include/topmenu.jsp" %>		<!-- ../ : 상위 폴더로 이동한 다음에(상대 경로) -->
 <!-- include 후에는 이미지 경로들을 다 바꾸어주어야 함 -->
 
 
 <table border="0" width="800">
 <tr>
   <td width="20%" height="500" bgcolor="#ecf1ef" valign="top">
   <!--로그인 폼 추가 -->
   <%@ include file = "../include/login_form.jsp" %>
   </td>
   <td width="80%" valign="top">&nbsp;<br>
     <img src="./img/bullet-01.gif"><font size="3" face="돋움" color="blue"> <b>방명록</b></font>
     <font size="2"> - 글쓰기</font><p>
     <img src="./img/bullet-03.gif"><font size="2" face="돋움" color="orange"> 잠깐</font> &nbsp;
     <img src="./img/bullet-02.gif"><font size="2" face="돋움">는 필수 입력 사항입니다.</font><p>
     <form method="post" action="guest_write_ok.jsp" name="input">
      <table border="0">
       <tr>
         <td width="5%" align="right"><img src="./img/bullet-02.gif"></td>
         <td width="15%"><font size="2 face="돋움"">글쓴이</font></td>
         <td width="80%">
         <input type="text" size="20" name="name"></td>
       </tr>
       <tr>
         <td align="right"><img src="./img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">제목</font></td>
         <td><input type="text" size="60" name="subject"></td>
       </tr>
       <tr>
         <td align="right"><img src="./img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">내용</font></td>
         <td><textarea wrap="physical" rows="10" name="content" cols="60"></textarea></td>
       </tr>
        <tr>
          <td align="right">&nbsp;</td>
          <td><font size="2">&nbsp;</font></td>
          <td>
                     <a href="#" onClick = input_check()> ◀등 록▶ </a>&nbsp;&nbsp;&nbsp;
                     <a href="#">◀취 소▶</a>
          </td>
        </tr>
      </table>
      </form>
    </td>
  </tr>
  </table>
  </body>
  </html>
