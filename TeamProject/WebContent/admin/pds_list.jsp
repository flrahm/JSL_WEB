<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>협력업체 관리 - 관리자페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css"> 
<!-- 
body,td,tr,table{font-size:9pt; font-family:tahoma;color:#666666;line-height:160%;} 

A:link {font-family:tahoma;font-size:9pt;color:#666666;text-decoration:none;} 
A:visited {font-family:tahoma;font-size:9pt;color:#666666;text-decoration:none;} 
A:active {font-family:tahoma;font-size:9pt;color:#666666;text-decoration:none;} 
A:hover {font-family:tahoma;font-size:9pt;color:#009900;text-decoration:underline;} 
--> 
</style> 

</head>

<script>

	function onSubmit(){
		boardlist.submit();
	}

</script>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td><jsp:include page="top_menu.jsp" flush="true" /></td></tr>
	<tr>
		<td align="center" height="100%" valign=middle><br>
								<table width="30%" border="1" cellspacing="0" cellpadding="3" bgcolor="#FFCC66" bordercolor="#FFFFFF" bordercolorlight="#000000">
									<tr> 
										<td height=40 align="center" style="font-size: 15px;"><b>자료실</b></a>
										</b></td>
									</tr>
								</table><br>
								<table width="80%" border="0" cellspacing="0" cellpadding="0">
									<tr>
                    <td height="20">* 총 등록수 : <font color=red>${count}</font> 건</td>
                  </tr>
                  <tr>
                    <td><table width="100%" border="0" cellpadding="6" cellspacing="1" bgcolor="DDDDDD">
                      <tr bgcolor="EcECEC">
                        <td width="15%" align="center" bgcolor="EcECEC"><strong>번호</strong></td>
												<td align="center" bgcolor="EcECEC"><strong>제목</strong></td>
												<td width="15%" align="center"><strong>파일이름</strong></td>
												<td width="15%" align="center"><strong>글쓴이</strong></td>
                        <td width="20%" align="center"><strong>등록날짜</strong></td>
                        <td width="10%" align="center"><strong>조회수</strong></td>
                      </tr>
                      <c:if test="${list.size()!=0 }">
                      <c:forEach var="pds" items="${list }">
                      <tr>
                        <td align="center" bgcolor="#FFFFFF">${pds.num }</td>
                        <td bgcolor="#FFFFFF"><a href = "adminpdsview.do?num=${pds.num }">${pds.subject }</a></td>
                        <td align="center" bgcolor="#FFFFFF">${pds.filename}</td>
                        <td align="center" bgcolor="#FFFFFF">${pds.name }</td>
												<td align="center" bgcolor="#FFFFFF">${pds.indate }</td>
												<td align="center" bgcolor="#FFFFFF">${pds.readcnt }</td>
                      </tr>
                      </c:forEach>
                      </c:if>
                      <c:if test="${list.size()==0 }">
                      	<tr>
                        	<td align="center" bgcolor="#FFFFFF" colspan="5">등록된 자료가 없습니다.</td>
                      	</tr>
                      </c:if>
	                     <tr>
                        <td height="35" colspan="10" align="center" bgcolor="#FFFFFF"></td>
                      </tr>
					<form name = "boardlist" method = "post" action = "adminpdssearch.do">
                      <tr>
                        <td colspan="10" align="center" bgcolor="#FFFFFF"><table width="610" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width=80% height="30" colspan="2" align="right">
																<select name="search" class="textfield">
																	<option value="subject">제목</option>
																	<option value="name">글쓴이</option>
																</select>
																<input name="key" type="text" class="textfield" size="30"></td>
                              <td width=20% align="right"><b><a href = "#" onClick = "onSubmit()">[검색]</a></b> </td>
                            </tr>
                     </form>       
                        </table></td>
                      </tr>
                    </table>
</body>
</html>
