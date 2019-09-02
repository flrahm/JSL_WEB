<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관</title>
<link href="css/common.css" rel="stylesheet">
<link href="css/mystyle.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/jquery-responsiveGallery.css">
</head>
<script>
jQuery.noConflict();
jQuery(document).ready(function($) {
  $('.slider').bxSlider({
	  mode: 'fade',
	  captions: true,
	  auto:true
  });
  
  $(".sitemap").click(function() {
		$(".sitewrap").slideDown();
	})
  $("#close").click(function() {
		$(".sitewrap").slideUp();
	})
	
  $(".nav > nav > .navi > li").hover(function() {
	  $(this).children(".navi2").stop().slideDown();
  }, function() {
	  $(this).children(".navi2").stop().slideUp();
  });
	
});
function adminlogout(){
	if(confirm("로그아웃하시겠습니까?")==true){
		location.href="admin?cmd=admin_logout";
	}else{
		return;
	}
}
function memberlogout(){
	if(confirm("로그아웃하시겠습니까?")==true){
		location.href="member?cmd=member_logout";
	}else{
		return;
	}	
}
</script>

<a href="admin?cmd=main"><img src="./img/logo.jpg" alt="로고" class="img"></a>
<div class="topnav">
				<ul>
					<li>
					<!-- 세션이 없을 때(로그인이 안되어있을 때) -->
					<c:if test="${empty session}">
					<li><a href="admin?cmd=admin_login">관리자로그인</a></li>
					<li><a href="member?cmd=member_login">이용자로그인</a></li>
					</c:if>
					<!-- 세션이 관리자일 때(admin1) -->
					<c:if test="${not empty session && session=='admin1'}">
					<li><a href="admin?cmd=admin_member_list">권한설정</a></li>
					<li><a href="javascript:adminlogout();">로그아웃</a></li>
					</c:if>
					<!-- 세션이 이용자일 때 -->
					<c:if test="${not empty session && session!='admin1'}">
					<li><a href="javascript:memberlogout();">로그아웃</a></li>
					</c:if>
					<!-- 세션이 없을 때(로그인이 안되어있을 때) 회원가입메뉴 접근 -->
					<c:if test="${empty session}">		
					<li><a href="member?cmd=member_insert">회원가입</a></li>
					</c:if>					
					<li><a href="javascript:void(0)" class="sitemap">외부링크</a></li>
				</ul>
			</div>
<div class="line"></div>
	<div class="header" style="position: relative; width: 100%; height: 50px; margin: 0 auto; z-index: 11; background: #7ba6c0">
		<div class="navigation">
			<div class="nav">
				<nav>
					<ul class="navi">
						<li><a href="#">자료이용안내</a>
							<ul class="navi2">
								<li><a href="#">대출/반납/연기</a></li>
								<li><a href="booklist?cmd=booklist">도서검색</a></li>
								<li><a href="#">신착자료검색</a></li>
								<li><a href="#">도서대출베스트</a></li>
							</ul></li>
						<li><a href="#">이용자마당</a>
							<ul class="navi2">
								<li><a href="#">도서관 위치/안내도</a></li>
								<li><a href="#">대출/반납/연기</a></li>
								<li><a href="notice?cmd=notice">공지사항</a></li>
								<li><a href="booklend?cmd=booklend_goChart">대출현황</a></li>
							</ul></li>
						<li><a href="#">내서재</a>
							<ul class="navi2">
								<li><a href="booklend?cmd=booklend_list">대출조회/연장신청</a></li>
								<li><a href="#">도서예약</a></li>
								<c:if test = "${not empty session && sessionScope.memberid }">
								<li><a href ="booklend?cmd=booklend_tendency">대출성향</a></li>
								</c:if>
								<c:if test="${not empty session && session!='admin1'}">
								<li><a href="#">희망도서신청</a></li>								
								<li><a href="member?cmd=member_modify">회원정보수정</a></li>
								</c:if>
							</ul>
						</li>					
					</ul>
				</nav>
			</div>
		</div>
		</div>

		<div class="line"></div>
<!-- ================================================  	 3d       ================================================== -->	
<div class="sitewrap">
		<span class="fa fa-close" id="close" style="cursor:pointer; z-index: 1;" ></span>
		
<div class="inner">
	<style type="text/css">

		.w-gallery{
			margin-top: 80px;
		}
	</style>
	
	<script type="text/javascript" src="lib/modernizr.custom.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="src/jquery.responsiveGallery.js"></script>
	<script type="text/javascript">
	
	jQuery.noConflict();
	jQuery(document).ready(function($) {
			$('.responsiveGallery-wrapper').responsiveGallery({
				animatDuration: 400,
				$btn_prev: $('.responsiveGallery-btn_prev'),
				$btn_next: $('.responsiveGallery-btn_next')
			});
		});
	function gotoWeb(url){
		window.open("http://"+url);
	}
</script>

<div class="w-gallery">
  <section id="responsiveGallery-container" class="responsiveGallery-container">
   <a class="responsiveGallery-btn responsiveGallery-btn_prev" href="javascript:void(0);"></a> 
   <a class="responsiveGallery-btn responsiveGallery-btn_next" href="javascript:void(0);"></a>
    <ul class="responsiveGallery-wrapper">
      <li class="responsiveGallery-item"> <a href="javascript:gotoWeb('www.google.com')" class="responsivGallery-link"><img src="assets/pics/0.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
        <div class="w-responsivGallery-info">
          <h2 class="responsivGallery-name">Google</h2>
          <h3 class="responsivGallery-position">www.google.com</h3>
        </div>
      </li>
      <li class="responsiveGallery-item"> <a href="javascript:gotoWeb('www.facebook.com')" class="responsivGallery-link"><img src="assets/pics/1.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
        <div class="w-responsivGallery-info">
          <h2 class="responsivGallery-name">Facebook</h2>
          <h3 class="responsivGallery-position">www.facebook.com</h3>
        </div>
      </li>
      <li class="responsiveGallery-item"> <a href="javascript:gotoWeb('www.twitter.com')" class="responsivGallery-link"><img src="assets/pics/2.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
        <div class="w-responsivGallery-info">
          <h2 class="responsivGallery-name">Twitter</h2>
          <h3 class="responsivGallery-position">www.twitter.com</h3>
        </div>
      </li>
      <li class="responsiveGallery-item"> <a href="javascript:gotoWeb('www.jquery.com')" class="responsivGallery-link"><img src="assets/pics/3.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
        <div class="w-responsivGallery-info">
          <h2 class="responsivGallery-name">jQuery</h2>
          <h3 class="responsivGallery-position">www.jquery.com</h3>
        </div>
      </li>
      <li class="responsiveGallery-item"> <a href="javascript:gotoWeb('www.jqueryui.com')" class="responsivGallery-link"><img src="assets/pics/4.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
        <div class="w-responsivGallery-info">
          <h2 class="responsivGallery-name">jQuery UI</h2>
          <h3 class="responsivGallery-position">www.jqueryui.com</h3>
        </div>
      </li>
      <li class="responsiveGallery-item"> <a href="javascript:gotoWeb('www.w3c.org')" class="responsivGallery-link"><img src="assets/pics/5.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
        <div class="w-responsivGallery-info">
          <h2 class="responsivGallery-name">W3C</h2>
          <h3 class="responsivGallery-position">www.w3c.org</h3>
        </div>
      </li>
      <li class="responsiveGallery-item"> <a href="javascript:gotoWeb('www.github.com')" class="responsivGallery-link"><img src="assets/pics/6.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
        <div class="w-responsivGallery-info">
          <h2 class="responsivGallery-name">Github</h2>
          <h3 class="responsivGallery-position">www.github.com</h3>
        </div>
      </li>
      <li class="responsiveGallery-item"> <a href="javascript:gotoWeb('www.linkedin.com')" class="responsivGallery-link"><img src="assets/pics/7.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
        <div class="w-responsivGallery-info">
          <h2 class="responsivGallery-name">Linkedin</h2>
          <h3 class="responsivGallery-position">www.linkedin.com</h3>
        </div>
      </li>
      <li class="responsiveGallery-item"> <a href="javascript:gotoWeb('www.tumblr.net')" class="responsivGallery-link"><img src="assets/pics/8.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
        <div class="w-responsivGallery-info">
          <h2 class="responsivGallery-name">Tumblr</h2>
          <h3 class="responsivGallery-position">www.tumblr.net</h3>
        </div>
      </li>
    </ul>
  </section>
</div>
</div></div>