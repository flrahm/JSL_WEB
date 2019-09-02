<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	a{
		text-decoration:none;
	}
</style>
<body>
	<header>
		<h1 style="text-align:center; margin: 50px;"><a href="booklist?cmd=booklist" style="color: grey;">book list</a></h1>
	</header>
	<section>
		<table border="1" style="border-collapse: collapse; text-align: center; margin: auto; width: 60%;">
			<tr>
				<td>사진</td>
				<td>책이름</td>
				<td>이름</td>
				<td>대여날짜</td>
				<td>반납예정일</td>
				<td>반납/연장</td>
			</tr>
			<c:if test="${list.size()!=0}">
				<c:forEach var="booklend" items="${list}">
					<tr>
						<td><img src="img/${booklend.bookimg}" width="127" height="194"></td>
						<td><a href="booklist?cmd=booklist_view&bookno=${booklend.bookno}" style="color:black;">${booklend.bookname}</a></td>
						<input type = "hidden" id = "lendno" value = "${booklend.lendno }">
						<td>${booklend.lendid}</td>
						<td>${booklend.lenddate.substring(0,10)}</td>
						<td>${booklend.lenddue.substring(0,10)}</td>
						<td>
							<button onclick="return_book('${booklend.lendno}','${booklend.bookno}')">도서반납</button><br><br>
							<button id ="renewalBtn" <%-- onclick="book_extension('${booklend.lendno}','${lend_vo.renewal}')"  --%>   >도서연장</button>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${list.size()==0}">
				<tr>
					<td colspan="9">등록된 자료가 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<br> <br> <br>
		
		<h2 align="center">bestsellers</h2><br>
		<div align="center" style="margin: 50px;">
			<c:if test="${best_list.size()!=0}">
				<c:forEach var="best" items="${best_list}">
					<a href="booklist?cmd=booklist_view&bookno=${best.bookno}"><img src="img/${best.bookimg}" width="127" height="194" style="margin:10px; "></a>
				</c:forEach>
			</c:if>
		</div>
	</section>
	<br><br><br><br><br>
	<footer>
		<div>
			<p align="center" style="margin: 50px;">TeamProject</p>
		</div>
	</footer>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   <script>
   
   
   $('#renewalBtn').click(function(){
	 
	   
	   if(confirm('연장하시겠습니까?')){
	   
	   var lendno = $('#lendno').val();
	   
	  $.ajax ({
		  url : "booklend?cmd=book_extension&lendno="+lendno,
		  type : 'get',
		  dataType :'json',
		  success : function(data){
			  var row = data.row;
			  console.log(row);
			  
			  if(row == 1){
				  alert('연장 실패');
			  }
			  
		  },
		  error : function(){
			  alert('통신 에러');
		  }
		  
		  
	  });
	   
	  
	  
	   }
	   
   });
   
   
   
   </script>
	
	
<script>
	
	function search() {
		if (booklist_search.key.value == "") {
			alert("검색할 내용을 입력해주세요.");
			booklist_search.key.focus();
			return;
		}
		booklist_search.submit();
	}
	
	function return_book(lendno,bookno){
		location.href="booklend?cmd=booklend_return&lendno="+lendno+"&bookno="+bookno;
	}
	
	function book_extension(lendno,renewal){
		var message = confirm("연장 하시겠습니까?");
		
		if(message == true && renewal!=1){
			location.href="booklend?cmd=book_extension&lendno="+lendno;
		}else if(renewal==1){
			alert("도서 연장은 1회만 가능합니다.");
		}else{
			return;
		}
	}
</script>
</html>