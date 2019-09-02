<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <header>
      <h1><a href="booklist?cmd=booklist" style="text-decoration:none; color:grey;">book list</a></h1>
      <h3>book view</h3>
   </header>
   <section>
      <form name="blist_porm" method="post" action="booklist?cmd=booklist_modify" enctype="multipart/form-data">
         <input type="hidden" name="bookimg_copy" value="${vo.bookimg}">
         <table>
            <tr>
               <td>책사진</td>
               <td><input type="file" name="bookimg"></td>
            </tr>
            <tr>
               <td>책번호</td>
               <td><input type="text" name="bookno" maxlength="5" value="${vo.bookno}"></td>
            </tr>
            <tr>
               <td>책이름</td>
               <td><input type="text" name="bookname" maxlength="30" value="${vo.bookname}"></td>
            </tr>
            <tr>
               <td>타입</td>
               <td><input type="text" name="booktype" maxlength="1" value="${vo.booktype}"></td>
            </tr>
            <tr>
               <td>글쓴이</td>
               <td><input type="text" name="writer" maxlength="20" value="${vo.writer}"></td>
            </tr>
            <tr>
               <td>분류</td>
               <td><input type="text" name="lend" maxlength="1" value="${vo.lend}"></td>
            </tr>
            <tr>
               <td>출판사</td>
               <td><input type="text" name="publisher" maxlength="20" value="${vo.publisher}"></td>
            </tr>
         </table>
      </form>
      <button onclick="check()">수정</button>
      <button onclick="delete_check()">삭제</button>
      <button onclick="list_go()">취소</button>
   </section>
   <footer>
      <div>
         <p>TeamProject</p>
      </div>
   </footer>
</body>
<script>   
   function check(){
      if(blist_porm.bookno.value==""){
         alert("책 번호는 필수입력사항");
         blist_porm.bookno.focus();
         return;
      }else if(blist_porm.bookname.value==""){
         alert("책 이름은 필수입력사항");
         blist_porm.bookname.focus();
         return;
      }
      blist_porm.submit();
   }   
   function delete_check(){
      var message = confirm("삭제하시겠습니까?");
      if(message==true){
         location.href="booklist?cmd=booklist_delete&bookno=${vo.bookno}";
      }else{
         return;
      }
   }   
   function list_go() {
      history.back();
   }
</script>
</html>