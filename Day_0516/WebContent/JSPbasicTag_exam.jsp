<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%!
	int addVal(int a, int b){
	return a+b;
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<%
	int val1 = Integer.parseInt(request.getParameter("val1"));
	int val2 = Integer.parseInt(request.getParameter("val2"));
	
	
%>

<h3><%=val1 %> + <%=val2 %> = <%= addVal(val1,val2) %></h3>

</body>
</html>