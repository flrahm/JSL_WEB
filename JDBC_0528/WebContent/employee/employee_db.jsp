<%@page import="employee.EmployeeVO"%>
<%@page import="java.util.*"%>
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

	Connection myConn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	List<EmployeeVO> empList = null;
	
	try {
		myConn = DriverManager.getConnection(myURL,myID,myPass);
		//out.print("커넥션 성공<br>");
		pstmt = myConn.prepareStatement("select * from emp");
		rs = pstmt.executeQuery();
		EmployeeVO vo = null;
		
		empList = new ArrayList<EmployeeVO>();
		while(rs.next()){
			vo = new EmployeeVO();
			vo.setEno(rs.getInt(1));
			vo.setEname(rs.getString(2));
			vo.setJob(rs.getString(3));
			vo.setManager(rs.getInt(4));
			vo.setHiredate(rs.getDate(5));
			vo.setSalary(rs.getInt(6));
			vo.setCommission(rs.getInt(7));
			vo.setDno(rs.getInt(8));
			
			empList.add(vo);
		}
		
		request.setAttribute("empList", empList);
		RequestDispatcher rd = request.getRequestDispatcher("employee_list.jsp");
		rd.forward(request, response);
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally{
		
		try{
			if(rs!=null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(myConn != null)
				myConn.close();
			
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

</body>
</html>