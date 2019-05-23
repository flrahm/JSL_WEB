<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String input = request.getParameter("input");
	String input2 = "";
	
	for(int i = input.length()-1; i >=0  ; i--){
		input2 += input.charAt(i);
	}
	String aaa = "aaa";

	int num1 = Integer.parseInt(input);
	int num2 = Integer.parseInt(input2);
	int result = num1+num2;
	
	out.print(result);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form method = post action = "reverse.jsp">
<input type = submit value = "계속">
</form>


</body>
</html>