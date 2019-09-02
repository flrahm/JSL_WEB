<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title>게시판 수정</title>
<link rel="stylesheet" type="text/css" href="/stylesheet.css">
</head>

<c:if test="${flag==-1 }">
<script>
alert("비밀번호가 맞지 않습니다");
</script>
</c:if>

<script>

   function check(num) {
         if(input.subject.value==""){
            alert("제목을 입력하세요");
            input.subject.focus();
            return;
         }
         
         if(input.contents.value==""){
            alert("내용을 입력하세요");
            input.contents.focus();
            return;
         }
      
      /* if (input.pass.value == input.pw.value) {
         input.action = "boardmodify.do?num=" + num;
         input.submit();

      } else {
         alert("비밀번호가 일치하지 않습니다");
      } */
         input.action = "boardmodify.do?num=" + num;
         input.submit();
   }
</script>

<body topmargin="0" leftmargin="0">

   <jsp:include page="/include/topmenu.jsp"></jsp:include>

   <table border="0" width="800">
      <tr>
         <td width="20%" height="500" bgcolor="#ecf1ef" valign="top">
            <!-- 다음에 추가할 부분 "-->

         </td>
         <td width="80%" valign="top">&nbsp;<br> <img
            src="Board/img/bullet-01.gif"><font size="3" face="돋움"
            color="blue"> <b>자 유 게 시 판</b></font> <font size="2"> - 수정하기</font>
         <p>
               <img src="Board/img/bullet-03.gif"><font size="2" face="돋움"
                  color="orange"> 잠깐</font> &nbsp; <img
                  src="Board/img/bullet-02.gif"><font size="2" face="돋움">는
                  필수 입력 사항입니다.</font>
            <p>
          <form method="post" name="input" action="#" >

               <table border="0">
                  <tr>
                     <td width="5%" align="right"><img
                        src="Board/img/bullet-02.gif"></td>
                     <td width="15%"><font size="2 face="돋움"">글쓴이</font></td>
                     <td width="80%"><input type="text" size="20" name="name"
                        value="${vo.name }" readonly></td>
                  </tr>
                  <tr>
                     <td align="right">&nbsp;</td>
                     <td><font size="2 face="돋움"">메일주소</font></td>
                     <td><input type="text" size="20" name="email" value="${vo.email }"></td>
                  </tr>
                  <tr>
                     <td align="right"><img src="Board/img/bullet-02.gif"></td>
                     <td><font size="2" face="돋움">제 목</font></td>
                     <td><input type="text" size="60" name="subject" value="${vo.contents }"></td>
                  </tr>
                  <tr>
                     <td align="right"><img src="Board/img/bullet-02.gif"></td>
                     <td><font size="2" face="돋움">내용</font></td>
                     <td><textarea wrap="physical" rows="10" name="contents"
                           cols="60">${vo.contents }</textarea></td>
                  </tr>
                  <tr>
                     <td align="right"><img src="Board/img/bullet-02.gif"></td>
                     <td><font size="2" face="돋움">비밀번호</font></td>
                     <td><input type="password" size="10" name="pass"> <font
                        size="2" face="돋움">*.수정과 삭제시 꼭 입력하셔야 합니다.</font></td>
                  </tr>
                  <tr>
                     <td align="right">&nbsp;</td>
                     <td><font size="2">&nbsp;</font></td>
                     <td><a href="#" onClick="check(${vo.num})"><img
                           src="Board/img/edit2.gif" border=0></a>&nbsp; <a
                        href="boardview.do"><img src="Board/img/cancle.gif" border=0></a></td>
                  </tr>
                  <%-- <input type="hidden" name="pw" value="${vo.pass}"> --%>
               </table>
            </form>
         </td>
      </tr>
   </table>

   <jsp:include page="/include/copyright.jsp"></jsp:include>



</body>
</html>