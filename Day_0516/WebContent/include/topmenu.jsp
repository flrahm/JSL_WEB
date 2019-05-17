<%@ page contentType="text/html; charset=UTF-8" %>


<html>
 <head><title>Music World</title>
 <link rel="stylesheet" type="text/css" href="/stylesheet.css">
 <style type="text/css">
   .menu, td {font-size:9pt;}
 </style>
</head>
 <body text="black" link="blue" vlink="purple" alink="red" bgcolor="white" topmargin="0" leftmargin="0">
 <table border="0" cellspacing="2" bgcolor="#ecf1ef" width="900" bordercolordark="#ffffff" bordercolorlight="#000000">
   <tr>
   
     <td width="20%" rowspan="6" valign="bottom" bgcolor="#000000">
       <a href="/Sample/index.jsp"><img src="/Day_0516/WebContent/include/img/logo.gif" width="158" height="83" border="0"></a>
       <font style="font-size:9pt;color:white;font-family:돋움"><b>Total 
       <font color="yellow"></font>
       | Now 
       <font color="yellow"></font>
       </b></font>
     </td>
     <td bgcolor="#9966ff" width="10%" height="25" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b><a href="" class="white">로그인</A></b></font></p>
     </td>
     <td bgcolor="#9966ff" width="10%" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b><a href="" class="white">회원가입</a></b></font></p>
     </td>
     <td bgcolor="#9966ff" width="10%" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b>공지사항</b></font></p>
     </td>
     <td bgcolor="#9966ff" width="10%" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b>자우게시판</b></font></p>
     </td>
     <td bgcolor="#9966ff" width="10%" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b><a href="" class="white">음악자료실</a></b></font></p>
     </td>
     <td bgcolor="#9966ff" width="10%" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b><a href="" class="white">방명록</a></b></font></p>
     </td>
     <td bgcolor="#9966ff" width="10%" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b>관련사이트</b></font></p>
     </td>
     <td bgcolor="#9966ff" width="10%" onmouseover="style.backgroundColor='#2772D3'" onmouseout="style.backgroundColor=''">
     <p align="center"><font color="white" size="2"><b>관리자</b></font></p>
     </td>
   </tr>                   
   <tr>
     <td colspan="8">
     <p><img src="./img/bar-01.gif" width="100%" height="1" border="0"></p>
     </td>
   </tr>
   <tr>                     
    <td rowspan="2"><p align="center"><font size="2"><b>장르 분류</b></font></p></td>               
    <td><p><font size="2" class="menu"><a href="">국내가요</a></font></p></td>
    <td><p><font size="2" class="menu"><a href="">POP/Rock</a></font></p></td>
     <td><p><font size="2" class="menu"><a href="">HipHop/R&amp;B</a></font></p></td>
 		<td><p><font size="2" class="menu"><a href="">Jazz</a></font></p></td>
    <td><p><font size="2" class="menu"><a href="">New Age</a></font></p></td>
    <td><p><font size="2" class="menu"><a href="">영화음악</a></font></p></td>
    <td><p><font size="2" class="menu"><a href="">가곡</a></font></p></td>
  </tr>                    
  <tr>                    
    <td><p><font size="2" class="menu"><a href="">캐롤</a></font></p></td>
    <td><p><font size="2" class="menu"><a href="">국악</a></font></p></td>
    <td><p><font size="2" class="menu"><a href="">Classic</a></font></p></td>
    <td><p><font size="2" class="menu"><a href="">종교음악</a></font></p></td>
    <td><p><font size="2" class="menu"><a href="">실용음악</a></font></p></td>
    <td><p><font size="2" class="menu"><a href="">유아/아동</a></font></p></td>
    <td><p><font size="2" class="menu">
	<a href="">World Music</a></font></p></td>
  </tr>        
   <tr>
     <td colspan="8"><p><img src="./img/bar-01.gif" width="100%" height="1" border="0"></p></td>
   </tr>
   <tr>
     <td><p><b><span style="font-size:15pt;">&nbsp;Search</span></b></p></td>
     <form action="" method="post">
     <td colspan="5">
     <p>&nbsp;
       <Select name="genre" size="1">
         <option value="종합">종합
         <option value="국내가요">국내가요
         <option value="POP/Rock">POP/Rock
         <option value="HipHop/R&B">HipHop/R&amp;B
         <option value="Jazz">Jazz
         <option value="New Age">New Age
         <option value="영화음악">영화음악
         <option value="가곡">가곡
         <option value="캐롤">캐롤
         <option value="국악">국악
         <option value="클래식">클래식
         <option value="종교음악">종교음악
         <option value="실용음악">실용음악
         <option value="유아/아동">유아/아동
         <option value="World Music">세계음악
         <option value="뮤직비디오">뮤직비디오
       </Select>
       <Select name="item" size="1">
         <option value="singer">뮤지션
         <option value="title">앨범명
       </Select>
         <input type="text" name="mykeyword" size="12">
         <input type="image" src="./img/search2.gif">
     </td>
     </form>
     <td><p><font size="2"><b><a href="">장바구니</a></b></font></p></td>
     <td><p><font size="2"><b><a href="">배송확인</a></b></font></p></td>
   </tr>
 </table>  
 </body>
 </html>
