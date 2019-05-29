<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	String selectSql = "select pass from board where num = " + num;
	String updateSql = "update board set email = ?,contents = ? where num = " + num;
	String inputPass = request.getParameter("pass");
	String pass = null;

	int flag = -1;
	int updateOk = 0;
	
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

		pstmt = conn.prepareStatement(selectSql);

		rs = pstmt.executeQuery();

		if (rs.next()) {
			pass = rs.getString(1);
		}

		if (pass != null) {
			if (pass.equals(inputPass))
				flag = 1; // 비밀번호 일치 
			else
				flag = 0; // 비밀번호 불일치
		} else
			flag = -1; // 비밀번호 찾기 실패

	} catch (Exception e) {

	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/// 삭제 실행
	if (flag == 1) {
		try {
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setString(1, request.getParameter("email"));
			pstmt.setString(2, request.getParameter("contents"));
			updateOk = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}else{
		try{
			if (conn != null)
				conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	pageContext.setAttribute("flag", flag);
	pageContext.setAttribute("updateOk", updateOk);
	
	
	
	if(flag == 1){
		out.println("<script>alert('수정되었습니다');</script>");
		response.sendRedirect("board_list.jsp");
	}else{
		out.println("<script>alert('비밀번호가 일치하지 않습니다');</script>");
		
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