<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">HyunSu 갤러리</h2>
		<div class="sub-search">
			<form name="my" method="post" action="gallery-search.jsp" onsubmit="return check()">
				<select name="sel" class="sel">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="cont" class="text">
				<input type="submit" value="검색" class="btn">
			</form>
		</div>
	</div>
	
		<ul class="sub-content">
			<li>
				<img src="images/jsl.jpg" alt="모집사진">
				<p class="p26">
					<a href="galleryview.do">
						<span class="gallery-title">모집안내</span>
					</a>
						<span class="hit">조회수 : 120</span>
				</p>
			</li>
			<li>
				<img src="images/jsl.jpg" alt="모집사진">
				<p class="p26">
					<a href="#">
						<span class="gallery-title">모집안내</span>
					</a>
						<span class="hit">조회수 : 120</span>
				</p>
			</li>
			<li>
				<img src="images/jsl.jpg" alt="모집사진">
				<p class="p26">
					<a href="#">
						<span class="gallery-title">모집안내</span>
					</a>
						<span class="hit">조회수 : 120</span>
				</p>
			</li>
			<li>
				<img src="images/jsl.jpg" alt="모집사진">
				<p class="p26">
					<a href="#">
						<span class="gallery-title">모집안내</span>
					</a>
						<span class="hit">조회수 : 120</span>
				</p>
			</li>
			<li>
				<img src="images/jsl.jpg" alt="모집사진">
				<p class="p26">
					<a href="#">
						<span class="gallery-title">모집안내</span>
					</a>
						<span class="hit">조회수 : 120</span>
				</p>
			</li>
			<li>
				<img src="images/jsl.jpg" alt="모집사진">
				<p class="p26">
					<a href="#">
						<span class="gallery-title">모집안내</span>
					</a>
						<span class="hit">조회수 : 120</span>
				</p>
			</li>
			<li>
				<img src="images/jsl.jpg" alt="모집사진">
				<p class="p26">
					<a href="#">
						<span class="gallery-title">모집안내</span>
					</a>
						<span class="hit">조회수 : 120</span>
				</p>
			</li>
			<li>
				<img src="images/jsl.jpg" alt="모집사진">
				<p class="p26">
					<a href="#">
						<span class="gallery-title">모집안내</span>
					</a>
						<span class="hit">조회수 : 120</span>
				</p>
			</li>
			<li>
				<img src="images/jsl.jpg" alt="모집사진">
				<p class="p26">
					<a href="#">
						<span class="gallery-title">모집안내</span>
					</a>
						<span class="hit">조회수 : 120</span>
				</p>
			</li>
			<li>
				<img src="images/jsl.jpg" alt="모집사진">
				<p class="p26">
					<a href="#">
						<span class="gallery-title">모집안내</span>
					</a>
						<span class="hit">조회수 : 120</span>
				</p>
			</li>
			<li>
				<img src="images/jsl.jpg" alt="모집사진">
				<p class="p26">
					<a href="#">
						<span class="gallery-title">모집안내</span>
					</a>
						<span class="hit">조회수 : 120</span>
				</p>
			</li>
			<li>
				<img src="images/jsl.jpg" alt="모집사진">
				<p class="p26">
					<a href="#">
						<span class="gallery-title">모집안내</span>
					</a>
						<span class="hit">조회수 : 120</span>
				</p>
			</li>
		</ul>
		
		<div class="paging">
			<ul>
				<li><a href="#">이전</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">다음</a></li>
			</ul>
			<a href="gallery-write.jsp" class="btn-write">글쓰기</a>
		</div>

</div>

<script>
	function check() {
		if(my.cont.value=="") {
			alert("검색단어입력하세요");
			my.cont.focus;
			return false;
		}
		return true;
	}
</script>

<%@ include file="../footer.jsp"%>















