<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head><title>방명록 삭제</title>
 <link rel="stylesheet" type="text/css" href="/stylesheet.css">
 </head>
 
<script>

	function onSubmit(){
		self.close();
	}
	
	function onClose(){
		self.close();
	}

</script>
 
 <body>
 <form name = "guestdelete" method = "post">
   <input type="hidden" name="idx" value="">
   <input type="hidden" name="page" value="">
   <table border="0" cellpadding="0" cellspacing="0" width="300" align="center">
     <tr>
       <td height="50">
       <img src="Guest/img/bullet-05.gif"><b><font size="3" color="red">잠깐 !!</font></b></td></tr>
     <tr>
       <td valign="middle" height="30">
       <font size="2" face="돋움">게시물은 작성하신 분만 삭제할 수 있습니다.<br>
       글의 비밀번호를 입력해 주세요...</font></td></tr>
     <tr>
       <td valign="middle" height="40">
       <font size="2" face="돋움">
       비밀번호 <input type="password" name="pwd" size="8"></font>
       <a href = "#" onClick = "onSubmit()"><input type="button" value="삭제"></a>
       <a href = "#" onClick = "onClose()"><input type="button" value="닫기"></a></td></tr>
   </table>
   </form>
 </body>
 </html>
