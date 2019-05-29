<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="board.vo.BoardVO"%>
<%@ page import = "java.sql.*" %>
<%
	String flag = request.getParameter("flag");
	if(flag != null)
		if(flag.equals("0"))
			out.println("<script>alert('비밀번호가 일치하지 않습니다');</script>");
	
	String num = request.getParameter("num");
	pageContext.setAttribute("num", num);
	String sql = "select * from board where num=" + num;
	String myDriver = "oracle.jdbc.driver.OracleDriver";
	String myURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	String myID = "jsldb";
	String myPass = "123123";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName(myDriver);
		conn = DriverManager.getConnection(myURL, myID, myPass);
	} catch (Exception e) {
		e.printStackTrace();
	}

	try {
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		BoardVO bvo = new BoardVO();
		
		while (rs.next()) {
			
			bvo.setNum(rs.getInt(1));
			bvo.setName(rs.getString(2));
			bvo.setEmail(rs.getString(4));
			bvo.setSubject(rs.getString(6));
			bvo.setContents(rs.getString(7));		
		}

		pageContext.setAttribute("bvo",bvo);
		

	} catch (Exception e) {

	} finally {
		try {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
   <head><title>게시판 수정</title>
    <link rel="stylesheet" type="text/css" href="/stylesheet.css">

</head>
<script>
	function send(){
		if(modifyFrm.contents.value == ""){
			modifyFrm.contents.focus();
			alert("내용은 필수 입력입니다");
			return;
		}
		
		if(modifyFrm.pass.value == ""){
			modifyFrm.pass.focus();
			alert("비밀번호는 필수 입력입니다");
			return;
		}
		
		modifyFrm.submit();
	}
</script>
 <body topmargin="0" leftmargin="0">
 <table border="0" width="800">
 <tr>
   <td width="20%" height="500" bgcolor="#ecf1ef" valign="top">

   <!-- 다음에 추가할 부분 "-->

   </td>
   <td width="80%" valign="top">&nbsp;<br>
     <img src="./img/bullet-01.gif"><font size="3" face="돋움" color="blue"> <b>자 유 게 시 판</b></font>
     <font size="2"> - 수정하기</font><p>
     <img src="./img/bullet-03.gif"><font size="2" face="돋움" color="orange"> 잠깐</font> &nbsp;
     <img src="./img/bullet-02.gif"><font size="2" face="돋움">는 필수 입력 사항입니다.</font><p>
     <form method="post" name = "modifyFrm" action = "board_modify_pro.jsp" >

      <table border="0">
       <tr>
         <td width="5%" align="right"><img src="./img/bullet-02.gif"></td>
         <td width="15%"><font size="2 face="돋움"">글쓴이</font></td>
         <td width="80%">
         <input type="text" size="20" name="name" value="${bvo.name }" readonly></td>
       </tr>
       <tr>
         <td align="right">&nbsp;</td>
         <td ><font size="2 face="돋움"">메일주소</font></td>
         <td>
          <input type="text" size="20" name="email" value="${bvo.email }"></td>
       </tr>
       <tr>
         <td align="right"><img src="./img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">제 목</font></td>
         <td><input type="text" size="60" name="subject" value="${bvo.subject }" readonly></td>
       </tr>
       <tr>
         <td align="right"><img src="./img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">내용</font></td>
         <td><textarea wrap="physical" rows="10" name="contents" cols="60" >${bvo.contents }</textarea></td>
       </tr>
       <tr>
         <td align="right"><img src="./img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">비밀번호</font></td>
          <td><input type="password" size="10" name="pass" >
		  <font size="2" face="돋움">*.수정과 삭제시 꼭 입력하셔야 합니다.</font></td>
        </tr>
        
        <tr>
          <td align="right">&nbsp;</td>
          <td><font size="2">&nbsp;</font></td>
          <td><a href="#" onClick = "send()"><img src="./img/edit2.gif" border=0></a>&nbsp;
          <a href="board_list.jsp" onClick = "history.back();"><img src="./img/cancle.gif" border=0></a></td></tr>
      </table>
      <input type = "hidden" name = "num" value = "${num }">
      </form>
    </td></tr>
  </table>
  </body>
  </html>
