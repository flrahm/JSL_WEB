<%@page import="java.util.HashSet"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("utf-8");
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String kind = request.getParameter("kind");
	String open = request.getParameter("open");
	
	
/* 	HashSet<String> kindSet = new HashSet<String>();
	String[] kindArr = kind.split(",");
	for(int i = 0; i < kindArr.length; i++){
		kindSet.add(kindArr[i]);
	} */
	
	
%>

<html>
   <head><title>방명록 작성</title>
    <link rel="stylesheet" type="text/css" href="stylesheet.css">

  <script>
  function send(){
	  input.submit();
  }
  </script>
</head>
 <body topmargin="0" leftmargin="0">
 

 <table border="0" width="800">
 <tr>
   <td width="20%" height="500" bgcolor="#ecf1ef" valign="top">
   <!-- 다음에 추가할 부분 -->
   </td>
   <td width="80%" valign="top">&nbsp;<br>
     <img src="./img/bullet-01.gif"><font size="3" face="돋움" color="blue"> <b>방명록</b></font>
     <font size="2"> - 글쓰기</font><p>
     <img src="./img/bullet-03.gif"><font size="2" face="돋움" color="orange"> 잠깐</font> &nbsp;
     <img src="./img/bullet-02.gif"><font size="2" face="돋움">는 필수 입력 사항입니다.</font><p>
     <form method="post" action="guest_write_pro.jsp" name="input">
      <table border="0">
       <tr>
         <td width="5%" align="right"><img src="./img/bullet-02.gif"></td>
         <td width="15%"><font size="2 face="돋움"">공개여부</font></td>
         <td width="80%">
         <input type="radio" size="20" name="open" value = "1"
         <%if(open.equals("1")){ %> checked <% } %> >공개
         <input type="radio" size=	"20" name="open" value = "0" <% if(open.equals("0")){ %> checked <% } %> >비공개

         </td>
       </tr>
       <tr>
         <td width="5%" align="right"><img src="./img/bullet-02.gif"></td>
         <td width="15%"><font size="2 face="돋움"">글쓴이</font></td>
         <td width="80%">
         <input type="text" size="20" name="writer" value = <%=writer %>></td>
       </tr>
        <tr>
         <td width="5%" align="right"><img src="./img/bullet-02.gif"></td>
         <td width="15%"><font size="2 face="돋움"">글 종류</font></td>
         <td width="80%">
         
         <input type="checkbox" size="20" name="kind" value = "방문"
         <%if(kind.contains("방문")){ %> checked <% } %> >방문
         <input type="checkbox" size="20" name="kind" value = "손님"
         <%if(kind.contains("손님")){ %> checked <% } %> >손님
         <input type="checkbox" size="20" name="kind" value = "온라인" 
         <%if(kind.contains("온라인")){ %> checked <% }%> >온라인
         
         </td>
       </tr>
       <tr>
         <td align="right"><img src="./img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">제목</font></td>
         <td><input type="text" size="60" name="subject" value = <%=subject %>></td>
       </tr>
       <tr>
         <td align="right"><img src="./img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">내용</font></td>
         <td><textarea wrap="physical" rows="10" name="content" cols="60"><%=content %></textarea></td>
       </tr>
        <tr>
          <td align="right">&nbsp;</td>
          <td><font size="2">&nbsp;</font></td>
          <td>
                     <a href="#" onClick = "send()">◀등 록▶</a>&nbsp;&nbsp;&nbsp;
                     <a href="">◀취 소▶</a>
          </td>
        </tr>
      </table>
      </form>
    </td>
  </tr>
  </table>
  </body>
  </html>
