<%@page import="guest.vo.GuestVO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String contents = request.getParameter("contents");
	String ip = request.getRemoteAddr();
	
	String sql = "insert into guest (idx,subject,name,contents,ip) values(guest_seq.nextval,?,?,?,?)";
	String myDriver = "oracle.jdbc.driver.OracleDriver";
	String myURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	String myID = "jsldb";
	String myPass = "123123";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		Class.forName(myDriver);
		conn = DriverManager.getConnection(myURL,myID,myPass);
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	try{
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, subject);
		pstmt.setString(2, name);
		pstmt.setString(3, contents);
		pstmt.setString(4, ip);
		
		int insertOk = pstmt.executeUpdate();
		if(insertOk != 0)
			out.print("등록 성공<br>");
		
	}catch(Exception e){
		
	}finally{
		try{
			if(conn != null)
				conn.close();
			if(pstmt != null)
				pstmt.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
name : <%=name %> <br>
subject : <%=subject %> <br>
contents : <%=contents %> <br>
ip : <%=ip %> <br>
<a href = "guest_list.jsp">리스트로 이동</a>
</body>
</html>
