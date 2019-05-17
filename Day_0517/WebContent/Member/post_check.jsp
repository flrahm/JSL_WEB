<%@ page import = "java.util.*" contentType="text/html; charset=UTF-8" %>
<%

	String zip = request.getParameter("zip");

	Map<String, String> zipMap = new HashMap<String,String>();
	zipMap.put("123456","대전 중구 오류동");
	zipMap.put("123123","서울 동작구 흑석동");
	zipMap.put("523431","대전 법2동 선비마을");
	zipMap.put("112233","천안 불당동 쌍용아파트");
	zipMap.put("332211","제주 서귀포시 어딘가");
	
	boolean flag = false;
	String addr = "";
	
	if(zip != null){
		if(zipMap.containsKey(zip)){
			addr = zipMap.get(zip);
			flag = true;
		}
		
		
	}
	
	/* Set<Map.Entry<String,String>> es  = zipMap.entrySet();
	Iterator<Map.Entry<String,String>> iter = es.iterator(); */
%>

<%!
	
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

<script>

function send(zip, addr1){
	
	
	opener.info_form.zip.value = zip ;
	opener.info_form.addr1.value = addr1 ;
	self.close();
}

	function find_addr(){
		
		
		location.href = "post_check.jsp?zip=" + inquiry.value;
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
    <FORM NAME="inquiry" METHOD="post" ACTION="post_check.jsp" onSubmit="return check();">
      <TR>
        <TD ALIGN=CENTER><br>
          우편번호 입력 : <INPUT NAME="zip" TYPE="text" style="width:120">
          <a href = "#" onClick = find_addr()><INPUT TYPE="image" src="./img/u_bt08.gif" hspace=10></a>
        </TD>
      </TR>
      <TR>
        <TD ALIGN=CENTER>
        ※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.
        </TD>
      </TR>
      <% 
      	if(flag){
      %>
      <TR>
        <TD><a href = "#" onClick =  "javascript:send('<%= zip %>','<%= addr %>')" ><%= zip %> <%=addr %> </a>
        </TD>
      </TR>
	<%} %>

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
