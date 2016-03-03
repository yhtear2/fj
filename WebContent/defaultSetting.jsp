<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 

	******************************  
		디폴트 세팅은 건들지 말아주세요 
	******************************
	
 -->

<!-- tab library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fnc" uri="http://java.sun.com/jsp/jstl/functions" %>
 
  	
<!-- variable -->
<c:set var="project" value="/fj"/>
<c:set var="js" value="${project}/js"/>
<c:set var="images" value="${project}/images"/>
<c:set var="main" value="${project}/FJ_MAIN"/>
<c:set var="join" value="${project}/FJ_JOIN/"/>
<c:set var="css" value="${project}/css/"/>


<!-- common style sheet -->
<!-- 셈플 확인 : http://getbootstrap.com/css/ -->
<link href="${css}/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet"> 


<!-- common java script -->
<!-- bootstrap 자바스크립트 사용 (섬머노트에 쓰임 ) -->
<script src="${js}/bootstrap.js"></script> 

<!-- Jquery 2.x 버젼 IE 8버전 이하는 지원안함 -->
<script src="${js}/jquery-2.2.1.min.js"></script>

<!-- Jquery ui를 사용하려면 필요한 자바스크립트  	--> 
<script src="${js}/jquery-ui.min.js"></script>

<!-- 섬머노트 이용하기 위한 자바스크립트 -->
<script src="${js}/summernote.js"></script>

<!-- Jquery를 이용한 Cookie를 사용하기위해 필요한 자바스크립트 -->
<script src="${js}/jquery.cookie.js"></script>


