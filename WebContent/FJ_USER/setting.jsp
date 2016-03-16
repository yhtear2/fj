<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="/fj/FJ_USER/jquery-1.12.0.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fnc" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link rel="stylesheet" href="/fj/FJ_USER/style.css">

	<c:set var="project" value = "/fj/FJ_USER/"/>
	
	
<%@ include file = "/defaultSetting.jsp" %> 

<c:set var="page_userwrite" value="이력서 작성"/> 
<c:set var="page_userdelete" value="삭제"/>
<c:set var="page_usermodify" value="수정"/> 

