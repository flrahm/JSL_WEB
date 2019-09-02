<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
   #book_font{
   font-family: '나눔고딕',NanumGothic,ng,'돋움',dotum,"굴림",Gulim,"Trebuchet MS",arial,Verdana;
   font-size: 0.75em;
   color: #3a3a3a;
   padding: 2px 24px 2px 0px;
    width: 120px;
    text-align: left;
    border: 0px;
   }
   
   #book_font_right{
   font-family: '나눔고딕',NanumGothic,ng,'돋움',dotum,"굴림",Gulim,"Trebuchet MS",arial,Verdana;
    font-size: 0.75em;
   padding: 2px 24px 2px 12px;
    width: auto;
    border: 0px;
   }
   
   body{
   font-family: '나눔고딕',NanumGothic,ng,'돋움',dotum,"굴림",Gulim,"Trebuchet MS",arial,Verdana;
    font-size: 0.75em;
    line-height: 1.4em;
   }
</style>
<body>
   <header>
      <h1>
         <a href="booklist?cmd=booklist"
            style="text-decoration: none; color: grey;">book list</a>
      </h1>
      <div class="line"></div>
   </header>
   <section >
      <table>
         <tr>
            <td><h3 style="color:#0a71b9; font-weight:bold;">상세정보</h3></td>
            <td><p class="fa fa-home" aria-hidden="true"></p></td>
         </tr>
      </table>
         <div id="divLocation">
               
               <p class="current">상세정보</p>
         </div>
      
      <table style="margin-left: 50px; background-color:#f8f8f8;">
         <tr>
            <td><h3 style="color:#4160af;">${vo.bookname}</h3></td>
         </tr>
         <tr>
            <td id="book_font">서명</td>
            <td id="book_font_right">${vo.bookname}</td>
            <td rowspan="4"><img src="img/${vo.bookimg}" width="127" height="194" style="margin-left: 50px;"></td>
         </tr>
         <tr>
            <td id="book_font">개인저자</td>
            <td id="book_font_right">${vo.writer}</td>
         </tr>
         <tr>
            <td id="book_font">출판사</td>
            <td id="book_font_right">${vo.publisher}</td>
         </tr>
      </table>
      <br>
      <form method="post" name="lend_fm" action="booklend?cmd=booklend">
         <input name="grade" type="hidden" value="${mvo.grade}">
         <input name="memberid" type="hidden" value="${memberid}">
         <input name="membername" type="hidden" value="${membername}">
         <input name="bookno" type="hidden" value="${vo.bookno}">
         <input name="bookname" type="hidden" value="${vo.bookname}">
         <input name="lenddue" type="hidden" value="${lenddue}">
         <table>
            <tr>
               <td style="background-color:#4160ad; color:#ffffff;"><p>소장정보</p></td>
            </tr>
            <tr style="background-color: #eff2f5;">
               <td>도서번호</td>
               <td>도서상태</td>
               <td>반납예정일</td>
            </tr>
            <tr>
               <td>${vo.bookno}</td>
               <td>
                  
                  <c:if test="${vo.lend==1}">대출가능</c:if>
                  <c:if test="${vo.lend!=1}">대출불가</c:if>
               </td>
               <td>${lenddue}</td>
            </tr>
         </table>
      </form>
      <c:if test="${vo.lend==1}">
      <button onclick="lend()">대여</button>
      </c:if>
      <c:if test="${not empty session && session=='admin1'}">
      <button onclick="modify()">수정</button>
      </c:if>
      <button onclick="back()">돌아가기</button>
   </section>
   <footer>
      <div>
         <p>TeamProject</p>
      </div>
   </footer>
</body>
<script>
   function lend(){
      var message = confirm("대출하시겠습니까?");
      if(message == true){
         lend_fm.submit();
      }else{
         return;
      }
   }
   
   function modify(){
      location.href="booklist?cmd=booklist_modify_view&bookno=${vo.bookno}&nowpage=${nowpage}";
   }
   
   function back(){
      history.back();
   }
</script>
</html>