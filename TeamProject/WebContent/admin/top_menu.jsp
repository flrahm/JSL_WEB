<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<style type="text/css"> 
<!-- 
body,td,tr,table{font-size:9pt; font-family:tahoma;color:#000000;line-height:160%;} 

A:link {font-family:tahoma;font-size:9pt;color:#000000;text-decoration:none;} 
A:visited {font-family:tahoma;font-size:9pt;color:#000000;text-decoration:none;} 
A:active {font-family:tahoma;font-size:9pt;color:#000000;text-decoration:none;} 
A:hover {font-family:tahoma;font-size:9pt;color:#000000;text-decoration:underline;} 
--> 
</style> 
</HEAD>
<BODY topmargin=0 leftmargin="0" marginwidth="0" marginheight="0">
  <TABLE WIDTH=100% height=30 border=0 bgcolor="#FFCC66">
    <TR> 
    <!-- 등급 가져오깅 -->
      <c:if test="${session.substring(session.length()-1, session.length()) == 0 }">
         <TD width="20"></TD>
         <td width="100"> 
        <p><a href="adminnoticelist.do">[공지사항]</a></p>
      </td>
         <TD width="100"> 
        <P><a href="adminboardlist.do">[게시판 관리]</a></P>
      </TD>
         <TD width="100"> 
        <P><a href="adminmemberlist.do">[회원 관리]</a></P>
      </TD>
         <TD width="100"> 
        <P><a href="adminpdslist.do">[자료실]</a></P>   <%--자료실은 Pds -> pds_list.jsp 이용 --%>
      </TD>
         <TD width="100"> 
        <P><a href="adminguestlist.do">[방명록 관리]</a></P>   <%--방명록은 Guest -> guest_list.jsp --%>
      </TD>
         <TD width="100"> 
        <P><a href="adminlist.do">[관리자 관리]</a></P>
      </TD>
      <!--  1 등급  -->
      </c:if><c:if test="${session.substring(session.length()-1, session.length()) == 1 }">
         <TD width="20"></TD>
         <td width="100"> 
        <p><a href="adminnoticelist.do">[공지사항]</a></p>
      </td>
         <TD width="100"> 
        <P><a href="adminboardlist.do">[게시판 관리]</a></P>
      </TD>
         <TD width="100"> 
        <P><a href="adminmemberlist.do">[회원 관리]</a></P>
      </TD>
         <TD width="100"> 
        <P><a href="adminpdslist.do">[자료실]</a></P>   <%--자료실은 Pds -> pds_list.jsp 이용 --%>
      </TD>
         <TD width="100"> 
        <P><a href="adminguestlist.do">[방명록 관리]</a></P>   <%--방명록은 Guest -> guest_list.jsp --%>
      </TD>
         <TD width="100"> 
        <P> 관리등급 : "1" </P>
      </TD>
      </c:if>
      <!--  2 등급  -->
      <c:if test="${session.substring(session.length()-1, session.length()) == 2 }">
         <TD width="20"></TD>
         <td width="100"> 
        <p><a href="adminnoticelist.do">[공지사항]</a></p>
      </td>
         <TD width="100"> 
        <P><a href="adminboardlist.do">[게시판 관리]</a></P>
      </TD>
         <TD width="100"> 
        <P><a href="adminmemberlist.do">[회원 관리]</a></P>
      </TD>
         <TD width="100"> 
        <P><a href="adminpdslist.do">[자료실]</a></P>   <%--자료실은 Pds -> pds_list.jsp 이용 --%>
      </TD>
         <TD width="100"> 
        <P><a href="admin/admin_rate.jsp">[방명록 관리]</a></P>   <%--방명록은 Guest -> guest_list.jsp --%>
      </TD>
         <TD width="100"> 
        <P> 관리등급 : "2" </P>
      </TD>
      </c:if>
      <!--  3등급 -->
       <c:if test="${session.substring(session.length()-1, session.length()) == 3 }">
         <TD width="20"></TD>
         <td width="100"> 
        <p><a href="adminnoticelist.do">[공지사항]</a></p>
      </td>
         <TD width="100"> 
        <P><a href="adminboardlist.do">[게시판 관리]</a></P>
      </TD>
         <TD width="100"> 
        <P><a href="adminmemberlist.do">[회원 관리]</a></P>
      </TD>
         <TD width="100"> 
        <P><a href="admin/admin_rate.jsp">[자료실]</a></P>   <%--자료실은 Pds -> pds_list.jsp 이용 --%>
      </TD>
         <TD width="100"> 
        <P><a href="admin/admin_rate.jsp">[방명록 관리]</a></P>   <%--방명록은 Guest -> guest_list.jsp --%>
      </TD>
         <TD width="100"> 
        <P> 관리등급 : "3" </P>
      </TD>
      </c:if>
      <!-- 4등급 -->
      <c:if test="${session.substring(session.length()-1, session.length()) == 4 }">
         <TD width="20"></TD>
         <td width="100"> 
        <p><a href="adminnoticelist.do">[공지사항]</a></p>
      </td>
         <TD width="100"> 
        <P><a href="adminboardlist.do">[게시판 관리]</a></P>
      </TD>
         <TD width="100"> 
        <P><a href="admin/admin_rate.jsp">[회원 관리]</a></P>
      </TD>
         <TD width="100"> 
        <P><a href="admin/admin_rate.jsp">[자료실]</a></P>   <%--자료실은 Pds -> pds_list.jsp 이용 --%>
      </TD>
         <TD width="100"> 
        <P><a href="admin/admin_rate.jsp">[방명록 관리]</a></P>   <%--방명록은 Guest -> guest_list.jsp --%>
      </TD>
         <TD width="100"> 
        <P> 관리등급 : "4" </P>
      </TD>
      </c:if>
      <TD width="100"> 
        <P>관리자ID : ${session.substring(0,session.length()-1)} &nbsp;&nbsp;&nbsp;<a href="adminlogout.do">로그아웃</a></P>
      </TD>
    </TR>
  </TABLE>
</body>
</html>