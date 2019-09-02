<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>도서관</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="A method for responsive tables">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1">
<link rel="stylesheet" href="css/monthly.css">
<link rel="stylesheet" href="css/mystyle.css">
<link rel="stylesheet" href="./css/lightslider.css" />
<meta name="description" content="">
<script type="text/javascript" src="lib/modernizr.custom.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="src/jquery.responsiveGallery.js"></script>
<script type="text/javascript">
	$(function() {
		$('.responsiveGallery-wrapper').responsiveGallery({
			animatDuration : 400,
			$btn_prev : $('.responsiveGallery-btn_prev'),
			$btn_next : $('.responsiveGallery-btn_next')
		});
	});
</script>
<style>
ul {
	list-style: none outside none;
	padding-left: 0;
	margin: 0;
}

.demo .itemi {
	margin-bottom: 60px;
}

.content-slider li {
	background-color: #FFFFFF;
	text-align: center;
	color: #FFF;
}

.demo {
	width: 800px;
}
</style>
<style>
.bear {
	margin: 10px 405px;
	position: relative;
	width:100%;
}

.jb-wrap .img2 {
	width: 1500xp;
	vertical-align: middle;
	margin-left:-125%;
}

.jb-text {
	padding: 5px 10px;
	background-color: color:rgba(0, 0, 0, 0);;
	text-align: center;
	position: absolute;
	bottom: 30%;
	margin: 0 80px;
}
</style>
</head>
	<div class="bear">
		<div class="jb-wrap">
			<img src="./img/be1.jpg" class="img2">
			<div class="jb-text">
<!-- ================================================  	 도서검색       ================================================== -->
<script>
function goSearch(){
	searchform.action="booklist?cmd=booklist_search";
	searchform.submit();
}
</script>
			<form name="searchform" method="post">
			<input type="hidden" name="search" value="bookname">			
				<span class='green_window'>
					<input type='text' name="key" class='input_text' placeholder="검색어를 입력하세요."> 
					<a href="javascript:goSearch();"><img src="./img/search_icon.gif" alt="검색" class="search_01"></a>
				</span>
			</form>
			
			</div>
		</div>
	</div>
<!-- ================================================     달력        ================================================== -->
<div class="ka">
	<div class="dora">
		<div class="sub">
			<div class="tiday">
				<div
					style="max-width: 100%; height: 5%; position: relative; display: inline-block;">
					<div class="monthly" id="mycalendar"></div>
				</div>
				<br> <br> <br>
				<!--		==================================		Js		===================== 			-->
				<script type="text/javascript" src="js/jquery.js"></script>
				<script type="text/javascript" src="js/monthly.js"></script>
				<script type="text/javascript">
					$(window)
							.load(
									function() {

										$('#mycalendar').monthly({
											mode : 'event',
											xmlUrl : 'events.xml'
										});

										$('#mycalendar2').monthly({
											mode : 'picker',
											target : '#mytarget',
											setWidth : '250px',
											startHidden : true,
											showTrigger : '#mytarget',
											stylePast : true,
											disablePast : true
										});
										switch (window.location.protocol) {
										case 'http:':
										case 'https:':
											break;
										case 'file:':
											alert('Just a heads-up, events will not work when run locally.');
										}
									});
				</script>
			</div>
			<!-- ================================================   공지사항       ================================================== -->
			<div class="bbs_wrapi">
				<div class="bbs_left">
					<h2 class="title">도서관 이용안내</h2>
					<ul>
						<li>◆ 휴관일 : 매주 월요일,공휴일,국경일</li>
						<li>◆ 화 ~ 금 09:00 ~ 22:00</li>
						<li>◆ 토,일 09:00 ~ 20:00</li>
					</ul>
				</div>
			</div>
			<div class="bbs_wrap">
				<div class="bbs_right">
					<h2 class="title">공지사항</h2>
					<c:forEach var="list" items="${list}">
						<ul>
							<li>
		◆ <a href="notice?cmd=notice_view&idx=${list.idx}">${list.subject}</a>
							</li>
						</ul>
					</c:forEach>
					<ul>
						<li style="text-align: right"><a href="notice?cmd=notice">더보기</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- ================================================   슬라이드       ================================================== -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="./js/lightslider.js"></script>
	<script>
		jQuery.noConflict();
		jQuery(document).ready(function($) {
			$("#content-slider").lightSlider({
				item : 5,
				loop : true,
				keyPress : true
			});
			$('#image-gallery').lightSlider({
				gallery : true,
				item : 5,
				thumbItem : 5,
				slideMargin : 0,
				speed : 500,
				auto : true,
				loop : true,
				onSliderLoad : function() {
					$('#image-gallery').removeClass('cS-hidden');
				}
			});
		});
	</script>
	<div class="itemi">
		<ul id="content-slider" class="content-slider">
			<li><img src="img/book1.jpg" alt=""></li>
			<li><img src="img/book2.jpg" alt=""></li>
			<li><img src="img/bb1.jpg" alt=""></li>
			<li><img src="img/bb2.png" alt=""></li>
			<li><img src="img/be1.jpg" alt=""></li>
			<li><img src="img/be2.jpg" alt=""></li>
		</ul>
	</div>
</div>
<!-- ================================================   힘드러       ================================================== -->
<%@ include file="include/footer.jsp"%>