<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 통합 세팅값 삽입 -->
<%@ include file="/defaultSetting.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- 메인 css 및 자바스크립트 삽입 -->
		<link href="${main}/main.css" rel="stylesheet" type="text/css">
		<script src="${main}/main.js"></script>
	</head>
	<body onload="wsSendMassge()">
		<div class="main_menu">
			<input type="hidden" class="menu_status" value="0">
			<input type="hidden" class="m" value="${menu}">
			<input type="hidden" id="memId" value="${sessionScope.memId}">
			<input type="hidden" id="cookieId" value="">
			<div class="main_logo" onclick="window.location='main.do'">
				<img id="logo" src="${images}/main_logo.png">
				<img id="logo_small" src="${images}/sub_logo.png">
			</div>
			<div class="main_sign">
				<!-- 로그인 X일 때 -->
				<c:if test="${sessionScope.memId == null}">
				<div class="main_login" onclick="window.location='joinMain.do'">
					<img src="${images}/main_logou_up.png" class="images_main"> <span>Login</span>
				</div>
				<div class="main_singup" onclick="window.location='joinInputForm.do'">
					<img src="${images}/main_sign_up.png" class="images_main"> <span>SingUp</span>
				</div>
				<div class="main_signsub">
					<a href="joinMain.do"><img src="${images}/main_logou_up.png" class="images_main"></a>
					<a href="joinInputForm.do"><img src="${images}/main_sign_up.png" class="images_main"></a>
				</div>
				</c:if>
				<!-- 로그인 O일 때 -->
				<c:if test="${sessionScope.memId != null}">
				<div class="main_logon">
					<span>${name}</span>
					<span class="glyphicon glyphicon-log-out logout" onclick="window.location='joinLogout.do'"></span>
					<span class="glyphicon glyphicon-send messageicon" onclick="window.location='messageList.do'"></span>
				</div>
				</c:if>
			</div>
			<!-- 선택 메뉴 -->
			<div class="main_sub">
				<c:if test="${sessionScope.memId == null}">
				<div class="main_submanu" onclick="window.location='joinMain.do'">
					<div><img src="${images}/main_up_05.png" class="subimg_first"></div> <span>쪽지함</span></div>
				</c:if>
				<c:if test="${sessionScope.memId != null}">
				<div class="main_submanu" onclick="window.location='messageList.do'">
					<div><img src="${images}/main_up_05.png" class="subimg_first"></div> <span>쪽지함</span></div>
				</c:if>
				<div class="main_submanu">
					<div><img src="${images}/main_up_01.png" class="subimg"></div> <span>MyPage</span></div>
				<div class="main_submanu">
					<div><img src="${images}/main_up_04.png" class="subimg"></div> <span>게시판</span></div>
				<div class="main_submanu">                          
					<div><img src="${images}/main_up_03.png" class="subimg"></div> <span>채용공고</span></div>
				<div class="main_submanu"><i class="fa fa-github"></i>Git</div>
			</div>
		</div>
		<!-- main_menu2는 사이드바의 상세메뉴 - 평소에는 z-index:0으로 숨겨져있다 -->
		<div class="main_menu2">
			<c:if test="${sessionScope.memId == null}">
				<h3>로그인</h3>
				<a href="#" onclick="window.location='joinMain.do'">로그인 해주세요</a>
			</c:if>
			<c:if test="${sessionScope.memId != null}">
				<h3>쪽지함</h3>
				<a href="#" onclick="window.location='messageForm.do'">새쪽지</a>
				<a href="#" onclick="window.location='messageList.do'">받은쪽지함</a>
				<a href="#" onclick="window.location='messageListSend.do'">보낸쪽지함</a>
			</c:if>
		</div>
		<div class="main_menu2">
			<!-- 개인회원, 기업회원, 관리자가 서로 다른 메뉴가 나오게 변경 -->
			<c:if test="${sessionScope.memId == null}">
				<h3>로그인</h3>
				<a href="#" onclick="window.location='joinMain.do'">로그인 해주세요</a>
			</c:if>
			<c:if test="${sessionScope.memId != null}">
				<c:if test="${sessionScope.member_flag == 1}">
					<h3>MyPage</h3>
					<a href="#" onclick="window.location='joinMain.do'">회원정보 수정</a>
					<a href="#" onclick="window.location='resome_list.do'">이력서 관리</a>
					<a href="#" onclick="window.location='main.do'">입사지원 현황</a>
				</c:if>
				<c:if test="${sessionScope.member_flag == 2}">
					<h3>MyPage</h3>
					<a href="#" onclick="window.location='joinMain.do'">회원정보 수정</a>
					<a href="#" onclick="window.location='compInputCheck.do'">기업정보 입력</a>
					<a href="#" onclick="window.location='compView.do'">기업정보 보기</a>
					<a href="#" onclick="window.location='messageList.do'">쪽지함</a>
				</c:if>
				<c:if test="${sessionScope.member_flag == 3}">
					<h3>Admin</h3>
					<a href="#" onclick="window.location='memberManagementList.do'">회원관리</a>
					<a href="#" onclick="window.location='messageList.do'">쪽지함</a>
				</c:if>
			</c:if>
		</div>
		<div class="main_menu2">
			<h3>게시판</h3>
			<a href="#" onclick="window.location='boardlist.do'">All</a>
			<a href="#" onclick="window.location='searchboardlist.do?category=공지사항'">공지사항</a>
			<a href="#" onclick="window.location='searchboardlist.do?category=사는얘기'">사는얘기</a>
			<a href="#" onclick="window.location='searchboardlist.do?category=정보나눔'">정보나눔</a>
			<a href="#" onclick="window.location='searchboardlist.do?category=스터디'">스터디</a>
		</div>
		<div class="main_menu2">
			<h3>채용공고</h3>
			<a href="#" onclick="window.location='recruitList.do'">채용공고</a>
		</div>
		<div class="main_menu2">
			<a href="#" onclick="window.open('https://github.com/yhtear2/fj.git')">GitHub</a>
		</div>
		<div class="main_page">
			<div>
				<jsp:include page='${page}.jsp'/>
			</div>
		</div>
				
	</body>
</html>