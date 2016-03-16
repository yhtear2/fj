	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/defaultSetting.jsp" %>
<%@ include file="setting.jsp" %>
<link href="${join}join.css" rel="stylesheet" type="text/css">
<script src="${join}script.js"></script>

<h2> ${page_login} </h2>

<c:if test="${result == -1}">
	<script type="text/javascript">
		<!--
		erroralert( iderror );
		//-->
	</script>		
</c:if>

<c:if test="${result == 0}">	
	<script type="text/javascript">
		<!--
		erroralert( passwderror );
		//-->
	</script>
</c:if>

<c:if test="${result == 1}">
	<script type="text/javascript">
	<!--
		window.location.href = "main.do";
	//-->
	</script>
</c:if>











