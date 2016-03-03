<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/defaultSetting.jsp" %>   
    
    
 <!-- 홍석 : 디폴트세팅에 있는거 여기다 다시 넣음 (다른곳에서 오류나고 필요 없음) -->
<link href="/fj/FJ_BOARD/jquery.tagit.css" rel="stylesheet">    
<link href="/fj/FJ_BOARD/tagit.ui-zendesk.css" rel="stylesheet">         
<script src="/fj/FJ_BOARD/tag-it.js" type="text/javascript" charset="utf-8"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
 
<script src="/fj/FJ_BOARD/script.js"></script>              
<!-- 여기까지 새로 넣었음 -->



<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="http://okky.kr/assets/favicon-4ddd8035b72404da5a8c298cbaacad86.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="http://okky.kr/assets/icon_57x57-5611bd33d9f2b2d84c22219e248455b6.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="http://okky.kr/assets/icon_114x114-b2b627dfde8a040fe54fd257244ba191.png">
<link   
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta property="og:image"
	content="http://okky.kr/assets/okky_logo_fb-cea175ff727ef14a4d8be0e68cff730a.png">

<link rel="stylesheet"
	href="http://okky.kr/assets/application-178a471b205e52821f985abddea1ac34.css">
 

<!--[if lt IE 9]>
            <script src="http://okky.kr/assets/libs/html5-ca664f64318d191265abf57fdf467aec.js" type="text/javascript" ></script>
        <![endif]-->

<meta name="layout" content="main">

<style type="text/css"></style>   

    

<c:set var="fj_project" value="/fj/FJ_BOARD"/>

<c:set var="page_list" value="글 목 록"/>
<c:set var="page_write" value="글 작 성"/>
<c:set var="page_content" value="글 보 기"/>
<c:set var="page_modify" value="글 수 정"/>  
<c:set var="page_delete" value="글 삭 제"/>	
<c:set var="page_default" value="기본 페이지"/>

<c:set var="msg_list_x" value="게시판에 글이 없습니다. 글쓰기를 눌러 주세요."/>
<c:set var="msg_modify" value="수정할 정보를 입력하세요"/>   

<c:set var="str_count" value="전체글"/>
<c:set var="str_write" value="글쓰기"/>
<c:set var="str_hstag" value=""/>
<c:set var="str_subject" value="글제목"/>
<c:set var="str_board_num" value="작성자"/>
<c:set var="str_reg_date" value="작성일"/>
<c:set var="str_read_count" value="조회수"/>
<c:set var="str_re_count" value="리플 수"/>
<c:set var="str_email" value="이메일"/>
<c:set var="str_content" value="내&nbsp;&nbsp;&nbsp;용"/>
<c:set var="str_recom_count" value="좋아요 수"/>
<c:set var="str_bad_count" value="싫어요 수"/>
<c:set var="str_category" value="카테고리"/> 

	
<c:set var="str_list" value="글목록"/>

<c:set var="btn_write" value="글등록"/> 
<c:set var="btn_reply" value="등록 "/> 
<c:set var="btn_cancel" value="취소"/>  
<c:set var="btn_list" value="목록보기"/>
<c:set var="btn_modify" value="수정"/>
<c:set var="btn_modifies" value="재등록"/>
<c:set var="btn_delete" value="글삭제"/>
<c:set var="btn_re_count" value="댓글쓰기"/>


   










