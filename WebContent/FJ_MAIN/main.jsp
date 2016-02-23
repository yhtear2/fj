<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("email", "고병완");
	session.setAttribute("passwd", "123");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>InCoding</title>
		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.1/css/font-awesome.min.css">
		<link href="/fj/FJ_MAIN/defult.css" rel="stylesheet" type="text/css">
		<script src="/fj/jquery-1.12.0.js"></script>
		<script type="text/javascript">
			$(function(){
				if( $('.m').val() == "main" ) {
					$('.main_submanu').on('click',function() {
						var idx = $('.main_submanu').index($(this));
						if(	$('.menu_status').val() == 0) {
							$('.main_menu').stop().animate({'width':'50px'}, function(){
								$('.main_logo').stop().animate({'background-size':'50px'});
								$('.main_menu').stop().animate({'width':'50px'});
								$(".main_menu2").css({"z-index":"0"});
								$('.main_submanu').css({"text-align":"left"});
								$(".main_menu2").eq(idx).css({"z-index":"2"});
								$('.menu_status').val(1);
							});
						} else { 
							$('.main_menu').stop().animate({'width':'200px'}, function() {
								$(".main_menu2").css({"z-index":"0"});
								$('.main_submanu').animate({"text-align":"center"});
								$(".main_menu2").eq(idx).css({"z-index":"2"});
							}).animate({'width':'50px'});
						}
					});
				} else {
					var this_page = 0;
					if($('.m').val() == "member") this_page = 0;
					if($('.m').val() == "board") this_page = 1;
					$('.main_menu').css({'width':'50px'});
					$(".main_menu2").css({"z-index":"0"});
					$(".main_menu2").eq(this_page).css({"z-index":"2"});
					$('.main_submanu').on('click',function() {
						var idx = $('.main_submanu').index($(this));
						$('.main_menu').stop().animate({'width':'200px'},
							function() {
								$(".main_menu2").css({"z-index":"0"});
								$(".main_menu2").eq(idx).css({"z-index":"2"});
							}
						).animate({'width':'50px'});
					});
				}
			});
		</script>
	</head>
	<body id="main">
		<input type="hidden" class="menu_status" value="0">
		<input type="hidden" class="m" value="${menu}">
		<!-- 메인 메뉴 -->
		<div class="main_menu">
			<div class="main_logo"></div>
			<div class="main_sign">
				<div class="main_login" onclick="window.location='joinMain.do'">Login</div>
				<div class="main_singup">SingUp</div>
			</div>
			<div class="main_sub">
				<div class="main_submanu">MyPage</div>
				<div class="main_submanu">게시판</div>
				<div class="main_submanu">채용공고</div>
				<div class="main_submanu">QA</div>
				<!-- 2016/02/02 추가 - 송윤호 -->
				<div class="main_submanu">기업정보 입력</div>
				<div class="main_submanu"><i class="fa fa-github"></i>Git</div>
			</div>
		</div>
		
		<!-- main_menu2는 사이드바의 상세메뉴 - 평소에는 z-index:0으로 숨겨져있다 -->
		<div class="main_menu2">
		<a href="#" onclick="window.location='main.do'">마이페이지</a>	
		</div>
		<div class="main_menu2">
			<a href="#" onclick="window.location='list.do'">게시판</a><br>
		</div>
		<div class="main_menu2">
			<a href="#" onclick="window.location='recruitList.do'">채용공고</a>
		</div>
		<div class="main_menu2">
			<a href="#">Q&A</a>
		</div>
		<div class="main_menu2">
			<a href="#" onclick="window.location='compInputCheck.do'">기업정보입력</a>
		</div>
		
		<div class="main_page">
			<div>
				<jsp:include page='${page}.jsp'/>
			</div>
			<div style="font-size: small; margin-top: 50px;">Copyright © 1998-2016 KH Information Educational Institute All Right Reserved</div>
		</div>
			
	</body>
</html>