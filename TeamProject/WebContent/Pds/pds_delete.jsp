<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head><title>자료 삭제</title>
<link rel="stylesheet" type="text/css" href="/stylesheet.css">
</head>

<script>

	function onSubmit(){
		if(pdsdelete.passtwo.value != pdsdelete.passone.value){
			alert("비밀번호가 일치하지 않습니다.");
			pdsdelete.passone.focus();
			return;
		}
		
		pdsdelete.action.value = "pdsdelete.do";
		pdsdelete.submit();
	
	}
	
	function onClose(){
		pdsdelete.action="pdslist.do";
		pdsdelete.submit();
	
	}

</script>


<body>
<form name = "pdsdelete" method = "post" action = "pdsdelete.do">
 <input type="hidden" name="num" value="${vo.num }">
 <input type="hidden" name="filename" value="${vo.filename }">
 <input type="hidden" name="passtwo" value="${vo.pass }">
  <table border="0" cellpadding="0" cellspacing="0" width="300" align="center">
  <tr>
    <td height="50">
    <img src="Pds/img/bullet-05.gif"> <b><font size="3" color="red">잠깐 !!</font></b></td></tr>
  <tr>
    <td valign="middle" height="30">
    <font size="2" face="돋움">게시물은 작성하신 분만 삭제할 수 있습니다.<br>
    글의 비밀번호를 입력해 주세요...</font></td></tr>
  <tr>
    <td valign="middle" height="40">
    
    <font size="2" face="돋움">비밀번호 <input type="password" name="passone" size="8"></font>
    </form>
    <a href = "#" onClick = "onSubmit()"><input type="button" value="삭제"></a>
    <a href = "#" onClick = "onClose()"><input type="button" value="닫기"></a> </td></tr>
  </table>

</body>
</html>
