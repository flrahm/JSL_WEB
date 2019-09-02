<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
 <head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <title> 메인 페이지</title>
   <link rel="stylesheet" type="text/css" href="/stylesheet.css">
   <style type="text/css">
     td.title { padding:4px; background-color:#e3e9ff }
     td.content { padding:10px; line-height:1.6em; text-align:justify; }
     a.list { text-decoration:none;color:black;font-size:10pt; }
   </style>

 </head>
 
<jsp:include page = "/include/topmenu.jsp">
	<jsp:param name ="row" value = "${row }"/>
</jsp:include> 

	<body topmargin="0" leftmargin="0">
		<table border="0" width="800">
			<tr>
				<td width="20%"  height="500" bgcolor="#ecf1ef" valign="top">
				</td>
				<td width="80%" valign="top">&nbsp;<br>
				<h>공지사항</h><br>
				제목 내용 작성일자 조회수<br>
				<c:forEach var ="nList" items = "${nList }">
				
					<a href = "indexsearch.do?num=${nList.num }&gubun=1">${nList.subject } ${nList.contents} ${nList.indate} ${nList.readcnt }</a><br>
				</c:forEach>
				
				<h>자료실</h><br>
				제목 내용 작성일자 조회수<br>
				<c:forEach var ="nList" items = "${ pList }">
					<a href = "indexsearch.do?num=${nList.num }&gubun=2">${nList.subject } ${nList.contents} ${nList.indate} ${nList.readcnt }</a><br>
				</c:forEach>
				
				<h>방명록</h><br>
				제목 내용 작성일자 조회수<br>
				<c:forEach var ="nList" items = "${gList }">
				
					<a href = "indexsearch.do?num=${nList.num }&gubun=3">${nList.subject } ${nList.contents} ${nList.indate} ${nList.readcnt }</a><br>
				</c:forEach>
				
				</td>
			</tr>
			
		</table>
	</body>
	</html>

<jsp:include page="/include/copyright.jsp"></jsp:include>


