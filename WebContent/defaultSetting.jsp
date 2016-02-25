<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<script src="${project}/jquery-1.12.0.js"></script>
<script src="${js}/common.js"></script>
<script src="/fj/FJ_BOARD/script.js"></script>   

<!-- common style sheet -->
<!-- 셈플 확인 : https://www.bootstrapcdn.com/bootswatch/?theme=15 -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.6/cerulean/bootstrap.min.css" integrity="sha256-Ucf/ylcKTNevYP6l7VNUhGLDRZPQs1+LsbbxuzMxUJM= sha512-FW2XqnqMwERwg0LplG7D64h8zA1BsxvxrDseWpHLq8Dg8kOBmLs19XNa9oAajN/ToJRRklfDJ398sOU+7LcjZA==" crossorigin="anonymous">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.1/css/font-awesome.min.css">


<!-- 태그 에디터 불러오기 -->   
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<link href="/fj/FJ_BOARD/jquery.tagit.css" rel="stylesheet">    
<link href="/fj/FJ_BOARD/tagit.ui-zendesk.css" rel="stylesheet">         
<script src="/fj/FJ_BOARD/tag-it.js" type="text/javascript" charset="utf-8"></script>
   
 
<!-- 글쓰기 에디터 불러오기 -->
<!-- include libraries(jQuery, bootstrap) --> <!-- include summernote css/js-->   
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>   
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
 
