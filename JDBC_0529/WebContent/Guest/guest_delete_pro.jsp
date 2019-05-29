<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String idx = request.getParameter("idx");	
	
	String sql = "delete from guest where idx = " + idx;
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
		int deleteOk = pstmt.executeUpdate();
		
		if(deleteOk !=0)
			out.print("성공");
		
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
	
	response.sendRedirect("guest_list.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>