<%@page import="guest.vo.GuestVO"%>
<%@page import="java.sql.*"%>
<%@page import = "java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%!
	String linebreak(String str){
	
	StringBuffer buf = new StringBuffer();
	
	for(int i = 0; i <str.length();i++){
		if(str.charAt(i) == '\n'){
			buf.append("<br>");
		}else
			buf.append(str.charAt(i));
	}
	
	return buf.toString();
}
%>

<%
	String idx = request.getParameter("idx");	

	String sql = "select * from guest where idx = " + idx;
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
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		GuestVO gvo = new GuestVO();
		
		while(rs.next()){	
			gvo.setIdx(rs.getInt(1));
			gvo.setSubject(rs.getString(2));
			gvo.setName(rs.getString(3));
			gvo.setContents(linebreak(rs.getString(4)));
			gvo.setIndate(rs.getString(5));
			gvo.setReadcnt(rs.getInt(6));
			gvo.setIp(rs.getString(7));
			
		}
		
		pageContext.setAttribute("gvo", gvo);
		
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
 <head><meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
   <title>방명록 내용 보기</title>
   <link rel="stylesheet" type="text/css" href="/stylesheet.css">
   <style type="text/css">
     td.title { padding:4px; background-color:#e3e9ff }
     td.content { padding:10px; line-height:1.6em; text-align:justify; }
     a.list { text-decoration:none;color:black;font-size:10pt; }
   </style>
   
   
   
 <script language="javascript">
 
 function guest_delete(idx){
	 var bool = confirm("삭제하시겠습니까?");
	 
	 if(bool)
		 location.href = "guest_delete_pro.jsp?idx=" + idx;
 }
 
 
 
 
 
 <!--
 function del_list() {
   var urlString;
    urlString = "guest_delete.jsp" ;
    window.open(urlString, "del_list"," resizable=no,x=150,y=150,width=300,height=170");
 }
 //-->
 </script>
 </head>
 <body topmargin="0" leftmargin="0">
   <table border="0" width="800">
     <tr>
       <td width="20%"  height="500" bgcolor="#ecf1ef" valign="top">

		 <!--  다음에 추가할 부분 -->

	   </td>
       <td width="80%" valign="top">&nbsp;<br>
         <table border="0" width="90%" align="center">
           <tr>
             <td colspan="2"><img src="./img/bullet-01.gif"> 
              <font color="blue" size="3">방 명 록</font><font size="2"> - 글읽기</font></td>
           </tr>
         </table>
       <p>
       <table border="0" width="90%" align="center" cellspacing="0"  style="border-width:1px;border-color:#0066cc;border-style:outset;">
         <tr bgcolor="e3e9ff">
           <td class="title">
             <img src="./img/bullet-04.gif"> <font size="2" face="돋움">
                  ${gvo.subject }</font>
           </td>
         </tr>
         <tr>
           <td class="content">
             <p align="right"><font size="2" face="돋움">
              ${gvo.name } / <font size="2" face="돋움">${gvo.indate } / ${gvo.readcnt }번 읽음</font>
             <p>
             ${gvo.contents }<p>
           </td>
         </tr>
       </table>

      <!--**** 여기서부터 게시물 내용 아래쪽의 버튼들이 나옵니다. 답변, 수정, 삭제, 목록보기 ****-->
      <p align="center">
      <font size="2">
       <!-- 목록보기 -->
       <a href="guest_list.jsp"><img src="./img/list-2.gif" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;
       <a href = "#" onClick = "guest_delete(${gvo.idx})"> 삭제</a>
      </font>
    </td>
  </tr>
  </table>
  </body>
  </html>
