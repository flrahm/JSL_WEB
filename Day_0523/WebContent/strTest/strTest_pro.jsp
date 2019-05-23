<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String input = request.getParameter("input");
	
	int iter = input.length()/2; //반복횟수
	String result = "";	// 결과 출력
	
	for(int i = 0; i < iter ; i++){
		String str = input.substring(2*i,2*(i+1));
		if(str.charAt(0)>='0' && str.charAt(0) <= '9'){
			
			int num = str.charAt(0) - '0'; // 몇번 찍을지
			
			if(!(str.charAt(1)>='0' && str.charAt(1) <= '9')){
				for(int j = 0; j < num ; j ++)
					result += str.charAt(1);
				
			}
		}
	}

	
	out.print("입력 : " + input + "<br>");
	out.print("결과 : " + result + "<br>");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method = post action = "strTest.jsp">
<input type = submit value = "계속">
</form>

</body>
</html>