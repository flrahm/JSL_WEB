<%@page import="guest.vo.GuestVO"%>
<%@page import="java.sql.*"%>
<%@page import = "java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String pageidx = request.getParameter("page");
	if(pageidx == null)
		pageidx = "1";
	pageContext.setAttribute("page", pageidx);

	String sql = "select * from guest order by indate desc";
	String myDriver = "oracle.jdbc.driver.OracleDriver";
	String myURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	String myID = "jsldb";
	String myPass = "123123";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<GuestVO> gList = null;
	
	try{
		Class.forName(myDriver);
		conn = DriverManager.getConnection(myURL,myID,myPass);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	try{
		gList = new ArrayList<GuestVO>();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			GuestVO gvo = new GuestVO();
			gvo.setIdx(rs.getInt(1));
			gvo.setSubject(rs.getString(2));
			gvo.setName(rs.getString(3));
			gvo.setContents(rs.getString(4));
			gvo.setIndate(rs.getString(5));
			gvo.setReadcnt(rs.getInt(6));
			gvo.setIp(rs.getString(7));
			gList.add(gvo);
		}
		
		pageContext.setAttribute("gList", gList);
	
		
	}catch(Exception e){
		
	}finally{
		try{
			if(conn != null)
				conn.close();
			if(pstmt != null)
				pstmt.close();
			if(rs != null)
				rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
%>
<html>
<head><title>방명록 읽기</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<style type="text/css">
  a.list {text-decoration:none;color:black;font-size:10pt;}
</style>
</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">



<table border="0" width="800">
  <tr>
    <td width="20%" height="500" valign="top" bgcolor="#ecf1ef">
	<!-- 다음에 추가할 부분 --></td>
    <td width="80%" valign="top">	
    <br>
    <table border="0" cellspacing="1" width="100%" align="center">
      <tr>
        <td colspan="7" align="center" valign="center" height="20">
        <font size="4" face="돋움" color="blue">
        <img src="./img/bullet-01.gif"> <b>방 명 록</b></font></td></tr>
      <tr>
        <td colspan="5" align="right" valign="middle" height="20">
		<font size="2" face="고딕">전체 : ${gList.size() }</b>건 - ${page } Pages</font></td></tr>
 	   <tr bgcolor="e3e9ff">
 	      <td width="10%"align="center" height="20"><font face="돋움" size="2">번호</font></td>
 	      <td width="50%" align="center" height="20"><font face="돋움" size="2">제목</font></td>
 	      <td width="15%" align="center" height="20"><font face="돋움" size="2">글쓴이</font></td>
 	      <td width="15%" align="center" height="20"><font face="돋움" size="2">작성일</font></td>
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">조회수</font></td>
 	   </tr>



<c:set var = "listLen" value="${gList.size() }"/>
<c:set var = "iter" value = "${(listLen - listLen%5)/5+1}" />
<c:if test="${listLen%5 == 0 }"><c:set var = "iter" value = "${iter-1}" /></c:if>

<c:set var = "begin" value="${5*(page-1) }"></c:set>
<c:if test="${page != iter }">
<c:set var = "end" value="${5*page -1}"></c:set>
</c:if>
<c:if test="${page == iter }">
<c:set var = "end" value="${listLen-1}"></c:set>
</c:if>

 <c:forEach var="gvo" items="${gList }" begin="${begin }" end="${end }" step = "1" varStatus="status">
		<tr onMouseOver="style.backgroundColor='#D1EEEE'" onMouseOut="style.backgroundColor=''">
        <td align="center" height="25">
        <font face="돋움" size="2" color="#000000">${gList.size() - status.index }</font></td>
        <td align="left" height="20">
        <font face="돋움" size="2" color="#000000">
		      <a href = "guest_view.jsp?idx=${gvo.idx }"> ${gvo.subject } </a></td>
        <td align="center" height="20"><font face="돋움" size="2">
        <a class="list" href="mailto:ein1027@nate.com">${gvo.name }</a></font></td>
        <td align="center" height="20"><font face="돋움" size="2">${gvo.indate.substring(0,10) }</font></td>
        <td align="center" height="20"><font face="돋움" size="2">${gvo.readcnt }</font></td>
      </tr>
</c:forEach>

     <div align="center">
        <table width="700" border="0" cellspacing="0" cellpadding="5">
          <tr>&nbsp;</tr><tr>
             <td colspan="5">        
                <div align="center">
                
                <c:forEach var="i" begin="1" end="${iter }">
                <a href = "guest_list.jsp?page=${i }">[${i }]</a>
                </c:forEach></div>
			  
			  </td>
			  
	  
			  
			 </tr>
			<tr align=right><td colspan="5">
				<a href="guest_write.jsp"><img src="./img/write.gif" border="0"></a>
			</td>
			</tr>
		</table>
		
		</div>
	</body>
	</html>

