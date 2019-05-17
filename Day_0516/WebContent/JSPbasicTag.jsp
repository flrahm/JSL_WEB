<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%! int s1 = 0;	// 전역변수(초기화는 한번만 됨)
	int add(int a , int b){	// 클래스 없이 메소드 생성 가능
	return a+b;
}
%>

<%
	int s = 0;	// 지역변수(초기화가 계속 이루어짐)
	for(int i = 0; i <= 10; i ++) {
		out.print(i + "<br>");
	}

%>
<br>

<%= add(10,20) %> <br>
<%= s++%><br>
<%= s1++%>
</body>
</html>