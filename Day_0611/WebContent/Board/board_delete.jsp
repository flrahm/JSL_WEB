<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String flag = request.getParameter("flag");
	String num = request.getParameter("num");
	pageContext.setAttribute("flag", flag);
	pageContext.setAttribute("num", num);
 %>
<html>
<head><title>방명록 삭제</title>
 <link rel="stylesheet" type="text/css" href="/stylesheet.css">
 
 <script>
 	function check(){
 		if(!confirm("삭제하시겠습니까?")){
 			return false;
 		}
 		
 		deleteFrm.submit();
 	}
 
 </script>
 
 </head>
 <body>
<c:if test="${flag == 1 }">
<script>
	alert("삭제되었습니다");
	opener.location.href="/Day_0611/board_list.do";
	self.close();
</script>
</c:if>

 <form method="post" name = "deleteFrm" action = "/Day_0611/board_delete.do" >
   <table border="0" cellpadding="0" cellspacing="0" width="300" align="center">
     <tr>
       <td height="50">
       <img src="/Day_0611/Board/img/bullet-05.gif"><b><font size="3" color="red">잠깐 !!</font></b></td></tr>
     <tr>
       <td valign="middle" height="30">
       <c:if test="${flag == -1 }">
        <font size="1" face="돋움" color="#c00">비밀번호가 일치하지 않습니다</font><br>
       </c:if>
       
       <font size="2" face="돋움">게시물은 작성하신 분만 삭제할 수 있습니다.<br>
       글작성시 입력한 비밀번호를 입력해 주세요...</font></td></tr>
     <tr>
       <td valign="middle" height="40">
       <font size="2" face="돋움">
       비밀번호 <input type="password" name="pass" size="8"></font>
       <input type = "hidden" name = "num" value = ${num }>
       <input type="submit" value="삭제" onClick = "check()">
       <input type="button" value="닫기" onClick = "self.close()"></td></tr>
   </table>
   </form>
 </body>
 </html>
