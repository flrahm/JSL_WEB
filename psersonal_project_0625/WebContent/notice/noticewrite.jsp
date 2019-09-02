<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">HyunSu 공지사항</h2>
	</div>

	<div class="write-form">
		<table summery="공지사항 글쓰기 테이블 입니다">
			<caption class="readonly">공지사항 입력폼</caption>
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
				<form name="my" method="post" action="writeinsert.do" enctype="multipart/form-data" onsubmit="return formcheck();">
					<tr>
						<th>제목</th>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content"></textarea></td>
					</tr>
					<tr>
						<th>첨부</th>
						<td><input type="file" name="appfile"></td>
						
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="writer"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pass"></td>
					</tr>
				<tr>
					<td colspan="2"><input type="submit" value="전송"
						class="btn-write"> <input type="button" value="목록"
						class="btn-reset"
						onclick="javascript:location.href='notice.do'"></td>
				</tr>
				</form>
			</tbody>
		</table>
	</div>

</div>

<script>
	function formcheck() {
		
		if(my.title.value=="") {
			alert("제목입력하세요");
			my.title.focus();
			return false;
		}
		
		if(my.content.value=="") {
			alert("내용입력하세요");
			my.content.focus();
			return false;
		}
		
		if(my.pass.value=="") {
			alert("비밀번호를 입력하세요");
			my.pass.focus();
			return false;
		}
		
		return true;
	}
</script>

<%@ include file="../footer.jsp"%>















