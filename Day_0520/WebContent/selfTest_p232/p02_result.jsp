<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String numStr = request.getParameter("num");
	try{	int num = Integer.parseInt(numStr);
			int sum = 0;
			if(num > 0){
				for(int i = 1; i <= num ; i++){
					sum += i;
					if(i != num)
						out.print(i + "+");
					else
						out.print(i + "=" + sum);
				}
			}
	}catch(Exception e){
		out.print("숫자를 입력하세요");
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