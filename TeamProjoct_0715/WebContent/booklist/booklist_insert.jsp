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
      <h1><a href="booklist?cmd=booklist" style="text-decoration:none; color:grey; ">book list</a></h1>
   </header>
   <section>
      <h3>book insert</h3>
      <form name="blist_porm" method="post" action="booklist?cmd=booklist_write" enctype="multipart/form-data">
         <table>
            <tr>
               <td>책사진</td>
               <td><input type="file" name="bookimg"></td>
            </tr>
            <tr>
               <td>책이름</td>
               <td><input type="text" name="bookname" maxlength="30"></td>
            </tr>
            <tr>
               <td>타입</td>
               <td>
                  <select name="booktype">
                  <c:forEach var = "bt" items="${typeList }">
                     <option value = ${bt[0] }>${bt[1] }</option>
                     </c:forEach>
                  </select>
               </td>
            </tr>
            <tr>
               <td>글쓴이</td>
               <td><input type="text" name="writer" maxlength="20"></td>
            </tr>
            <tr>
               <td>출판사</td>
               <td><input type="text" name="publisher" maxlength="20"></td>
            </tr>
         </table>
      </form>
      <button onclick="check()">등록</button>
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
      if(blist_porm.bookimg.value==""){
         alert("이미지는 필수 입니다.");
         blist_porm.bookimg.focus();
         return;
      }else if(blist_porm.bookname.value==""){
         alert("책 이름은 필수입력사항");
         blist_porm.bookname.focus();
         return;
      }
       blist_porm.submit();
   }
   
   function list_go() {
      history.back();
   }
</script>
</html>