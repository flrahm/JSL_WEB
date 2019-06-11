<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("utf-8");
%>
   <head><title>게시판 수정</title>
    <link rel="stylesheet" type="text/css" href="/stylesheet.css">

<script>
	function modifyFrm_check(){
		
		if(modifyFrm.name.value == ""){
			alert("글쓴이는 필수 입력입니다");
			modifyFrm.name.focus();
			return false;
		}
		
		if(modifyFrm.subject.value == ""){
			alert("제목은 필수 입력입니다");
			modifyFrm.subject.focus();
			return false;
		}
		
		if(modifyFrm.contents.value == ""){
			alert("내용은 필수 입력입니다");
			modifyFrm.contents.focus();
			return false;
		}
		
		if(modifyFrm.pass.value == ""){
			alert("비밀번호는 필수 입력입니다");
			modifyFrm.pass.focus();
			return false;
		}
		
		modifyFrm.submit();	
	}
</script>
</head>

 <body topmargin="0" leftmargin="0">

<c:if test="${param.flag == -1 }">
	<script>
		alert('비밀번호가 일치하지 않습니다');
	</script>
</c:if>

 <table border="0" width="800">
 <tr>
   <td width="20%" height="500" bgcolor="#ecf1ef" valign="top">

   <!-- 다음에 추가할 부분 "-->

   </td>
   <td width="80%" valign="top">&nbsp;<br>
     <img src="/Day_0611/Board/img/bullet-01.gif"><font size="3" face="돋움" color="blue"> <b>자 유 게 시 판</b></font>
     <font size="2"> - 수정하기</font><p>
     <img src="/Day_0611/Board/img/bullet-03.gif"><font size="2" face="돋움" color="orange"> 잠깐</font> &nbsp;
     <img src="/Day_0611/Board/img/bullet-02.gif"><font size="2" face="돋움">는 필수 입력 사항입니다.</font><p>
     
     <form method="post" name = "modifyFrm" action = "/Day_0611/board_modify.do">

      <table border="0">
       <tr>
         <td width="5%" align="right"><img src="/Day_0611/Board/img/bullet-02.gif"></td>
         <td width="15%"><font size="2 face="돋움"">글쓴이</font></td>
         <td width="80%">
         <input type="text" size="20" name="name" value="${bvo.name }" readonly></td>
       </tr>
       <tr>
         <td align="right">&nbsp;</td>
         <td ><font size="2 face="돋움"">메일주소</font></td>
         <td>
          <input type="text" size="20" name="email" value="${bvo.email }"></td>
       </tr>
       <tr>
         <td align="right"><img src="/Day_0611/Board/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">제 목</font></td>
         <td><input type="text" size="60" name="subject" value="${bvo.subject }"></td>
       </tr>
       <tr>
         <td align="right"><img src="/Day_0611/Board/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">내용</font></td>
         <td><textarea wrap="physical" rows="10" name="contents" cols="60" >${bvo.contents }</textarea></td>
       </tr>
       <tr>
         <td align="right"><img src="/Day_0611/Board/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">비밀번호</font></td>
          <td><input type="password" size="10" name="pass" >
          <input type = "hidden" name = "num" value = "${bvo.num }" >
		  <font size="2" face="돋움">*.수정과 삭제시 꼭 입력하셔야 합니다.</font></td>
        </tr>
        <tr>
          <td align="right">&nbsp;</td>
          <td><font size="2">&nbsp;</font></td>
          <td><a href="#" onClick = "javascript:modifyFrm_check()"><img src="/Day_0611/Board/img/edit2.gif" border=0></a>&nbsp;
          <a href="#" onClick = "javascript:reset()"><img src="/Day_0611/Board/img/cancle.gif" border=0></a></td></tr>
      </table>
      </form>
    </td></tr>
  </table>
  </body>
  </html>
