<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! List<String[]> list = new ArrayList<String[]>();%>   
<%
	boolean flag = false;
	String inputName = request.getParameter("username");
	String payStr = request.getParameter("pay");
	if(inputName.equals("quit")){
		flag = true;
	}else{
		String[] temp = {inputName,payStr};
		list.add(temp);
		RequestDispatcher rd = request.getRequestDispatcher("input.jsp");
		rd.forward(request, response);
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
	if (flag) {
		int[] moneyArr = { 50000, 10000, 5000, 1000, 500, 100, 50, 10, 5, 1 };
		
		int[] result;
		int pay;
		String name;

		for (int j = 0; j < list.size(); j++) {
			
			if(list.get(j)[1].equals(""))
				pay = 0;
			else
				pay = Integer.parseInt(list.get(j)[1]);
			
			int tempPay = pay;
			name = list.get(j)[0];
			
			result = new int[10];
			for (int i = 0; i < moneyArr.length; i++) {
				result[i] = pay / moneyArr[i];
				pay %= moneyArr[i];
			}

			out.print(name+"("+ tempPay +")" + "<br>");
			out.print("<pre>"+Arrays.toString(moneyArr) + "<br>");
			out.print(Arrays.toString(result) + "</pre><hr>");

		}
	}
%>

</body>
</html>
