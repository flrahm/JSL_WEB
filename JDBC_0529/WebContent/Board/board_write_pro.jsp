<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%

	String sql = "insert into board(num,name,email,subject,contents,pass) values(board_num_seq.nextval,?,?,?,?,?)";
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
		
		request.setCharacterEncoding("utf-8");
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("email"));
		pstmt.setString(3, request.getParameter("subject"));
		pstmt.setString(4, request.getParameter("contents"));
		pstmt.setString(5, request.getParameter("pass"));
	
		int insertOk = pstmt.executeUpdate();
		
		
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
	
	response.sendRedirect("board_list.jsp");
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