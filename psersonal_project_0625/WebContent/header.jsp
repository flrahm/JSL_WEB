<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HyunSu</title>
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/common.css" rel="stylesheet">
	<link href="css/mystyle.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

  <script>
    $(document).ready(function(){
      $('.slider').bxSlider({
    	  mode: 'fade',
    	  captions: true
      });
    });
  </script>
</head>
<body>
	<div class="header">
		<header>
			<div class="topnav">
				<ul>
					<li><a href="login.do">로그인</a></li>
					<li><a href="member.do">회원가입</a></li>
				</ul>
			</div>
			<div class="navigation">
				<h1 class="logo"><a href="index.do">LOGO</a></h1>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="about.do">내소개</a></li>
							<li><a href="gallery.do">갤러리</a></li>
							<li><a href="portfolio.do">포트폴리오</a></li>
							<li><a href="qa.do">질문답변</a></li>
							<li><a href="notice.do">공지사항</a></li>
							<li><a href="shop.do">쇼핑몰</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>
	
	<div class="line"></div>