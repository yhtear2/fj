<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/defaultSetting.jsp" %>
<%@ include file="setting.jsp" %>
<link href="${join}join.css" rel="stylesheet" type="text/css">
<script src="${join}script.js"></script>

<h2> ${page_modify} </h2>
<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		alert( modifyerror );
		//-->
	</script>
	<meta http-equiv="refresh" content="0; url=joinMain.do">		
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="joinMain.do"/>
</c:if>


















