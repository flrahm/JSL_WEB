<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">hyunsu 쇼핑몰</h2>
		<div class="sub-search">
			<form name="my" method="post" action="gallery-search.jsp" onsubmit="return check()">
				<input type="text" name="cont" class="text">
				<button class="btn">검색</button>
			</form>
		</div>
	</div>
	
		<ul class="sub-content">
			<li>
				<a href="shopview.do">
					<img src="images/shop1.jpg" alt="">
					<p class="p26">
							<span class="shop-title">상품제목</span>
							<span class="price">74,800 원</span>
					</p>
				</a>
			</li>
			<li>
				<a href="shopview.do">
					<img src="images/shop2.jpg" alt="">
					<p class="p26">
						
							<span class="gallery-title">상품제목</span>
							<span class="price">74,800 원</span>
					</p>
				</a>
			</li>
			<li>
				<a href="shopview.do">
					<img src="images/shop3.jpg" alt="">
					<p class="p26">
						
							<span class="gallery-title">상품제목</span>
							<span class="price">74,800 원</span>
					</p>
				</a>
			</li>
			<li>
				<a href="shopview.do">
					<img src="images/shop4.jpg" alt="">
					<p class="p26">
						
							<span class="gallery-title">상품제목</span>
							<span class="price">74,800 원</span>
					</p>
				</a>
			</li>
			<li>
				<a href="shopview.do">
					<img src="images/shop5.jpg" alt="">
					<p class="p26">
						
							<span class="gallery-title">상품제목</span>
							<span class="price">74,800 원</span>
					</p>
				</a>
			</li>
			<li>
				<a href="shopview.do">
					<img src="images/shop6.jpg" alt="">
					<p class="p26">
						
							<span class="gallery-title">상품제목</span>
							<span class="price">74,800 원</span>
					</p>
				</a>
			</li>
			<li>
				<a href="shopview.do">
					<img src="images/shop7.jpg" alt="">
					<p class="p26">
						
							<span class="gallery-title">상품제목</span>
							<span class="price">74,800 원</span>
					</p>
				</a>
			</li>
			<li>
				<a href="shopview.do">
					<img src="images/shop8.jpg" alt="">
					<p class="p26">
						
							<span class="gallery-title">상품제목</span>
							<span class="price">74,800 원</span>
					</p>
				</a>
			</li>
		</ul>
		
		<div class="paging">
			
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















