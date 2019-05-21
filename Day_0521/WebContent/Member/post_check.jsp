<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String addr = request.getParameter("addr");
	
	Map<String,String> zip = new HashMap<String,String>();
	zip.put("12345","대전 중구 오류동");
	zip.put("11111","대전 대덕구 송촌동");
	zip.put("22222","서울 강남구 오류동");
	zip.put("33333","서울 동작구 흑석동");
	zip.put("44444","부산 서면");
	zip.put("55555","전주시 어딘가");
	zip.put("66666","제주 서귀포");
	zip.put("77777","아제로스 스톰윈드왕국");
	zip.put("88888","아제로스 줄아만");
	zip.put("99999","아제로스 달라란");
	
	List<String[]> zipList = null;
	
	if(addr != null && !addr.equals("")){
	Set<Map.Entry<String,String>> zipSet = zip.entrySet();
	Iterator<Map.Entry<String,String>> iter = zipSet.iterator();
	
	String[] zna = null;
	zipList = new ArrayList<String[]>();
	
	while(iter.hasNext()){
		Map.Entry<String,String> en = iter.next();
		if(en.getValue().contains(addr)){
			zna = new String[2];
			zna[1] = en.getKey();
			zna[0] = en.getValue();
			zipList.add(zna);
		}
	}
	
	}
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
	function send(){
		
		inquiry.submit();
	}
	
	function confirm(zipcode , addr1){
		
		opener.userinfo.zip.value = zipcode;
		opener.userinfo.addr1.value = addr1;
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
    <FORM NAME="inquiry" METHOD="post" ACTION="post_check.jsp" onSubmit="return check();">
      <TR>
        <TD ALIGN=CENTER><br>
      <form method = "get" name = "addrForm" action = "post_check.jsp">
          동이름 입력 : <INPUT NAME="addr" TYPE="text" style="width:120">
      </form>
          <a href = "#" onClick = "send()"><INPUT TYPE="image" src="./img/u_bt08.gif" hspace=10></a>
        </TD>
      </TR>
      <TR>
        <TD ALIGN=CENTER>
        ※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.
        </TD>
      </TR>

	<%
	if(zipList != null){
		for(int i = 0; i < zipList.size(); i++){
			String[] zipAddr = zipList.get(i);
	%>
      <TR>
        <TD>
        <a href = "javascript:confirm('<%= zipAddr[1] %>','<%= zipAddr[0] %>')" ><%=zipAddr[1] %> &nbsp <%=zipAddr[0] %></a>
        </TD>
      </TR>
	<%}} %>
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
