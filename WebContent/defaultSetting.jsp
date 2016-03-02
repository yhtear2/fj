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

<!-- common java script -->
<!-- Jquery 2.x 버젼 IE 8버전 이하는 지원안함 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<!-- Jquery ui를 사용하려면 필요한 자바스크립트 --> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<!-- Jquery를 이용한 Cookie를 사용하기위해 필요한 자바스크립트 -->
<script src="${project}/jquery.cookie.js"></script>

<!-- common style sheet -->
<!-- 셈플 확인 : http://getbootstrap.com/css/ -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>   



