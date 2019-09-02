<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	a{
		text-decoration:none;
	}
	#lend_text_O{
		color: navy;
	}
	#lend_text_X{
		color: red;
	}
</style>
<body>
	<header>
		<h1 style="text-align:center; margin: 50px;"><a href="booklist?cmd=booklist" style="color: grey;">book list</a></h1>
	</header>
	<section>			
		<h2 align="center">가장 많이 대출된 책</h2><br>
		<div align="center">
			<c:if test="${best_list.size()!=0}">
				<c:forEach var="best" items="${best_list}">
					<a href="booklist?cmd=booklist_view&bookno=${best.bookno}"><img src="img/${best.bookimg}" style="width:127px; height:194px; margin:10px;"></a>
				</c:forEach>
			</c:if>
		</div>
		<table style="border-collapse: collapse; text-align: center; margin: auto; width: 90%;">
			<%-- <tr style="width:30px;">
				<td colspan="9" style="text-align: right; margin-right: 380px; text-align:right;">총 글 : ${totcount}&nbsp;&nbsp;&nbsp; page :
					${nowpage}/${totpage}</td>
			</tr> --%>
			<tr height="50px">
				<td style="border: 1px solid #444444;">사진</td>
				<td style="border: 1px solid #444444;">책번호</td>
				<td style="border: 1px solid #444444;">책이름</td>
				<td style="border: 1px solid #444444;">분류</td>
				<td style="border: 1px solid #444444;">저자</td>
				<td style="border: 1px solid #444444;">등록일자</td>
				<td style="border: 1px solid #444444;">대출상태</td>
				<td style="border: 1px solid #444444;">대여횟수</td>
				<td style="border: 1px solid #444444;">출판사</td>
			</tr>
			<c:if test="${list.size()!=0}">
				<c:forEach var="book" items="${list}">
					<tr style="border: 1px solid #444444;">
						<td style="border: 1px solid #444444;"><img
								src="img/${book.bookimg}" class="bookimg"></td>
						<td style="border: 1px solid #444444;">${book.bookno}</td>
						<td style="border: 1px solid #444444;"><a href="booklist?cmd=booklist_view&bookno=${book.bookno}&nowpage=${nowpage}" style="color:black;">${book.bookname}</a></td>
						<td style="border: 1px solid #444444;">${book.bookgenre}</td>
						<td style="border: 1px solid #444444;">${book.writer}</td>
						<td style="border: 1px solid #444444;">${book.regdate.substring(0,10)}</td>
						<td style="border: 1px solid #444444;"><c:if test="${book.lend==1}"><p id="lend_text_O">대출가능</p></c:if><c:if test="${book.lend!=1}"><p id="lend_text_X">대출불가</p></c:if></td>
						<td style="border: 1px solid #444444;">${book.lendcnt}</td>
						<td style="border: 1px solid #444444;">${book.publisher}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${list.size()==0}">
				<tr>
					<td colspan="9">등록된 자료가 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<p align="center">${pageSkip}</p>
		<form action="booklist?cmd=booklist_search" method="post"
			name="booklist_search">
			<br><br>
			<table style="margin: auto; margin-right: 373px;">
				<tr>
					<td width=80% height="30" colspan="2" align="right"><select
						name="search">
							<option value="bookname">책 제목</option>
							<option value="writer">저자</option>
							<option value="lend">도서분류</option>
					</select><input name="key" type="text" style="border:1px solid #444444; margin-left:auto; margin-right:auto;"></td>
					<td>
					<a href="javascript:search()"><b>[검색]</b></a> &nbsp;
					<c:if test="${not empty session && session=='admin1'}">
					<a href="booklist?cmd=booklist_insert&nowpage=${nowpage}"><b>[책 등록]</b></a>
					</c:if>
					</td>
				</tr>
			</table>			
		</form>
		<br><br><br>
	</section>
	<br><br><br><br><br>
	<footer>
		<div>
			<p align="center" style="margin: 50px;">TeamProject</p>
		</div>
	</footer>
<script>
	function lend(bookno){
			location.href="booklend?cmd=booklist_lend_view&nowpage=${nowpage}&bookno="+bookno;
	}
	function search() {
		if (booklist_search.key.value == "") {
			alert("검색할 내용을 입력해주세요.");
			booklist_search.key.focus();
			return;
		}
		booklist_search.submit();
	}
</script>
<%@ include file="../include/footer.jsp"%>
</html>