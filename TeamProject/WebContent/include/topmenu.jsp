<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
 <head><title>Web Programming Test</title>
 <link rel="stylesheet" type="text/css" href="/stylesheet.css">
 <style type="text/css">
   .menu, td {font-size:9pt;}
 </style>
</head>

<script>

	function onTopSubmit(){
		if(topmenu.mykeyword.value == ""){
			alert("검색어를 입력해주세요");
			topmenu.mykeyword.focus();
			return;
		}
		
		topmenu.submit();
	}

</script>


 <body text="black" link="blue" vlink="purple" alink="red" bgcolor="white" topmargin="0" leftmargin="0">
 <table border="0" cellspacing="2" bgcolor="#ecf1ef" width="900" bordercolordark="#ffffff" bordercolorlight="#000000">
   <tr>
     <td width="20%" rowspan="4" valign="bottom" bgcolor="#000000">
       <a href="index.do"><img src="include/img/ceo.jpg" width="158" height="83" border="0"></a>
       <font style="font-size:9pt;color:white;font-family:돋움"><b>Total 
       <font color="yellow"></font>
       | Now 
       <font color="yellow"></font>
       </b></font>
     </td>
     <c:if test ="${empty sessionScope.userid }">
     <td bgcolor="#9966ff" width="10%" height="25" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b><a href = "userloginform.do" class = "white">로그인</A></b></font></p>
     </c:if>
     <c:if test ="${not empty sessionScope.userid }">
     <td bgcolor="#9966ff" width="10%" height="25" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b><a href = "userlogout.do" class = "white">로그아웃</A></b></font></p>
     </c:if>
     
     </td>
     <td bgcolor="#9966ff" width="10%" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b><a href = "userinfoinsert.do" class = "white">회원가입</a></b></font></p>
     </td>
     <td bgcolor="#9966ff" width="10%" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b><a href = "noticelist.do" class = "white">공지사항</a></b></font></p>
     </td>
     <td bgcolor="#9966ff" width="10%" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b><a href = "boardlist.do">게시판</a></b></font></p>
     </td>
     <td bgcolor="#9966ff" width="10%" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b><a href = "pdslist.do" class = "white">자료실</a></b></font></p>
     </td>
     <td bgcolor="#9966ff" width="10%" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b><a href = "guestlist.do" class = "white">방명록</a></b></font></p>
     </td>
     <td bgcolor="#9966ff" width="10%" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b>관련사이트</b></font></p>
     </td>
     <td bgcolor="#9966ff" width="10%" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b><a href = "adminlogin.do">관리자</a></b></font></p>
     </td>
   </tr>                   
   <tr>
     <td colspan="8">
     <p><img src="include/img/bar-01.gif" width="100%" height="1" border="0"></p>
     </td>
   </tr>
   <tr>
     <td colspan="8"><p><img src="include/img/bar-01.gif" width="100%" height="1" border="0"></p></td>
   </tr>
   <tr>
     <td><p><b><span style="font-size:15pt;">&nbsp;Search</span></b></p></td>
     <form name = "topmenu"  method = "post" action = "indexsearch.do">
     <td colspan="5">
     <p>&nbsp;
       <Select name="gubun" size="1">
         <option value="no">공지사항</option>
         <option value="gu">방명록</option>
         <option value="pd">자료실</option>
         <option value="bo">게시판</option>
       </Select>
       <Select name="item" size="1">
         <option value="name">이름
         <option value="subject">제목
       </Select>
         <input type="text" name="mykeyword" size="12">
         <a href = "#" onClick = "onTopSubmit()"><img src="include/img/search2.gif"></a>
     </td>
     </form>
     <td><p><font size="2"><b><a href="">장바구니</a></b></font></p></td>
     <td><p><font size="2"><b><a href="">배송확인</a></b></font></p></td>
   </tr>
 </table>  
 </body>
 </html>
