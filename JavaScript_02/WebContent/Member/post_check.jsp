<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String addr = request.getParameter("addr");
	
	
	List<String> list = null;
	if(addr != null){	// 실제로는 DB 접속해서 가져옴
		//DB 접속
		list = new ArrayList<String>();
		list.add("와동");
		list.add("회덕동");
		list.add("법동");
		list.add("송촌동");
	}
	
	out.print(addr);	// jsp 내장객체
%>
<HTML>
<HEAD>
<TITLE>우편번호 찾기</TITLE>

<STYLE TYPE="text/css">
<!--
body { font-family: 돋움, Verdana; font-size: 9pt}
td   { font-family: 돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000}
a    { font-family: 돋움, Verdana; color: #000000; text-decoration: none}
     a:link { font-family:돋움; font-size:9pt; text-decoration:none}
     a:visited { font-family:돋움; font-size:9pt; text-decoration:none}
     a:hover { font-family:돋움; text-decoration:underline }
-->
</STYLE>

<script type="text/javascript">
	
	function post_check(){
		if(post.addr.value ==""){
			alert("동 이름을 입력하세요");
			post.addr.focus();
			return;
		}
		
		post.submit();
		
	}
	
	function send(zipcode , addr1){
		
		opener.frm.zip.value = zipcode;
		opener.frm.addr1.value = addr1;
		self.close();
	}


</script>

</HEAD>

<BODY BGCOLOR="#FFFFFF" onLoad="document.inquiry.addr.focus();">
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="./img/u_b02.gif"></td>
    <td align=center><FONT COLOR="#FFFFFF"><b>우편번호 찾기</FONT></td>
    <td align=right><img src= "./img/u_b03.gif"></td>
  </tr>
</table>

<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330><TR><TD BGCOLOR=#948DCF>
  <TABLE CELLPADDING=0 CELLSPACING=1 BORDER=0 WIDTH=330><TR><TD>
    <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=3 WIDTH=100% BGCOLOR=#FFFFFF>
    <FORM NAME="post" METHOD="post" ACTION="post_check.jsp" onSubmit="return check();">
      <TR>
        <TD ALIGN=CENTER><br>
          동이름 입력 : <INPUT NAME="addr" TYPE="text" style="width:120">
          <INPUT TYPE="image" src="./img/u_bt08.gif" hspace=10 onClick = "post_check()">
        </TD>
      </TR>    
      <TR>
        <TD ALIGN=CENTER>
        ※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.
        </TD>
      </TR>
      
      
            
      <%
      	if(list != null)
      	for(int i = 0; i < list.size(); i++){
      %>
      <TR>
        <TD><a href = "javascript:send('111222','<%= list.get(i) %>')" >123-123 <%= list.get(i) %></a><br>
        </TD>
      </TR>
      
      <%
      	}
      %>

    </FORM>
    </TABLE>
  </TD></TR></TABLE>
</TD></TR></TABLE>

<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="./img/u_b04.gif"></td>
    <td align=right><img src="./img/u_b05.gif"></td>
  </tr>
  <tr>
    <td colspan=2 align=center>
      <img src="./img/u_bt13.gif" border=0 vspace=5>    </td>
  </tr>
</table>
</BODY>
</HTML>
