<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String myDriver = "oracle.jdbc.driver.OracleDriver";
	String myURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	String myID = "jsldb";
	String myPass = "123123";
%>
<%
	try{
		Class.forName(myDriver);
		//out.print("드라이버 로딩 성공<br>");
		
	}catch(Exception e){
		e.printStackTrace();
	}

	try {
		Connection myConn = DriverManager.getConnection(myURL,myID,myPass);
		//out.print("커넥션 성공<br>");
		PreparedStatement pstmt = myConn.prepareStatement("select * from dept");
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			out.print(rs.getString(1) + "&nbsp");
			out.print(rs.getString(2) + "&nbsp");
			out.print(rs.getString(3) + "&nbsp");
			out.print("<br>");
		}
		
		
		if(rs!=null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(myConn != null)
			myConn.close();
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
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